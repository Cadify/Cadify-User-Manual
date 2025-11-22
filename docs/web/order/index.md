# RFQ & Order Workflows (updated)

This document describes the Request‑for‑Quote (RFQ), Cancel and Order flows implemented by the Cadify plugin and the recent ERP-related behaviour changes.

---

## Summary

    In Cadify, products can be either ERP-managed or standard (non-ERP), but both use the same project-based RFQ flow. From any product page, the user can either create a project with one-click RFQ or add the product as an item to a new or existing project and request a quote later. For ERP-managed products, the system automatically detects ERP items and adjusts the UI: the Cancel and Order buttons are hidden, while RFQ still works and is processed in the background. Status and history are maintained via ERP webhooks and are visible on the project page and in the project list. For non-ERP products, RFQ requests appear in the admin area, where the store owner can accept or cancel them. After acceptance, the customer sees that the quote is approved and can either place an order based on the quote or cancel the request.
    
- Views/components involved:
  - `Plugins/nopCommerce.Plugin.Cadify/Views/ShoppingCart/Project.cshtml` — project detail page
  - `Plugins/nopCommerce.Plugin.Cadify/Views/Project/_ProjectListDataTable.cshtml` — project list (DataTable) group headers
  - `Plugins/nopCommerce.Plugin.Cadify/Views/Shared/Components/ProjectSelector/Default.cshtml` — project selector component
- Main server endpoints:
  - `POST /Project/GetProject` (form POST) — `QuoteRequest` (RFQ) and `ResetQuoteRequest` (Cancel)
  - `POST /Project/CreateOrder` — `CreateOrder` (orders from a project)
  - `GET /Project/GetProjectRecord?projectGuid={guid}` — returns project JSON (polled by the page)
  - `GET /Project/GetProjectHistory?projectGuid={guid}` — project history (polled)
- Models:
  - `CadifyProjectListModel` and `CadifyProjectDetailsModel` now include `HasErpProducts` (boolean) to indicate any project item belongs to a product with an ERP id.

---

## ERP-aware behavior (new / important)

When a project contains any product with an ERP id (detected from the product's `ProductExtensionRecord.ErpId` via `ICadifyProductExtensionService`):

- Cancel and Order controls:
  - The Cancel and Order buttons are not rendered in both the datatable and the project page. (If `HasErpProducts == true` these controls are omitted.)
- RFQ button:
  - The RFQ action still sends the server request exactly like before, but the RFQ button's *client* visual state (text, color, enabled/disabled) is intentionally NOT changed by client scripting for ERP projects.
  - Implementation detail: buttons are annotated with `data-has-erp="true"` and client scripts check that attribute. If `data-has-erp === "true"` they still POST the RFQ but skip modifying label, color or disabled state.
- Rationale:
  - ERP-managed products must keep RFQ UI stable (ERP handles status). Server still processes RFQ requests and publishes `ProjectQuotedEvent` etc., but client UI doesn't override ERP-driven appearance.

---

## Views — what they render now

- `Project` detail page (`Project.cshtml`)
  - RFQ button: `id="page-rfq-btn-{projectGuid}"` and attribute `data-has-erp="true|false"`.
  - Cancel `page-cancel-btn-{projectGuid}` and Order `page-order-btn-{projectGuid}` are only rendered when `Model.HasErpProducts == false`.
  - Client JS polls `GET /Project/GetProjectRecord` and updates state — but the poller will not change RFQ visuals if `data-has-erp="true"`.

- `_ProjectListDataTable.cshtml` (DataTable)
  - Group header RFQ button: `id="rfq-btn-{projectGuid}"` with `data-has-erp`.
  - DataTable `startRender` uses `project.HasErpProducts` (server-sent) to decide whether to render Cancel/Order and what RFQ initial caption/class should be.
  - Client handlers (`handleRfqClick`, `postQuote`, `handleCancelClick`, `handleOrderClick`) still POST to the same endpoints; they skip local UI changes for ERP-managed projects.

---

## Server-side changes (summary)

- `ProjectModelFactory`:
  - Populates `HasErpProducts` on list and details models by checking each project item → its `ShoppingCartItem` → productId → `ICadifyProductExtensionService.GetProductExtensionByProductId(productId)` and checking `.ErpId`.
- `ProjectController`:
  - `GetProjectRecord` JSON endpoint returns `isQuoted`, `isQuoteRequested`, `id`, `projectGuid`, `name`, `version`, etc. (used by page polling).
  - `QuoteRequest` / `ResetQuoteRequest` / `CreateOrder` behaviours unchanged on server; they return JSON when `from-datatable=1`.
- `ErpWebhookEventConsumer`:
  - ERP webhook logic remains; `ProjectQuotedEvent` handler still sends ERP webhooks.
  - Project history insertion logic restored (history records are written where appropriate).

---

## Client-side highlights / gotchas

- RFQ for ERP projects:
  - Client still sends RFQ POST. Because the client intentionally does not change caption/colour/disabled for ERP-managed projects, the UI looks unchanged — but server-side processing and project history still occur.
- Cancel & Order:
  - If `HasErpProducts == true`, Cancel and Order buttons are not present. For non-ERP projects they behave as before (AJAX POST + UI updates + polling resync).
- JS robustness:
  - AJAX calls use `dataType: 'json'` and log failures to console for easier debugging.
  - Buttons use page-scoped IDs (`page-` prefix) to avoid collisions with datatable DOM. Datatable uses non-prefixed IDs; scripts look up page-prefixed first then fallback to global ID — ensuring both views behave correctly on the same page.

---

## Where to look in code (quick links)

- UI
  - `Plugins/nopCommerce.Plugin.Cadify/Views/ShoppingCart/Project.cshtml`
  - `Plugins/nopCommerce.Plugin.Cadify/Views/Project/_ProjectListDataTable.cshtml`
  - `Plugins/nopCommerce.Plugin.Cadify/Views/Shared/Components/ProjectSelector/Default.cshtml`
- Server
  - `Plugins/nopCommerce.Plugin.Cadify/Factories/Project/ProjectModelFactory.cs` — sets `HasErpProducts`
  - `Plugins/nopCommerce.Plugin.Cadify/Controllers/ProjectController.cs` — `QuoteRequest`, `ResetQuoteRequest`, `CreateOrder`, `GetProjectRecord`, `GetProjectHistory`
  - `Plugins/nopCommerce.Plugin.Cadify/Events/ErpWebhookEventConsumer.cs` — ERP webhook + `ProjectQuotedEvent` handling
  - `Plugins/nopCommerce.Plugin.Cadify/Services/Project/ProjectService.cs`

---

## Testing checklist

1. Project with no ERP products:
   - RFQ: button changes to "Quote in Progress" → "Quote Requested"; Cancel appears; Order enabled when quoted.
   - Cancel: resets `IsQuoteRequested`, UI reverts.
   - Order: creates order, resets quote flags.

2. Project containing at least one product with an ERP id:
   - RFQ: server receives RFQ (check network request and server logs) — client button caption/colour/disabled must remain unchanged.
   - Cancel & Order: those buttons must not appear.
   - Project history must record RFQ activity as before (verify `GetProjectHistory`).

3. DataTable & Project page on same page:
   - Ensure button id collisions do not occur and both controls act correctly. Clear cache after deploy.

---

## Screenshots / doc images

Recommended paths:
- `docs/images/project-page-rfq.png`
- `docs/images/project-page-order-cancel.png`
- `docs/images/project-list-datatable.png`
- `docs/images/project-selector.png`
- `docs/images/admin-customer-projects.png`

---