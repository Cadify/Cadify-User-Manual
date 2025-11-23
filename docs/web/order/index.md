# RFQ & Order Workflows

This document describes the Request-for-Quote (RFQ), Cancel and Order flows implemented by the Cadify plugin, including ERP-related behaviour.

---

## Summary

In Cadify, products can be either **ERP-managed** or **standard (non-ERP)**, but both use the same **project-based RFQ flow**:

- From any product page the user can:
  - create a project with a one-click RFQ, **or**
  - add the product as an item to a new or existing project and request a quote later.
- For **ERP-managed** products the system automatically detects ERP items and adjusts the UI:
  - Cancel and Order buttons are hidden.
  - RFQ still works and is processed on the server / ERP side in the background.
  - Status and history are driven by ERP webhooks and are visible on the project page and in the project list.
- For **non-ERP** products:
  - RFQ requests appear in the admin area, where the store owner can accept or cancel them.
  - After acceptance, the customer sees that the quote is approved and can either place an order based on the quote or cancel the request.

**Views/components involved:**

- `Plugins/nopCommerce.Plugin.Cadify/Views/ShoppingCart/Project.cshtml` — project detail page
- `Plugins/nopCommerce.Plugin.Cadify/Views/Project/_ProjectListDataTable.cshtml` — project list (DataTable) group headers
- `Plugins/nopCommerce.Plugin.Cadify/Views/Shared/Components/ProjectSelector/Default.cshtml` — project selector component

**Main server endpoints:**

- `POST /Project/GetProject` (form POST) — `QuoteRequest` (RFQ) and `ResetQuoteRequest` (Cancel)
- `POST /Project/CreateOrder` — `CreateOrder` (orders from a project)
- `GET /Project/GetProjectRecord?projectGuid={guid}` — returns project JSON (polled by the page)
- `GET /Project/GetProjectHistory?projectGuid={guid}` — project history (polled)

**Models:**

- `CadifyProjectListModel` and `CadifyProjectDetailsModel` include `HasErpProducts` (boolean) to indicate that at least one project item belongs to a product with an ERP id.

---

## End-to-end RFQ lifecycle (non-ERP projects)

This section describes the **basic flow** for standard (non-ERP) projects: the customer sends a quote request, the quote is accepted or cancelled by the store admin, and then the customer can order or cancel.

### 1. Customer sends a quote request

From a **project detail page** or the **project list**:

1. The customer clicks **RFQ** on the project.
2. The client sends a `QuoteRequest` POST to `POST /Project/GetProject` with the project GUID.
3. For non-ERP projects, client scripts:
   - Update the RFQ button caption (e.g. `"Quote in Progress"` → `"Quote Requested"`).
   - Adjust the appearance (e.g. disabled state / CSS class) to show that the request is pending.
4. Project state flags such as `IsQuoteRequested` are updated server-side.
5. Project history records the RFQ action.

### 2. Admin reviews and accepts or cancels the RFQ

In the **admin area**:

1. The store owner sees incoming RFQ requests for customer projects.
2. For each RFQ, the admin can:
   - **Accept**: provide pricing / quote and mark the RFQ as approved.
   - **Cancel**: decline the request.

Server-side outcomes:

- On **accept**:
  - The project is marked as quoted (e.g. `IsQuoted = true`, `IsQuoteRequested = false`).
  - Quote details are stored with the project.
  - Project history is updated with a “quote accepted” entry.
- On **cancel**:
  - Quote request flags are reset or updated accordingly (e.g. `IsQuoteRequested = false`).
  - Project history records the cancellation.

These state changes are exposed through `GET /Project/GetProjectRecord` and `GET /Project/GetProjectHistory` and are picked up by client polling.

### 3. Customer sees quote result

On the **customer side** (project page and list):

1. Client JS periodically polls:
   - `GET /Project/GetProjectRecord?projectGuid={guid}`
   - `GET /Project/GetProjectHistory?projectGuid={guid}`
2. Based on the returned flags:
   - If the quote is **accepted**, the UI shows a **quoted** state and the **Order** button becomes available.
   - If the quote is **cancelled**, the project reverts to a non-quoted state and the customer can send a new RFQ if desired.

For non-ERP projects the RFQ button’s caption and styling are updated by the client to reflect the latest status.

### 4. Customer orders or cancels

Once a quote is accepted (non-ERP projects only):

- **Order path**:
  1. Customer clicks **Order** on the project.
  2. Client sends `POST /Project/CreateOrder` with the project GUID.
  3. Server creates an order based on the project items and quote.
  4. Quote-related flags are reset after order creation as appropriate, and project history records the order event.

- **Cancel path**:
  1. Customer clicks **Cancel** on the project.
  2. Client sends `ResetQuoteRequest` to `POST /Project/GetProject`.
  3. Server resets `IsQuoteRequested` (and related flags), effectively cancelling the RFQ.
  4. Project history is updated to reflect the cancellation.
  5. The customer can submit a new RFQ if needed.

This is the **canonical user journey** for non-ERP projects:
> RFQ requested → Admin accepts / cancels → Customer orders or cancels.

ERP projects follow the same **server-side** flow conceptually, but the UI is restricted (see the next section).

---

## ERP-aware behavior

When a project contains any product with an ERP id (detected from the product’s `ProductExtensionRecord.ErpId` via `ICadifyProductExtensionService`):

- **Cancel and Order controls:**
  - The Cancel and Order buttons are **not rendered** in both the DataTable and the project page.
  - If `HasErpProducts == true` these controls are omitted entirely.

- **RFQ button:**
  - The RFQ action still sends the server request exactly as before.
  - However, the RFQ button’s **client visual state** (text, color, enabled/disabled) is intentionally **not** changed by client scripting for ERP projects.
  - Implementation detail:
    - Buttons are annotated with `data-has-erp="true"`.
    - Client scripts check this attribute; if `data-has-erp === "true"` they:
      - **Do** POST the RFQ request.
      - **Do not** modify the label, color, or disabled state.

- **Rationale:**
  - ERP-managed products must keep RFQ UI stable because the ERP system owns the status.
  - The server still processes RFQ requests and publishes `ProjectQuotedEvent`, sends ERP webhooks, and writes project history — but the client UI does not override ERP-driven appearance.

---

## Views — what they render now

- **Project detail page (`Project.cshtml`)**

  - RFQ button:
    - `id="page-rfq-btn-{projectGuid}"`
    - Attribute `data-has-erp="true|false"`.
  
  <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/web/order/images/project_RFQ.png" alt="RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

  - Cancel and Order buttons:
    - Cancel: `id="page-cancel-btn-{projectGuid}"`
    - Order: `id="page-order-btn-{projectGuid}"`
    - These are only rendered when `Model.HasErpProducts == false`.
  
  Cancel:
  <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/web/order/images/project_cancel.png" alt="Cancel Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

  Order:  
  <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/web/order/images/project_order.png" alt="Order Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">


  - Client JS polls `GET /Project/GetProjectRecord` and updates state — but the poller will **not** change RFQ visuals if `data-has-erp="true"`.

- **Project list DataTable (`_ProjectListDataTable.cshtml`)**

  - Group header RFQ button:
    - `id="rfq-btn-{projectGuid}"`
    - Has `data-has-erp` attribute.

  <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/web/order/images/project_list.png" alt="Project List RFQ Button" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

  - DataTable `startRender`:
    - Uses `project.HasErpProducts` (server-sent) to decide:
      - Whether to render Cancel/Order buttons.
      - What the RFQ initial caption / CSS class should be.

  - Client handlers:
    - `handleRfqClick`
    - `postQuote`
    - `handleCancelClick`
    - `handleOrderClick`
    - All still POST to the same endpoints; they simply skip local UI changes for ERP-managed projects.

---

## Server-side behavior 

- **`ProjectModelFactory`**
  - Populates `HasErpProducts` on list and details models by:
    - Iterating project items → their `ShoppingCartItem` → `productId`.
    - Using `ICadifyProductExtensionService.GetProductExtensionByProductId(productId)` and checking `.ErpId`.

- **`ProjectController`**
  - `GetProjectRecord` JSON endpoint:
    - Returns `isQuoted`, `isQuoteRequested`, `id`, `projectGuid`, `name`, `version`, etc. (used by page polling).
  - `QuoteRequest` / `ResetQuoteRequest` / `CreateOrder`:
    - Behaviours are unchanged on the server.
    - Return JSON when `from-datatable=1`.

- **`ErpWebhookEventConsumer`**
  - ERP webhook logic remains unchanged.
  - `ProjectQuotedEvent` handler:
    - Still sends ERP webhooks.
    - Project history insertion logic is restored (history records are written where appropriate).

- **`ProjectService`**
  - Handles core project logic (creation, updates, quote flags, etc.) used by the controller and ERP webhook handling.

---

## Client-side highlights

- **RFQ for ERP projects:**
  - Client still sends RFQ POSTs.
  - Because the client intentionally does **not** change caption / colour / disabled state for ERP-managed projects, the UI appears unchanged while server-side processing and project history updates still occur.

- **Cancel & Order:**
  - If `HasErpProducts == true`, Cancel and Order buttons are not present in either the project page or the DataTable.
  - For non-ERP projects, Cancel and Order behave as before:
    - AJAX POST to controller actions.
    - Local UI updates.
    - Polling resync to ensure consistency with server state.

- **JS robustness:**
  - AJAX calls use `dataType: 'json'` and log failures to the console for easier debugging.
  - Buttons use **page-scoped IDs** (`page-` prefix) to avoid collisions with DataTable DOM.
  - DataTable uses non-prefixed IDs; scripts:
    - Look up page-prefixed IDs first.
    - Fall back to global ID if needed.
    - This ensures both views behave correctly even when present on the same page.

---

## Where to look in code (quick links)

- **UI**
  - `Plugins/nopCommerce.Plugin.Cadify/Views/ShoppingCart/Project.cshtml`
  - `Plugins/nopCommerce.Plugin.Cadify/Views/Project/_ProjectListDataTable.cshtml`
  - `Plugins/nopCommerce.Plugin.Cadify/Views/Shared/Components/ProjectSelector/Default.cshtml`

- **Server**
  - `Plugins/nopCommerce.Plugin.Cadify/Factories/Project/ProjectModelFactory.cs` — sets `HasErpProducts`
  - `Plugins/nopCommerce.Plugin.Cadify/Controllers/ProjectController.cs` — `QuoteRequest`, `ResetQuoteRequest`, `CreateOrder`, `GetProjectRecord`, `GetProjectHistory`
  - `Plugins/nopCommerce.Plugin.Cadify/Events/ErpWebhookEventConsumer.cs` — ERP webhooks + `ProjectQuotedEvent` handling
  - `Plugins/nopCommerce.Plugin.Cadify/Services/Project/ProjectService.cs`

---

## Testing checklist

1. **Project with no ERP products (non-ERP flow):**
   - **RFQ:**
     - RFQ button changes to "Quote in Progress" → "Quote Requested".
     - Cancel appears.
     - Order becomes enabled when the project is quoted.
   - **Cancel:**
     - Resets `IsQuoteRequested`, UI reverts to non-quoted state.
   - **Order:**
     - Creates an order, resets quote flags.
     - Project history contains RFQ, quote accepted, and order events.

2. **Project containing at least one product with an ERP id:**
   - **RFQ:**
     - Server receives RFQ (verify via network request and server logs).
     - Client button caption / colour / disabled state **must remain unchanged**.
   - **Cancel & Order:**
     - These buttons must **not** appear anywhere for the project.
   - **Project history:**
     - Must record RFQ activity as before (verify `GetProjectHistory`).

3. **DataTable & Project page on the same page:**
   - Ensure button id collisions do not occur.
   - Verify that both controls (page and DataTable) act correctly.
   - Clear cache after deploy.

---

