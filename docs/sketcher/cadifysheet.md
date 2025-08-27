# 📐 CadifySheet

Defines a named drawing area within your Excel worksheet.

## 📌 What It Does
This function designates a rectangular sheet area that other Cadify functions can reference for drawing shapes.

## 🧾 Syntax

```excel
=CadifySheet(sheetName, unit, gridLines, sheetRange)
```

## 🧮 Parameters

| Parameter       | Description |
|-----------------|-------------|
| `sheetName`     | Unique name for the sheet (used by other functions). |
| `unit`          | Units of measurement (e.g., `"mm"`). |
| `gridLines`     | `"Grid"` or `"NoGrid"` to show/hide background grid. |
| `sheetRange`    | Excel range (e.g., `"A1:F20"`) for the drawing canvas. |

## 🔁 Output

To update the following values click on 'Cadify Refresh'

<img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/taskPane/images/ribonRefresh.png" alt="RefreshButton" style="vertical-align: middle;">

| Parameter | Description |
|-----------|-------------|
| `Max X`   | Determines the width of the sketcher area in the selected unit. |
| `Max Y`   | Determines the height of the sketcher area in the selected unit. |
