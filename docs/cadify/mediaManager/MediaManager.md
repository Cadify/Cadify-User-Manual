# Media Manager Documentation

This document describes the Media Manager tool used for managing product-related media in Cadify. The Media Manager allows users to set up printing areas from Excel workbooks, configure downloadable PDF brochures, and manage product pictures—all controlled via proxy objects in the code and stored in structured Excel worksheets.

## Overview

The Media Manager UI is divided into three main sections:

- **Print from Excel**: Configure print areas from specified worksheets and ranges.
- **PDF from File**: Set up downloadable PDF brochures for products.
- **Pictures**: Manage product images and associate them with controls.
- **Models**: Solidworks product as downloadable files.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/mediaManager/images/mediaManager.png" alt="MediaManager" style="max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

## Excel Data Mapping

The configuration for each media type is stored in a structured format in the Excel workbook. Each section uses a proxy object:
- `ProxyReport` for print areas
- `ProxyBrochure` for PDF brochures
- `ProxyPicture` for product images
- `ProxyModel` for Solidworks files

The following example shows how these proxies are stored in the Excel workbook:

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/mediaManager/images/proxyInExcel.png" alt="ProxyInExcel" style="max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

---

## 1. Print from Excel (`ProxyReport`)

This subchapter explains how Cadify generates reports as part of integrated quality assurance. Reports are created from Excel using defined print ranges and exported as standard PDF files. They may contain drawings, control points, or checklists, and are always linked to the product configuration. The following pages describe how report templates are prepared, how print ranges are managed, and how outputs are distributed.

Allows the user to specify a worksheet and range to define a printable area for the product.

| Field                | Example Value      | Description                                  |
|----------------------|-------------------|----------------------------------------------|
| Source sheet tab     | Cadify MASTER     | Worksheet containing the print area          |
| Print area           | A15:P45           | Excel range to print                         |
| Printer              | PDF               | Output format (PDF)                          |
| Destination tab      | 4 Customer        | Where the result is stored                   |
| Prompt               | Print Cadify MASTER| Display name in UI                           |
| File name            | printFromTable.pdf| Output file name                             |
| Page size            | A4                | Page size                                    |
| Orientation          | Portrait          | Page orientation                             |
| Number of pages      | 1                 | How many pages to print                      |
| Display order        | 10                | UI display order                             |

---

## 2. PDF Brochure (`ProxyBrochure`)

Set up downloadable PDF files for products. The files are stored next to the workbook (e.g., on Dropbox) and published with a download link.

| Field             | Example Value                              | Description                                             |
|-------------------|--------------------------------------------|---------------------------------------------------------|
| Prompt            | Static Downloadable PDF                    | Display name in UI                                      |
| File format       | PDF                                        | File type                                               |
| File name         | Controls - Cadify Light User Manual.pdf    | PDF file name                                           |
| Destination tab   | 3 Brochures                                | Where the brochure info is stored                       |
| Display order     | 10                                         | UI display order                                        |
| Brochure name     | (blank)                                    | Optional brochure display name                          |

---

## 3. Product Pictures (`ProxyPicture`)

Users can assign images as product pictures or connect them to Cadify Controls (as `ImageSquare`).

| Field                  | Example Value                  | Description                                       |
|------------------------|-------------------------------|---------------------------------------------------|
| Source                 | File                          | Image file source                                 |
| Picture Name           | red.png / green.png / blue.png| Filename of the image                             |
| Alt                    | red / green / blue            | Alt text for the image                            |
| Title                  | red / green / blue            | Title or description                              |
| Display Order          | 10 / 20                       | UI display order                                  |
| Associated Attribute   | Select your favorite color    | Linked control/attribute                          |
| Associated Value       | Red / Green / Blue            | Value for the attribute                           |
| Picture Type           | ImageSquare / Product         | Type of image                                     |

**Example Images Mapped in UI:**
- `ImageSquare`: Used for selectable color squares (red, green, blue).
- `Product`: Used for main product image (e.g., Cadify logo).

---

## 4. 3D model export data formats

Digital manufacturing demands precise, machine ready data. Cadify builds a single source of truth from SolidWorks models and Excel rules, then outputs the right format for each process. From the configurator, validated parameters drive exports for CNC, laser cutting, and 3D printing, DXF for flat patterns and laser operations, STEP for milling, turning, and assemblies, STL or 3MF for additive workflows. Files stay consistent with the approved configuration, so machines receive exactly what they need the first time.

This section explains how these exports are created, named, and version bound, and how they travel with the order. It also covers the optional proxy model path, where you provide either a complete SolidWorks Pack and Go ZIP archive of the full 3D model, or a specific 3D export such as STEP or 3MF.

| Field                | Example Value      | Description                                  |
|----------------------|-------------------|----------------------------------------------|
| Destination tab      | 6 Fabricator / 7 SourceAdmin      | Where the result is stored   |
| File format          | step / zip        | Output file format                           |
| File name            | 3D_model_as_step.step / 3d_compressed.zip | Output file name     |
| Prompt               | 3D model in STEP / 3D model in zip | Display name in UI          |
| Display order        | 10 /20              | UI display order                           |

---

## Proxy Object Mapping

- **ProxyReport**: Defines Excel printing areas.
- **ProxyBrochure**: Defines downloadable PDF brochures.
- **ProxyPicture**: Defines product images and their attributes.
- **ProxyModel**: Defines downloadable 3D model files.

Each proxy is represented as a structured row in the Excel workbook, making it easy to configure and automate media management for products.

---

## UI Actions

- **Add PDF print**: Add a new Excel print configuration.
- **Add PDF as file**: Attach a downloadable PDF brochure.
- **Add picture**: Add new product images and associate them with controls.
- **Add model**: Add new downloadable 3D model output exported directly from Solidworks model.

Buttons at the bottom allow users to validate and apply changes, ensuring the product's media settings are correctly saved.

---

For more details, refer to the sample UI and Excel data structure above.
