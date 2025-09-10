# 🕳️ CadifyHoles

The `CadifyHoles` function draws multiple holes (circles or ellipses) from a provided range of parameters.

## 📌 What It Does
Reads a table or array of hole positions and sizes, drawing them in the specified sketch area.

## 🧾 Syntax

```excel
=CadifyHoles(holesRange, zOrder, style, cadifySheetName)
```

## 🧮 Parameters

| Parameter         | Description |
|------------------|-------------|
| `holesRange`      | Table containing hole specs (e.g., `x`, `y`, `diameter`). |
| `zOrder`          | Display layer. |
| `style`           | Line or fill style. |
| `cadifySheetName` | Sketcher drawing sheet name. |