# 📊 CadifyDartJson

The CadifyDartJson function generates a machine-learning inference JSON payload from the Cadify Master worksheet.
It is designed to feed downstream DART or SolidWorks image generation pipelines.

This function is generated and managed automatically by Cadify.

---

## 📌 What It Does

CadifyDartJson reads structured parameter data from the Cadify Master sheet and converts it into a JSON format compatible with selected ML models.

The function:
- Resolves a source column based on a provided cell reference
- Selects an ML model or JSON schema via an enum-backed numeric parameter
- Delegates JSON creation to SolidworksDAL.GetInferenceJson

This function does not serialize SVG geometry or Cadify sketch entities.

---

## 🧾 Syntax

=CadifyDartJson(JsonType, SourceRange)

---

## 🧮 Parameters

Parameter: JsonType  
Type: Number  
Description:
0 = Bodan  
1 = Floris 1B Runpod  
2 = Floris 1B Local  
3 = Bodan 1B  

Parameter: SourceRange  
Type: Text  
Description:
Cell reference used to determine the source column in the Cadify Master worksheet.
Only the top-left cell is required.

JsonType is cast directly to the MLModelTypes enum internally.

---

## 🔁 Output

Returns a JSON string containing inference parameters derived from the Cadify Master sheet.

If JSON generation fails, the function returns:
Could not generate JSON.

---

## ⚙️ Implementation Details

- The function always scans the worksheet named CadifyMasterTab
- SourceRange is parsed from the calling formula to resolve the column index
- Only the column position is used, row information is ignored
- If DART processing is disabled internally, the function returns CadifyDartJson without execution
- No bounds validation is performed on JsonType

---

## 🔗 Typical Usage

CadifyDartJson is typically used together with CadifyDartImage to:
1. Generate inference JSON
2. Submit it to an ML endpoint
3. Render the resulting image into a Cadify sketch

---

## ❌ What This Function Is Not

- Not an SVG exporter
- Not a Cadify geometry serializer
- Not related to CadifySvg dynamic value extraction

---
