# ✍️ CadifyText

The `CadifyText` function places custom text between two reference points in your Sketcher area.

## 📌 What It Does
You can insert simple text annotations along a line, aligned based on the endpoints and offset from the baseline.

## 🧾 Syntax

```excel
=CadifyText(textName, startX, startY, endX, endY, offsetDistance, zOrder, text, textAlignment, cadifySheetName)
```

## 🧮 Parameters

| Parameter         | Description |
|------------------|-------------|
| `textName`        | Identifier for the text shape. |
| `startX`, `startY`| Start point in mm. |
| `endX`, `endY`    | End point. |
| `offsetDistance`  | Offset from the baseline. |
| `zOrder`          | Drawing order level. |
| `text`            | The string to be displayed. |
| `textAlignment`   | E.g. `"CENTER"`, `"LEFT INSIDE"`, `"RIGHT OUTSIDE"`. |
| `cadifySheetName` | Name of the drawing sheet defined by `CadifySheet()`. |