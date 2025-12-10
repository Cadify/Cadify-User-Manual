# Cadify 7 Tab Role System Documentation

The fixed tab structure in Cadify ensures that every stakeholder receives the right files in the right place. Seven tabs are predefined, each linked to a role that governs visibility and permissions. From descriptions for customers to source archives for administrators, this system maintains order, consistency, and security. This section of the manual explains how the tabs work in detail.

## Fixed Product Tabs and Functionality

### 1 Description
Shows the **nopCommerce Full Description** text. Fixed mapping; cannot contain other files. Content is defined in **SolidWorks Task Pane → Tools → Product Settings → General Information**.

### 2 Specifications
Presents all **Cadify Web Controls** of type **Output** (configurable specification attributes and their values).

### 3 Brochures
Contains static documents (e.g., PDF brochures/manuals). A document may be assigned to none, any, or all tabs at the creator’s discretion.

### 4 Customers
Holds reports/files generated from Cadify Master Excel or CAD process intended for end customers.

### 5 Partner
Holds files generated from the Cadify 3D model intended for partner-level sharing.

### 6 Fabricator
Contains files intended for manufacturing vendors (e.g., CNC files, flat patterns, BOM reports).

### 7 SourceAdmin
Reserved for sensitive/core files such as SolidWorks Pack-and-Go archives or the Cadify Master Excel file. Access is restricted to **SourceAdmin** and **Store Owners**.

## Role-Based Visibility and Access

### Tab-Role Mapping
Each tab corresponds to a nopCommerce role of the same name for controlled access.

### Role Defaults

- **Public:** Tabs 1-3 (Description, Specifications, Brochures)
- **Customers:** Tab 4 + Store Owner
- **Partner:** Tab 5 + Store Owner
- **Fabricator:** Tab 6 + Store Owner
- **SourceAdmin:** Tab 7 + Store Owner

### Permissions
Roles with tab access can both view **and** download files.

### Admin vs Store Owner

- **Admin:** Unlimited access across all stores and admin functions; implicitly has all Store Owner rights.
- **Store Owner:** Admin of a single store/substore (e.g., `substore.cadify.no`); unlimited number of substores.

## Localization and Naming

### Tab Labels
Tab names are nopCommerce localization strings and include the sequence number, e.g., `1: Description`, `2: Specifications`, …, `7: SourceAdmin`.

### Language Packs
Tab names can be translated or renamed using nopCommerce language packs.

## Content Management Structure

### Introduction
Cadify aligns customer choices, engineering rules, and production requirements across seven fixed tabs:

1. **Description**: full description
2. **Specifications**: output attributes (web controls)
3. **Brochures**: static brochures/reference docs
4. **Customers**: customer-facing reports
5. **Partner**: partner collaboration files
6. **Fabricator**: vendor/manufacturing files
7. **SourceAdmin**: restricted source files

Tabs present only relevant information to each stakeholder and ensure consistent, updated inputs for production.

### File Assignment
Any file can be assigned to none, any, or all of the seven tabs by the document creator (Proxy or Task Pane UI).

### Store Owner
Controls which roles have access to tabs by assigning customer roles. Content is always defined by the document creator.

### Empty Tabs
Tabs without assigned content are hidden on the product page.

## Proxy UI in SolidWorks

### Overview
**Task Pane → Web (Proxy)** lets engineers assign **Reports**, **Brochures**, and **Models** to any tab.

### Reports
Configure: source sheet, print area, destination tab, file name, display order.

### Brochures
Assign static files (PDFs, etc.) to any tab; control sequence via display order.

### Pictures
For **Cadify Web Controls only**; not assignable to tabs.

### Models
Generate model files (e.g., STL, 3MF, ZIP) and place them on any tab.

See more on [Media Manager details](/mediaManager/MediaManager)

## Web Controls for Specifications

### Output Controls
Each Output control defines:

- Output attribute name
- Value
- Display order
- Description (HTML supported)
- Optional/required
- Filtering rules
- Optional graphic

### Input/Output/Checkout
Only **Output** controls appear in **Specifications**.

### Checkout Controls
Used for ordering workflows only; not tied to tab roles/content.

## Product General Information

### UI
Defined by the SW Engineer in **Task Pane → Tools → Product Settings → General Information**.

### Fields

- Product name
- Short description
- **Full description** (Tab 1 content)
- SKU
- Published status
- Admin comment

## Drawing Settings and Role Assignment

### Drawing Settings UI
In **Task Pane → Tools → Drawings → Settings for Drawings**, configure output settings per drawing. A product may have multiple drawings.

### Role Assignment
For each drawing, select any/all roles (Customers, Partner, Fabricator, SourceAdmin) and assign document types (DWG, DXF, PDF) to tabs.

### Drawing Files

- A drawing may include unlimited sheets.
- All sheets are managed within a single file.
- Styles, margins, prompts are defined in this UI.

### Display Order
Engineers control the sequence of drawings within selected tabs.

## Customer Role Assignment in Store Admin

### UI
In **nopCommerce Admin → Customers → Select Customer**, the Store Owner assigns roles; the Cadify Plugin adds roles for Tabs 4-7.

### Store Owner Label
Store Owner roles are substore-specific, e.g., `substore.cadify.no`.

### Separation of Responsibility

- **Document creator:** Chooses tab placement for each file/report/drawing.
- **Store Owner:** Assigns customer roles to determine access.

## Implementation Notes

### Database Structure

- **Tabs** table stores definitions for Tabs 2-7. (Tab 1 is implicit.)
- **CustomerRoleTabMapping** links products, roles, and tabs for visibility control.

### Defaults
Default access follows the role mapping above.

### Admin Interface
nopCommerce admin **Customer Roles** are extended with tab access checkboxes.

### Frontend Display
Tabs render only if they contain content **and** the current user role has access.

