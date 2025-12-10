# Yellow Brick Road

The Yellow Brick Road is a best practice for structuring product databases in Cadify. It introduces a consistent worksheet layout, with Row 40 marked in yellow as the reference line for the active variant. All tables are placed below Row 40, and all helper data is placed above it. Formulas are set up so the currently selected variant always appears on the yellow line, making yellow a clear visual indicator of what is active.

This approach simplifies expansion of large models and makes it easier to trace changes and troubleshoot errors in shared workbooks.

### The principle

For each product, create a dedicated worksheet, for example Product DB (where Product is replaced by your product name). In this worksheet, highlight Row 40 in yellow.

This yellow row acts as a clear reference line:

- All tables are placed below Row 40  
- All helper information is placed above Row 40  
- Formulas are set up so the currently selected variant is always shown on Row 40  

The result is that the yellow line is the active variant. With a consistent layout across all product sheets, it becomes much easier to maintain, extend, and debug product databases, especially when multiple people collaborate on the same workbook.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/product/bestPractices/images/yellowBrickRoad.png" alt="CreateStatics" style="vertical-align: middle;max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">