# 🖼️ CadifyImage

The `CadifyImage` function inserts an image from a named image library into a designated cell or position.

## 📌 What It Does
Loads and draws an image (e.g., logo, marker, diagram) at the defined cell, optionally rotated or layered with other shapes.

## 🧾 Syntax

```excel
=CadifyImage(imageId, imageName, imageList, imageFolder, target, rotation, zOrder, style, cadifySheetName)
```

## 🧮 Parameters

| Parameter         | Description |
|------------------|-------------|
| `imageId`         | Unique ID for image instance. |
| `imageName`       | Image file name (without extension). |
| `imageList`       | Semicolon-separated whitelist (`img1;img2`). |
| `imageFolder`     | Folder path, e.g. `Library:\Sketcher\Images`. |
| `target`          | Excel cell (like `"B5"`). |
| `rotation`        | Degrees of rotation. |
| `zOrder`          | Layer priority. |
| `style`           | Style tag (optional). |
| `cadifySheetName` | Name from `CadifySheet()`. |