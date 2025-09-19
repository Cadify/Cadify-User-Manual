# 📊 CadifyGraph

The `CadifyGraph` function captures a chart from Excel and inserts it as an image into a specified cell range, with additional options for style, opacity, and color overlay.

## 📌 What It Does
When you use this function in a cell, it finds a chart (by name) on your sheet, exports it as a PNG image, and places it in the target Excel range. You can control opacity, fill color, style, and Z-order. This is useful for overlaying charts in CAD-like drawings or automation workflows.

## 🧾 Syntax

```excel
=CadifyGraph(shapeName, target, opacity, zOrder, fillColor, style, cadifySheetName)
```

## 🧮 Parameters

| Parameter         | Description |
|-------------------|-------------|
| `Source Shape Name`       | Name of the Excel ChartObject to export and insert as an image. |
| `Target range`          | Target cell range where the image will be inserted. (e.g., "B5") |
| `Opacity`         | Opacity of the chart image (0–100). |
| `Z order`          | Z-order for layering (higher numbers are on top). |
| `Fill color`       | Optional fill color for the background in `"R,G,B"` format (e.g., `"255,255,255"`). |
| `Style`           | Style to apply to the image border or line (e.g., "LineThin", "LineContour", "NoLine"). |
| `CadifySheet name` | Name of the CadifySheet to associate this chart with. |

## ✅ Example

```excel
=CadifyGraph("Chart 1", "B5", 30, 2, "255,255,255", "LineThin", "SHEET_1")
```

This will capture the chart named "Chart 1", insert its exported PNG into cell B5, set the fill color to white with 30% opacity, apply the "LineThin" style, and place it above objects with lower z-order on the sheet named "SHEET_1".

## 🔁 Behavior
- Captures the named chart and inserts it as an image into the specified target range.
- Applies fill color and opacity (if provided) to the chart's background and plot area.
- Sets border/line style if specified.
- Handles Z-order and ensures the image is correctly associated with the CadifySheet.
- Returns the string `'CadifyGraph'` if successful.

## 🔒 Notes
- The `shapeName` must match an existing Excel chart object.
- The image is a static snapshot of the chart at the time of execution.
- If a duplicate name or invalid parameter is given, an error string is returned.
- Opacity must be between 0 and 100.
- For advanced automation (e.g., programmatic chart overlays), combine with CadifySvg/CadifyJson as needed.

---

**Based on implementation in `CadifyFunctions.cs` (`CadifyGraph` function).**