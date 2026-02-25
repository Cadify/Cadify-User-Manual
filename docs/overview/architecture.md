# Architecture

This chapter describes the overall architecture of Cadify. It explains how the different components interact, how product instances are identified, and how data flows from design in SolidWorks to production in ERP and MES systems. The goal is to provide a clear overview that connects engineering, operations, and business needs.

---

## 1. Identity and Instance Definition

Cadify uses two complementary identifiers:

- **Product Anchor (SKU)**  
  Each product is defined in nopCommerce with a SKU. This represents the default instance of the product and acts as its anchor across the system.

- **Configured Instance Identifier**  
  Every configured instance in the store is uniquely identified by a combination of:
  - Store name  
  - User email (for logged-in users) or Guest ID (for anonymous users)  
  - Timestamp in the format `YYYY.MM.DD HH:MM:SS` (example: `2025.09.05 18:48:40`)  

  This strict combination ensures each configured instance is unique, traceable, and reproducible.

---

## 2. Digital Twin

The Cadify Digital Twin is the authoritative definition of a product, its rules, and its outputs. It includes:

- SolidWorks 3D model  
- Cadify Workbook (Excel) with rules, parameters, BOM, and compatibility logic  
- Files in the RAW product folder  
- Library parts in the client’s location-specific folder  
- All generated outputs: governed drawings, BOM lists, PDFs, DXFs, STL/STEP/3MF exports, and attachments  

Every file tied to a product instance belongs to its digital twin. There is no distinction between “primary” and “derived” data.

---

## 3. Cadify Desktop

Cadify Desktop is a SolidWorks add-in integrated with Excel. It allows engineers to author products based on the following principles:

- **One workbook per product.** Each workbook defines rules, parameters, and ranges.  
- **Coupled models and drawings.** Drawings remain governed by the same workbook as the 3D model.  
- **Atomic updates.** Models and drawings are regenerated consistently when parameters change.  
- **Publishing.** Products can be published to the web via:  
  - The Cadify Service API  
  - Direct insertion into the store database and files  

If publishing fails, re-publishing serves as a fallback.

---

## 4. Cadify Web

Cadify Web is built on nopCommerce and serves as the interface for customers, engineers, and partners:

- Products appear as configurable items tied to a SKU.  
- Instances are created by users or guests and stored with their unique identifiers.  
- Outputs are displayed in role-based tabs, such as:  
  - 3D view (3MF rendered with three.js)  
  - SVG outputs  
  - PDFs and governed drawings  
  - BOM and supporting documents  

Pricing and lead-time logic can be executed either in the Cadify Workbook (store-driven) or in ERP/MES (integration-driven).  
Authentication is handled through nopCommerce accounts or guest sessions. Roles tied to user emails define which tabs and outputs are visible.

---

## 5. Cadify Service

Cadify Service manages communication between Desktop, Web, and Cadify Cloud. It is implemented in .NET Framework (WPF).

- **Signal mechanism:** Listens for changes in Cadify Cloud workspaces.  
- **Processing cycle:**  
  1. Detect change in cloud folder  
  2. Download JSON and Excel input files  
  3. Update workbook and calculate parameters  
  4. Modify SolidWorks model  
  5. Generate governed drawings  
  6. Export 3MF for the web viewer  
  7. Upload updated workbook, 3MF, and SLDPRT files  

- **Error handling:** Uses timeout and retry logic. Failed jobs require manual re-publishing.  
- **Observability:** No structured logs or metrics beyond Cadify Cloud metadata. Traceability is maintained at the file and instance level using the (Store, User/Guest, Timestamp) identifier.

---

## 6. Storage and Sync

Cadify uses Cadify Cloud workspaces for secure storage and synchronization:

- Each client location is assigned a dedicated Cadify Cloud workspace.  
- Product RAW folders, published folders, workbooks, and generated files are stored in these spaces.  
- Tenant isolation is enforced by Cadify Cloud's strict authorization rules.

---

## 7. ERP, MES, and PLM Integration

Cadify delivers a complete set of production-ready data to downstream systems:

- BOMs  
- Governed drawings  
- PDFs, DXFs, STL, STEP, 3MF  
- Attachments linked in the workbook or BOM list  

ERP and MES systems remain responsible for:  

- Order-to-work-order lifecycle  
- Routing and operations models  
- Status transitions, acknowledgements, and error handling  

Cadify provides the full production package, while execution stays in ERP/MES.

---

## 8. Security and Compliance

Cadify enforces security through:  

- **Storage isolation:** Dedicated Cadify Cloud workspaces per client location.  
- **Authentication:** Managed via nopCommerce (users/guests) and Cadify Cloud authorization for file sync.  
- **Compliance:** All data handling complies with GDPR requirements.

---

## 9. Traceability

Every configured instance is traceable through its identifier triple (Store, User/Guest, Timestamp). This identifier applies consistently to:  

- Store records  
- Uploaded files  
- Cadify Cloud metadata  

Traceability extends to the document and file level, ensuring any production artifact can be linked back to the instance that generated it.