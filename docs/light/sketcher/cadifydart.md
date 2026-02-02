# 🎯 CadifyDart

The `CadifyDart` function generates a machine-learning compatible JSON payload from your Cadify data, sends it to an external generative AI service, and inserts the resulting image directly into your Excel sheet.

It combines the functionality of generating inference JSON and rendering the result image into a single, synchronous function compatible with SolidWorks.

## 📌 What It Does

When you enter this function into a cell, it:

1. Resolves a source column from the provided `Source Range`.
2. Generates an inference JSON payload based on your selected `JSON export type` (Bodan, Floris, etc.).
3. Sends this JSON to the appropriate ML endpoint.
4. Receives a generated image (base64) from the service.
5. Inserts the image into the worksheet at the specified `Target range`.

## 🧾 Syntax

```excel
=CadifyDart(ImageId, JsonType, SourceRange, Target, ZOrder, Style, CadifySheetName)
```

## 🧮 Parameters

| Parameter | Type | Description |
|:---|:---|:---|
| **Named Dart Image** (`ImageId`) | String | Unique name to identify the dart image. Used to update/replace the image on subsequent runs. |
| **JSON export type** (`JsonType`) | String/Enum | Type of the JSON / Model to use. <br>Values: `'BODAN'`, `'FLORIS_1B_RUNPOD'`, `'FLORIS_1B_LOCAL'`, `'BODAN1B'`. |
| **Source Range (Top-Left)** (`SourceRange`) | Reference | The range (cell) used to determine the source column for JSON parameters. The top-left cell is sufficient. |
| **Target range** (`Target`) | String/Ref | Target range address (e.g., `"B2"`) where the picture will be inserted. |
| **Z order** (`ZOrder`) | Number | Z-order of the image (stacking order). |
| **Style** (`Style`) | String | Style of the image, use `"NoLine"` for default behaviour. Use `"Suppress"` to skip image generation/update. |
| **CadifySheet name** (`CadifySheetName`) | String | The name of the corresponding `CadifySheet()` function in the workbook. |

## 🔁 Behavior

- **Synchronous Execution**: The function waits for the external service to respond before returning.
- **Endpoints**: The function automatically selects the correct API endpoint based on the `JSON export type`.
- **Caching**: It uses a cache key based on inputs and data signature to avoid regenerating the image if the inputs haven't changed.
- **Image Management**: It automatically removes the previous image with the same `ImageId` before inserting the new one.
- **Return Value**: Returns the function name (`CadifyDart`) on success or suppress, or a status/error message (e.g., execution time).

## ⚙️ Model Types

The `JSON export type` determines the model and endpoint used:

- `BODAN`: Uses the Bodan model endpoint (`/predict/image_base64`).
- `BODAN1B`: Uses the Bodan 1B model endpoint (`/predict`).
- `FLORIS_1B_RUNPOD`: Uses the Runpod API for the Floris 1B model.
- `FLORIS_1B_LOCAL`: Uses a local endpoint for the Floris 1B model.

## ✅ Example

```excel
=CadifyDart("MyGenImage", "FLORIS_1B_RUNPOD", C5, "E10", 2, "Normal", "MySheet")
```

This example:

1. Reads parameters from the column of cell `C5`.

2. Generates JSON for the `FLORIS_1B_RUNPOD` model.

3. Sends the request and places the resulting image at cell `E10`.

4. Names the image `"MyGenImage"`.

## ⚠️ Notes
- The function requires network access to the configured endpoints.
- If the `Style` parameter is set to `"Suppress"` (case-insensitive), the function does nothing and returns its name.
- Invalid or unsupported `JSON export type` values will result in an error message.
