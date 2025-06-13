# ✏️ CadifyLine

The `CadifyLine` formula draws a straight line between two points on the Cadify Sketcher canvas within Excel.

## 📌 What It Does
When you enter this function into a cell, a line is created on the corresponding drawing area defined by the `CadifySheet()` function. The line is positioned precisely in millimeters, using the lower-left corner of the Sketcher area as the origin.

## 🧾 Syntax

```excel
=CadifyLine(lineName, startX, startY, endX, endY, style, cadifySheetName, zOrder)
```

## 🧮 Parameters

| Parameter         | Description |
|------------------|-------------|
| `lineName`        | A unique name for this line (used for updates). |
| `startX`, `startY`| Starting point (in mm) from the lower-left origin. |
| `endX`, `endY`    | Ending point (in mm) from the same origin. |
| `style`           | Line style and color (e.g., `"RedDash"`, `"BlackSolid"`, `"Suppress"` to hide). |
| `cadifySheetName` | The name provided in the related `CadifySheet()` call. |
| `zOrder`          | Drawing order (higher values are on top). |

## ✅ Example

```excel
=CadifyLine("MainLine", 0, 0, 100, 0, "BlackSolid", "SketchA", 1)
```

This draws a 100mm horizontal black line from the origin on the sheet named "SketchA".

## 🔁 Behavior
- If the same `lineName` is reused, the shape is updated (not duplicated).
- Using the style `"SUPPRESS"` will remove or hide the shape.
- Coordinates are measured in **millimeters**, converted automatically to Excel shape units.

## 🔒 Notes
- `CadifySheet()` must be set up on the same worksheet to define the drawing area.
- This function automatically tracks changes and updates/redraws only when needed.
