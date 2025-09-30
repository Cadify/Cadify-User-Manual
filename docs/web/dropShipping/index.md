# Drop Shipping

## Introduction

This chapter explains how Cadify with nopCommerce enables drop shipping for complex, configurable products.  

The customer configures the product in the web store, approves the scope in checkout with **Approve and Route to Manufacturer**, and Cadify locks the configuration for production.  
The order is then routed to a selected contractor. The contractor executes manufacturing and shipping, while status updates with traceability return to the store record.  

Cadify supplies the complete, consistent data pack and binds traceability from approval to delivery.  

The following sections describe the flow in clear steps, including roles and checkpoints, data handover, and integration options that keep customization standardized and quality predictable.  

---

## Preconditions

- Product rules authored in Cadify (Excel logic plus SolidWorks models with validated ranges and dependencies)  
- Store set up in nopCommerce, including roles, pricing, taxes, and payment configuration  
- One or more approved contractors with an agreed integration profile  

---

## Checkout Actions

### Approve and Route to Manufacture  
A Checkout Web Control that records approval, locks the configuration, and initiates routing to a contractor.  

### Request for Quote  
An alternative Checkout Web Control for cases requiring commercial review before approval.  

The store owner decides which action is visible per product or per store.  

---

## Order Payload (Example)

The payload is customizable per customer and per contractor. The list below is an example only:  

- Order header, customer identity, delivery data, and commercial terms  
- Product snapshot with parameter values, version, and revision note  
- BOM at order time, including quantities and materials  
- Drawing set approved by the buyer  
- Machine-ready files per process (for example DXF, STEP, STL, bend tables, print parameters)  
- Attachments such as work instructions, material data sheets, and compliance records  
- Packing information and labeling artifacts  
- Routing header, target contractor code, and integration profile  

---

## Integration Profiles

Cadify supports three planned profiles for contractor handoff:  

- **Profile A: Direct HTTPS API**  
  JSON payload with file links or streams, synchronous acknowledgment, and webhook for status events.  

- **Profile B: Secure SFTP Drop plus Webhook**  
  Atomic file drop to a named inbox, webhook acknowledgment back to the store, and status events via webhook.  

- **Profile C: ERP Webhook, Fan-out at Contractor**  
  Order header and links sent into the contractor ERP. The ERP distributes data to MES, CAM, and labeling systems.  

---

## Traceability and Security

- A unique **Trace ID** is bound at checkout. It is the tuple of Store Name, Timestamp, and Buyer Email.  
- The Trace ID is stamped into the order, BOM items, drawings, files, and status events.  
- Data is siloed by tenant with authenticated access. Audit logging is enabled.  

---

## Shipping and Notifications

Shipping is executed by the selected drop ship contractor, aligned with the buyer’s routing policy.  

Cadify provides the complete document and data pack that the contractor needs, including packing information and required regulatory details. Tracking events are returned to the same store order, so the customer receives clear status updates without manual follow-up.  

---

## Changes After Approval

- Any edit after approval creates a new version and requires re-approval.  
- Routing is blocked until the new approval is recorded.  
- If the order is already in manufacturing, a new version must be created, re-approved, and processed through the contractor’s change control.  

---

## Returns and Warranty

Cadify supports an insurance option for handling returns and warranty cases.  
The trace pack (order, BOM, drawings, files, and events) enables rapid cause analysis and fair resolution.  

---

## Industry Archetypes

Cadify supports drop shipping across several industry types:  

- **Sheet Metal**  
  Laser cutting, bending, welding, finishing, and packing  

- **HVAC Components**  
  Duct sections, transitions, flanges, length rules, and installation notes  

- **3D Printing**  
  Mesh preparation, material selection, print parameters, and post-processing  

---

## Quick Access Buttons

- [Drawing Task Pane](../../cadify/task_panes/drawingTab.md)
- [Checkout Web Controls (section in progress)](../../cadify/controls/checkoutControls.md)
- [BOM](../../cadify/bom/bom.md)
- [ERP Connection (section in progress)](../store/erpConnection.md)
- [Headless Web API](../web/index.md)
- [Stores and Sub-stores (section in progress)](../store/storeSettings.md)

---

## Reference Information

- <a href="https://docs.google.com/viewer?url=https://github.com/Cadify/cadify-assets/raw/main/documents/Executive_Summary_How_Cadify_Powers_Drop_Ship_at_Scale.pdf" target="_blank" rel="noopener noreferrer">Executive Summary How Cadify Powers Drop Ship at Scale</a>

- <a href="https://docs.google.com/viewer?url=https://github.com/Cadify/cadify-assets/raw/main/documents/Current_State_of_the_Art_and_Trends_in_Drop_Shipping_in_Cadify_context.pdf" target="_blank" rel="noopener noreferrer">Current State of the Art and Trends in Drop Shipping in Cadify context</a>
