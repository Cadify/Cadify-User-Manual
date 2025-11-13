# RFQ & Order Workflows

This page documents user and admin flows for Request‑for‑Quote (RFQ), Cancel and Order actions implemented by the Cadify plugin. It includes where the UI is rendered (views/components), the client behaviour and server endpoints used.

---

## Summary

- Users can request quotes from:
  - Project page: `Plugins/nopCommerce.Plugin.Cadify/Views/ShoppingCart/Project.cshtml`
  - Project lists / datatable: `Plugins/nopCommerce.Plugin.Cadify/Views/Project/_ProjectListDataTable.cshtml` (used by `ProjectLists`)
  - Project selector component: `Plugins/nopCommerce.Plugin.Cadify/Views/Shared/Components/ProjectSelector/Default.cshtml`
- Buttons and actions available:
  - RFQ (Request quotation)
  - Cancel (reset quote request)
  - Order (Order A behaviour — ephemeral order created then deleted after success)
- Admins accept quotes in the Customers admin area (customer edit views provided by the plugin).

---

## Project list (datatable) — quick reference

View: `Plugins/nopCommerce.Plugin.Cadify/Views/Project/_ProjectListDataTable.cshtml`  
Used in: `Plugins/nopCommerce.Plugin.Cadify/Views/Project/ProjectLists.cshtml` and the Project selector view component.

What it renders
- The datatable groups rows by project and renders a group header containing:
  - RFQ button (id `rfq-btn-{projectGuid}`)
  - Cancel button (id `cancel-btn-{projectGuid}`) — visible when `IsQuoteRequested` or `IsQuoted`
  - Order button (id `order-btn-{projectGuid}`) — visible when `IsQuoted`
- Buttons call client handlers defined in the same file:
  - `handleRfqClick(projectGuid)` → sets button UI to "Quote in Progress" then calls `postQuote(projectGuid)`
  - `handleCancelClick(projectGuid)` → AJAX POST with `resetquotebutton`
  - `handleOrderClick(projectGuid)` → AJAX POST to `/Project/CreateOrder`

Server endpoints used by the datatable
- `POST /Project/GetProject` with:
  - `quotebutton=1` and `from-datatable=1` → triggers `ProjectController.QuoteRequest(...)`
  - `resetquotebutton=1` and `from-datatable=1` → triggers `ProjectController.ResetQuoteRequest(...)`
- `POST /Project/CreateOrder` with `{ projectGuid }` → triggers `ProjectController.CreateOrder(...)`

Notes
- Datatable handlers expect JSON responses (hence `from-datatable`).
- Client notifications use `displayBarNotification(...)`. If your theme differs, replace or implement that helper.

Place screenshot(s) for datatable:
- `docs/images/project-list-datatable.png` — show a row group header with RFQ / Cancel / Order buttons.

---

## Project selector component

File: `Plugins/nopCommerce.Plugin.Cadify/Views/Shared/Components/ProjectSelector/Default.cshtml`

- The ProjectSelector component presents compact project choices and can surface the same RFQ/Order actions (depending on configuration).
- Behaviour and endpoints are identical to datatable / project page: RFQ → `POST /Project/GetProject`, Cancel → `POST /Project/GetProject` (reset), Order → `POST /Project/CreateOrder`.

Place screenshot(s) for selector:
- `docs/images/project-selector.png` — show the component in a page where a user can pick a project and request an RFQ.

---

## Project page (detailed) — recap

File: `Plugins/nopCommerce.Plugin.Cadify/Views/ShoppingCart/Project.cshtml`

- Contains the main RFQ, Cancel and Order controls for a single project.
- Client polling updates button state using `GET /Project/GetProjectRecord` and `GET /Project/GetProjectHistory`.
- Order button calls `/Project/CreateOrder` (AJAX or form) and UI is updated after server response.

Place screenshot(s) for project page:
- `docs/images/project-page-rfq.png` — RFQ button on project details page.
- `docs/images/project-page-order-cancel.png` — Order and Cancel buttons shown together.

---

## Admin: accepting a quote

Where to look:
- Admin customer edit view: `Plugins/nopCommerce.Plugin.Cadify/Views/Admin/Customer/_CreateOrUpdate.cshtml` (plugin adds Project/ERP details there)
- Admin controllers: `Plugins/nopCommerce.Plugin.Cadify\Controllers\Admin\CadifyConfigurationController.cs` and `Plugins/nopCommerce.Plugin.Cadify\Controllers\Admin\ProjectController.cs`

Admin actions
- When admin accepts a quote the project record should become `IsQuoted = true`. The plugin exposes helper methods and services:
  - `IProjectService` / `ProjectService` — project updates and `CreateOrderFromProjectAsync(...)`
  - `SendQuoteFinishedMessageAsync` to email recipients
  - `ProjectQuotedEvent` is published for integrations

Place screenshot(s) for admin:
- `docs/images/admin-customer-projects.png` — show customer edit with Projects / Accept controls.

---

## Endpoints & implementation summary

- `POST /Project/GetProject` (form POST)
  - `quotebutton` → QuoteRequest (user RFQ)
  - `resetquotebutton` → ResetQuoteRequest (cancel)
- `GET /Project/GetProjectRecord?projectGuid={guid}` → returns project JSON (used by polling)
- `GET /Project/GetProjectHistory?projectGuid={guid}` → project history list (used by polling)
- `POST /Project/CreateOrder` → CreateOrderFromProject flow (Order A: create then delete)

Files of interest
- UI:
  - `Plugins/nopCommerce.Plugin.Cadify/Views/Project/_ProjectListDataTable.cshtml`
  - `Plugins/nopCommerce.Plugin.Cadify/Views/Project/ProjectLists.cshtml`
  - `Plugins/nopCommerce.Plugin.Cadify/Views/ShoppingCart/Project.cshtml`
  - `Plugins/nopCommerce.Plugin.Cadify/Views/Shared/Components/ProjectSelector/Default.cshtml`
- Backend:
  - `Plugins/nopCommerce.Plugin.Cadify\Controllers\ProjectController.cs`
  - `Plugins/nopCommerce.Plugin.Cadify\Services\Project\ProjectService.cs`
  - `Plugins/nopCommerce.Plugin.Cadify\Services\UsageStat\QuotationRequestService.cs`

---

## Pictures / where to put them in docs

Recommended paths in the docs folder:
- `docs/images/project-page-rfq.png` — Project page RFQ button
- `docs/images/project-page-order-cancel.png` — Project page Order + Cancel
- `docs/images/project-list-datatable.png` — `_ProjectListDataTable` group header (RFQ/Cancel/Order)
- `docs/images/project-selector.png` — `ProjectSelector` component
- `docs/images/admin-customer-projects.png` — Admin customer Projects area