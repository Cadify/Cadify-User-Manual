# 🌀 CadifyBezier

The `CadifyBezier` function draws a smooth Bézier curve using multiple control points from a range or array.

## 📌 What It Does
This function interpolates a smooth path using control points and can optionally generate offset paths and filled curves.

## 🧾 Syntax

```excel
=CadifyBezier(bezierName, bezierRange, steps, offset, opacity, zOrder, fillColor, style, cadifySheetName)
```

## 🧮 Parameters

| Parameter         | Description |
|------------------|-------------|
| `bezierName`      | Unique ID for the Bézier curve. |
| `bezierRange`     | Range or array containing control point coordinates. |
| `steps`           | Number of curve segments. |
| `offset`          | Optional offset from original path. |
| `opacity`         | Fill transparency (0–100). |
| `zOrder`          | Drawing layer order. |
| `fillColor`       | Optional RGB fill color (`"255,0,0"`). |
| `style`           | Style of the curve outline. |
| `cadifySheetName` | Reference to the Sketcher sheet. |