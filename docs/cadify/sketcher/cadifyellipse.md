# 🥚 CadifyEllipse

The `CadifyEllipse` function draws an ellipse (or circle) at a given position with a specified width and height.

## 📌 What It Does
Places an ellipse into the sketch canvas, sized in mm and optionally styled and layered.

## 🧾 Syntax

```excel
=CadifyEllipse(ellipseName, x, y, width, height, style, zOrder, cadifySheetName)
```

## 🧮 Parameters

| Parameter         | Description |
|------------------|-------------|
| `ellipseName`     | Shape name (unique). |
| `x`, `y`          | Center position in mm. |
| `width`, `height` | Size in mm. |
| `style`           | Line or fill style. |
| `zOrder`          | Layering order. |
| `cadifySheetName` | Target Sketcher sheet. |