# 📊 CadifyDartJson

The `CadifyDartJson` function generates a machine-learning inference JSON payload from the Cadify Master worksheet.

This JSON is intended to be consumed by external ML services and is typically used as input for `CadifyDartImage`.

## 📌 What It Does

When you enter this function into a cell, it:

- Resolves the calling cell and parses its own formula
- Uses the provided source range to determine a **column index**
- Reads parameter data from the **Cadify Master** worksheet
- Generates an inference JSON payload based on the selected ML model type
- Returns the JSON as a string

This function does **not** export SVG geometry or Cadify sketch entities.

## 🧾 Syntax

```excel
=CadifyDartJson(JsonType, SourceRange)
```

## 🧮 Parameters

| Parameter | Description |
|----------|-------------|
| `JSON export type` | Selects the ML model / JSON schema:<br>`0` = Bodan<br>`1` = Floris 1B Runpod<br>`2` = Floris 1B Local<br>`3` = Bodan 1B |
| `Source Range (Top-Left)` | Cell reference used to determine the **source column** in the Cadify Master worksheet. Only the top-left cell is required. |

`JsonType` is cast directly to the `MLModelTypes` enum internally.

## 🔁 Output

Returns a JSON string containing inference parameters derived from the Cadify Master sheet.

If JSON generation fails, the function returns:

```
Could not generate JSON.
```

## ⚙️ Behavior Details

- The function always reads from the worksheet named `CadifyMasterTab`
- The provided `SourceRange` is used **only** to resolve the column index
- Row information in `SourceRange` is ignored
- No bounds checking is performed on `JsonType`
- If DART processing is disabled internally, the function returns `CadifyDartJson` without executing

## 🔗 Typical Usage

`CadifyDartJson` is commonly used together with `CadifyDartImage`:

```excel
=CadifyDartImage("PreviewImage", "", CadifyDartJson(1, A2), 1, "B2", 10, "", "MyCadifySheet")
```

## ❌ What This Function Is Not

- Not an SVG exporter
- Not a Cadify geometry serializer
- Not related to `CadifySvg()` dynamic value extraction

---
