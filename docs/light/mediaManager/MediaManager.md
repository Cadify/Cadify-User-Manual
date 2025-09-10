# Media Manager Documentation

This document describes the Media Manager tool used for managing product-related media in Cadify. The Media Manager allows users to set up printing areas from Excel workbooks, configure downloadable PDF brochures, and manage product pictures—all controlled via proxy objects in the code and stored in structured Excel worksheets.

## Overview

The Media Manager UI is divided into three main sections:

- **Print from Excel**: Configure print areas from specified worksheets and ranges.
- **PDF from File**: Set up downloadable PDF brochures for products.
- **Pictures**: Manage product images and associate them with controls.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/light/mediaManager/images/mediaManager.png" alt="MediaManager">

## Excel Data Mapping

The configuration for each media type is stored in a structured format in the Excel workbook. Each section uses a proxy object:
- `ProxyReport` for print areas
- `ProxyBrochure` for PDF brochures
- `ProxyPicture` for product images

The following example shows how these proxies are stored in the Excel workbook:

<img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/light/mediaManager/images/proxyInExcel.png" alt="ProxyInExcel">

---

## 1. Print from Excel (`ProxyReport`)

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

## Proxy Object Mapping

- **ProxyReport**: Defines Excel printing areas.
- **ProxyBrochure**: Defines downloadable PDF brochures.
- **ProxyPicture**: Defines product images and their attributes.

Each proxy is represented as a structured row in the Excel workbook, making it easy to configure and automate media management for products.

---

### Workflow Summary

1. **Configure print areas** in Excel via `ProxyReport`.
2. **Add downloadable PDFs** via `ProxyBrochure`.
3. **Assign and connect images** via `ProxyPicture` and link them to controls (e.g., ImageSquares).

---

## UI Actions

- **Add PDF print**: Add a new Excel print configuration.
- **Add PDF as file**: Attach a downloadable PDF brochure.
- **Add picture**: Add new product images and associate them with controls.

Buttons at the bottom allow users to validate and apply changes, ensuring the product's media settings are correctly saved.

---

For more details, refer to the sample UI and Excel data structure above.
