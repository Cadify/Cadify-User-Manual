# Exporting Drawings to DXF, DWG, and PDF Across 7 Tabs

Cadify enables you to export your SolidWorks drawings to DXF, DWG, and PDF formats and assign them to any of the 7 product tabs, each with its own role based access. This ensures that the right files are delivered to the right stakeholders, customers, partners, fabricators, or administrators, according to your workflow and security needs.

For a detailed explanation of the 7 tab system and role-based access, see [Cadify 7 Tab Role System Documentation](../../7tabs/roles-7-tabs.md).

## How to Export Drawings to Tabs

1. **Open the Drawing Settings Form:**
	- Access it from the **Tools** menu, or
	- Use the button on the **Drawing Task Pane** in SolidWorks.

2. **Configure Drawing Export:**
	- In the Drawing Settings form, you can set the drawing title, prompts, and display order.
	- In the highlighted area (see image below), simply check the checkboxes for the desired file formats (DWG, DXF, PDF) and the destination tabs:
        - 3 Brochures
        - 4 Customer
        - 5 Partner
        - 6 Fabricator
        - 7 SourceAdmin
	- This setup determines which files are generated and where they will appear in the web store, based on the tab's role permissions.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/product/images/drawingExport.png" alt="Drawing Settings Form" style="max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;"/>

> **Note:** When you check a box, Cadify creates a proxy entry in the Cadify table (Excel workbook) for that export.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/product/images/exportProxy.png" alt="Drawing Exports" style="max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;"/>

Tabs without assigned content are hidden from the product page, ensuring only relevant files are shown to each user role.

For more on tab roles, permissions, and file assignment, refer to the [7 Tab Role System Documentation](../../7tabs/roles-7-tabs.md).
