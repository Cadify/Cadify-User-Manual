# 🖼️ CadifyImage Function

## Overview
The `CadifyImage` function inserts and manages images in your Excel worksheet as part of the Cadify sketcher system. It allows you to display images with custom positioning, rotation, and layering.

## Syntax

```excel
=CadifyImage(imageId, imageName, imageList, imageFolder, target, rotation, zOrder, style, cadifySheetName)
```

## Parameters

| Parameter | Type | Required | Description | Example |
|-----------|------|----------|-------------|---------|
| **Named Image** | String | Yes | A unique name to identify this image | `"ProductLogo"` |
| **Current File Name** | String | Yes | The image file name (without extension) | `"company_logo"` |
| **Image list** | String | Yes | List of available images, separated by semicolons | `"logo1;logo2;logo3"` |
| **Image folder** | String | Yes | Location in the Library where images are stored | `"Library:\Sketcher\Images"` |
| **Target range** | String | Yes | Excel cell range where the image will appear | `"B2:D6"` |
| **Rotation** | Number | Yes | Rotation angle in degrees (0-360) | `0` or `45` |
| **Z order** | Number | Yes | Layering order (higher numbers appear on top) | `1` |
| **Style** | String | Yes | Display style (use `"SUPPRESS"` to hide) | `"NoLine"` |
| **CadifySheet name** | String | Yes | Name of your CadifySheet function | `"MainSheet"` |

## Usage Examples

### Basic Image
Insert a logo in cells B2 through D6:

```excel
=CadifyImage("logo", "company_logo", "company_logo", "Library:\Sketcher\Images", "B2:D6", 0, 1, "NoLine", "MainSheet")
```

### Rotated Image
Insert a banner rotated 45 degrees:

```excel
=CadifyImage("banner", "promotional_banner", "promotional_banner;seasonal_banner", "Library:\Sketcher\Banners", "E10:H15", 45, 2, "LineContour", "MainSheet")
```

### Hidden Image
Create an image that won't be displayed:

```excel
=CadifyImage("hidden", "background", "background", "Library:\Sketcher\Hidden", "A1:A1", 0, 1, "SUPPRESS", "MainSheet")
```

## Return Values

| Return Value | Meaning |
|--------------|---------|
| `"CadifyImage"` | Success - image inserted/updated successfully |
| `"Could not determine the caller cell"` | Error - unable to identify the calling cell |
| `"Image target range must be set!"` | Error - target range is null or invalid |
| `"Sheet's Name Error"` | Error - CadifySheet name not found or invalid |
| `"Named Image parameter must be set"` | Error - imageId is empty |
| `"Invalid FileName of Image"` | Error - imageName contains invalid characters |
| `"Parameter's Error"` | Error - one or more required parameters are missing/empty |
| `"Image is not in Image List"` | Error - imageName not found in imageList |
| `"Image folder must be set!"` | Error - imageFolder is empty |
| `"Image folder must start with: Library:\"` | Error - imageFolder doesn't start with required prefix |
| `"Name is duplicate"` | Error - imageId already exists on the same sheet |
| `"Cannot determine folder path of the image."` | Error - unable to resolve the folder path |
| `"Image Missing"` | Error - image file not found in the specified location |

## Important Notes

### Image Setup Requirements

1. **Library Location**: Images must be stored in your Cadify Library
2. **Folder Path**: Must start with `Library:\Sketcher\`
3. **File Formats**: Supports .png, .jpg, .jpeg, .bmp, .gif
4. **Local Sync**: The library must be synced to your computer to display images

### Image Naming

- Each image must have a unique **Named Image** identifier
- The **Current File Name** must match a filename in the library (without extension)
- The **Current File Name** must appear in the **Image list** parameter

### Caching Behavior

The function uses intelligent caching to improve performance:

- If parameters haven't changed, the cached result is returned immediately
- This prevents unnecessary recalculation and file access
- Changing any parameter will trigger a full recalculation

## Common Issues & Solutions

### "Image Missing"
**Cause**: The image file cannot be found in the specified location.

**Solutions**:

- Verify the image file exists in the library folder
- Check that the file has a supported extension (.png, .jpg, etc.)
- Ensure the library is synced to your local computer
- Verify the file name matches exactly (case-sensitive)

### "Name is duplicate"
**Cause**: Another CadifyImage function on the same worksheet is using the same image ID.

**Solutions**:

- Choose a unique name for the **Named Image** parameter
- Check for other CadifyImage functions with the same ID
- Search the worksheet for duplicate image names

### "Image is not in Image List"
**Cause**: The Current File Name doesn't appear in the Image list parameter.

**Solutions**:

- Add the image name to the semicolon-separated image list
- Check for typos in both parameters
- Ensure exact name matching (including case)

### "Sheet's Name Error"
**Cause**: The specified CadifySheet function cannot be found.

**Solutions**:

- Verify a CadifySheet function exists with the specified name
- Ensure the CadifySheet is on the same worksheet
- Check the spelling of the sheet name parameter

### "Image folder must start with: Library:\""
**Cause**: The folder path doesn't follow the required format.

**Solutions**:

- Always start the path with `Library:\Sketcher\`
- Example: `"Library:\Sketcher\ProductImages"`
- Don't use local file paths or network paths

## Best Practices

### 1. Use Descriptive Names
Always use clear, descriptive names for the **Named Image** parameter:

```excel
✓ Good: "ProductImage_Front", "Logo_Header", "Banner_Seasonal"
✗ Bad: "img1", "pic", "temp"
```

### 2. Organize Image Lists
Keep your image lists organized and up-to-date:

```excel
✓ Good: "logo_2024;logo_2023;logo_legacy"
✗ Bad: Including non-existent images in the list
```

### 3. Use Fixed Ranges
Use fixed cell ranges for consistent positioning:

```excel
✓ Good: "B2:D6" - absolute range
✗ Avoid: Dynamic ranges that might shift
```

### 4. Plan Z-Order Values
Plan z-order values to avoid layering conflicts:

```excel
Background images: 1-10
Content images: 11-20
Foreground images: 21-30
```

### 5. Use Standard Style Names
Use standard style names for predictable results:

```excel
Common styles: "NoLine", "LineContour", "SUPPRESS"
```

## Advanced Features

### Dynamic Image Switching

You can switch images dynamically by changing the **Current File Name** parameter:

```excel
=CadifyImage("dynamicImage", A1, "image1;image2;image3", "Library:\Sketcher\Dynamic", "B2:D6", 0, 1, "NoLine", "MainSheet")
```

Where cell A1 contains the current image name.

### Suppressing Images

To temporarily hide an image without deleting the function:

```excel
=CadifyImage("tempHidden", "logo", "logo", "Library:\Sketcher\Images", "B2:D6", 0, 1, "SUPPRESS", "MainSheet")
```

### Rotation Effects

Create rotation effects by referencing a cell with the rotation angle:

```excel
=CadifyImage("rotatingLogo", "logo", "logo", "Library:\Sketcher\Images", "B2:D6", A1, 1, "NoLine", "MainSheet")
```

Where cell A1 contains a value from 0 to 360.

## Technical Details

### How It Works

1. The function validates all input parameters
2. It searches for the image file in the library with multiple extension attempts
3. The old image shape (if any) is automatically removed
4. A new image shape is inserted at the specified location
5. The image is sized to fit the target range
6. Rotation is applied if specified
7. The image is layered according to the z-order value

### File System Integration

The function integrates with the Cadify Library system:

- `imageFolder` is converted from `Library:\` prefix to the actual local library path
- `CommonFunction.GetFolderPath()` resolves the Library path to the local sync location
- `CommonFunction.GetImagePath()` searches for the image file with various extensions
- If the library isn't synced locally, images won't be found

### Performance Considerations

- **Caching**: Results are cached based on all input parameters
- **Screen Updates**: Screen updating is disabled during image operations for better performance
- **Bulk Operations**: The function handles file operations efficiently

## Integration with Other Functions

### CadifySheet
Every CadifyImage must reference a CadifySheet function:

```excel
=CadifySheet("MainSheet", "mm", "Grid", "A1:Z50")
=CadifyImage("logo", "company", "company", "Library:\Sketcher\Images", "B2:D6", 0, 1, "NoLine", "MainSheet")
```

### CadifySvg
Images can be included in SVG generation:

```excel
=CadifySvg(A1, , , , B2:B5, , , , , , , )
```

Where B2:B5 contains CadifyImage functions.

## Troubleshooting Guide

### Image Not Displaying

**Checklist**:

1. ☐ Is the library synced to your local computer?

2. ☐ Does the image file exist in the specified folder?

3. ☐ Is the file extension supported (.png, .jpg, .jpeg, .bmp, .gif)?

4. ☐ Is the image name spelled correctly (case-sensitive)?

5. ☐ Is the target range valid and not protected?

6. ☐ Is the style set to something other than "SUPPRESS"?

### Function Returns Error

**Checklist**:

1. ☐ Are all required parameters provided?

2. ☐ Does the CadifySheet function exist?

3. ☐ Is the image folder path starting with `Library:\Sketcher\`?

4. ☐ Is the image name in the image list?

5. ☐ Is the Named Image parameter unique on this sheet?


## Related Functions

- **CadifySheet**: Defines the coordinate system and working area
- **CadifySvg**: Generates SVG output including images
- **CadifyGraph**: Creates images from chart shapes
- **CadifyMosaic**: Legacy function for image duplication

## Limitations

1. **Image Format**: Limited to formats supported by Excel Shapes (.png, .jpg, .jpeg, .bmp, .gif)
2. **Library System**: Images must be located in the Cadify Library system (path must start with `Library:\Sketcher\`)
3. **Local Sync Required**: Images are only accessible if the library has been synced to the local file system via `localLibraryPath`
4. **Naming**: Image IDs must be unique per worksheet
5. **Path Structure**: The `imageFolder` parameter must follow the Library path convention (`Library:\Sketcher\...`)
6. **Calculation**: Requires manual recalculation when image files change on disk or library sync updates

## FAQ

**Q: Can I use images from my local hard drive?**  
A: No, images must be in the Cadify Library system starting with `Library:\Sketcher\`.

**Q: What happens if I change the image file?**  
A: You'll need to manually recalculate the function (F9 or Ctrl+Alt+F9) to see the updated image.

**Q: Can I use the same image multiple times?**  
A: Yes, but each instance must have a unique **Named Image** identifier.

**Q: Does the image resize automatically?**  
A: Yes, the image is automatically sized to fit the target range.

**Q: Can I animate images?**  
A: Not directly, but you can use cell references for rotation and image name to create dynamic effects.

## See Also

- [CadifySheet Function](cadifysheet.md)
- [CadifySvg Function](cadifysvg.md)
- [Cadify Sketcher Overview](../overview.md)
- [Library Management](../../library/overview.md)