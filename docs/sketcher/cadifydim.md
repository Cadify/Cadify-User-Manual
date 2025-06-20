# 📏 CadifyDim

The `CadifyDim` function creates a dimension object between two points in the Sketcher area of your worksheet.

## 📌 What It Does
It places a dimension line with optional gap and offset, along with a label text (such as length or custom string) aligned to the line.

## 🧾 Syntax

```excel
=CadifyDim(dimName, startX, startY, endX, endY, offsetDistance, gapExtension, zOrder, text, textAlignment, cadifySheetName)
```

## 🧮 Parameters

| Parameter         | Description |
|------------------|-------------|
| `dimName`         | Unique identifier for the dimension shape. |
| `startX`, `startY`| Start point in mm from the Sketcher origin. |
| `endX`, `endY`    | End point in mm. |
| `offsetDistance`  | Distance from the measured line to the dimension line. |
| `gapExtension`    | Extra space beyond endpoints (like architectural ticks). |
| `zOrder`          | Drawing order level. |
| `text`            | Label or measurement text. |
| `textAlignment`   | Alignment (e.g., `"CENTER"`, `"LEFT INSIDE"`). |
| `cadifySheetName` | Name of the CadifySheet region. |