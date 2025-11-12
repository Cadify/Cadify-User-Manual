# RFQ & Order Workflows

This page documents the user and admin flows for Request-for-Quote (RFQ) and Order actions exposed by the Cadify plugin.

---

## Summary

- Users request quotes from the Project page (`Views/ShoppingCart/Project.cshtml`).
- RFQ button states:
  - `RFQ` — initial
  - `Quote Requested` — after user requests
  - `Quote Sent` — after admin accepts
- Admins accept quotes from the Customers admin area (customer record → Projects section).
- Order A behavior: a lightweight Order is created by the server and deleted immediately if creation finishes successfully; project quote flags are cleared.

---

## User steps (request a quote)

1. Open Project page for the project.
2. Click the RFQ button.
   - Client posts to `POST /Project/GetProject` with `quotebutton`.
   - If successful:
     - Project record: `IsQuoteRequested = true`
     - Each project item: `HasQuoted = true`
     - RFQ history entry and optional ERP messages are created.
3. UI feedback:
   - Button text changes to `Quote Requested` and is disabled.
   - Project history updates.

Place screenshot: *Project page showing RFQ button here.*

---

## User: cancel quote request

- Click Cancel (visible when a quote is requested or sent).
- Client calls `POST /Project/GetProject` with `resetquotebutton`.
- Server resets:
  - `IsQuoteRequested = false`
  - `IsQuoted = false`
  - All project items `HasQuoted = false`
  - Adds a project history entry: *QuoteCancelled*
  - Notifies ERP via `ConstructRFQMessageAsync(..., "Project.History.QuoteCancelled", ...)`
- UI updates: RFQ button reverts to `RFQ`.

---

## Order (Order A behaviour)

- On Project page, user clicks Order button (enabled only when `IsQuoted` is true).
- Client calls `POST /Project/CreateOrder`.
- Server:
  - Calls `CreateOrderFromProjectAsync(project)` which:
    - Creates an Order with required NOT NULL fields (e.g. `CustomOrderNumber`, `BillingAddressId`).
    - Inserts related OrderItem entries for eligible project items.
  - Per Order A: controller deletes the created Order if creation succeeded.
  - Clears quote flags:
    - `IsQuoteRequested = false`
    - `IsQuoted = false`
    - All project items `HasQuoted = false`
  - Records elapsed time for RFQ metrics and notifies ERP with `QuoteCancelled`.
- Client:
  - Shows confirmation and reloads to reflect cleared quote state.

---

## Admin: accept a quote

1. Open Admin → Customers → Edit the customer owning the project.
2. Locate the plugin Projects area (plugin UI or project list in customer admin).
3. Accept a quote (plugin may have an Accept action); when accepted:
   - `WidemoreProjectRecord.IsQuoted = true`
   - Optionally set `QuotedOnUtc` / `QuotedBy`
   - Trigger `SendQuoteFinishedMessageAsync(...)` to notify recipients
   - Publish `ProjectQuotedEvent` for ERP/integrations
4. After acceptance, Project page RFQ button shows `Quote Sent`.

Place screenshot: *Customers admin showing Accept Quote here.*

---

## Endpoints (reference)

- POST `/Project/GetProject`  
  - `quotebutton` → request quote (server: `QuoteRequest`)
  - `resetquotebutton` → cancel/reset quote (server: `ResetQuoteRequest`)
- GET `/Project/GetProjectRecord?projectGuid={guid}` — returns project state JSON (used by client polling)
- GET `/Project/GetProjectHistory?projectGuid={guid}` — project history JSON
- POST `/Project/CreateOrder` — create ephemeral order and then delete it (Order A)

---

## Client behaviour

- Project page polls:
  - `GET /Project/GetProjectHistory` — updates history
  - `GET /Project/GetProjectRecord` — updates RFQ / Order button states
- Buttons:
  - RFQ: posts form (regular or AJAX)
  - Cancel: AJAX POST with `resetquotebutton`
  - Order: AJAX POST to `/Project/CreateOrder` (then refresh or show notification)

---

## Important notes & gotchas

- Authentication: RFQ/Order actions require a logged-in (non-guest) user.
- Project locking: locked projects disallow RFQ/Order actions.
- DB constraints: `Order.CustomOrderNumber` and `Order.BillingAddressId` are required; service provides fallback values (creates minimal address if needed).
- ERP failures are logged; they do not necessarily block the user happy path.
- Order A deletes the created order immediately — remove deletion if persistent orders are required.

---

## Troubleshooting

- RFQ button does nothing: check console and network for `POST /Project/GetProject`.
- Order DB errors: verify `Order` table nullability, ensure `CreateOrderFromProjectAsync` sets required fields.
- Polling stale: ensure `/Project/GetProjectRecord` reachable and not blocked by auth.

---

## Images / Screenshots

---