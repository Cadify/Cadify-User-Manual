# Creating Default UDFs via the Cadify Tab

To create defaults from UDFs, follow these steps:

1. **Open the Cadify Tab in Excel**  
   Select the **Cadify** tab on the Excel ribbon.

2. **Find the Sketcher Region**  
   Within the Cadify tab, locate the **Sketcher** section and click the **New Sheet** button.

3. **Select and Validate a Range**  
   Select the desired cell range in your worksheet.

4. When you click **New Sheet**, Cadify validates your selection, checking that:
    - All cells in the active area are empty,
    - The left column is empty,
    - A 12-column wide range is empty,
    - Rows below for functions are empty.

5. The UI provides visual feedback for each validation step.

6. **Configure Default Functions**  
   After successful validation, you can select which default functions (UDFs) to create: **Cadify Line**, **Cadify Rectangle**, **Cadify Holes**, etc.

7. Each function shows a preview of its parameters and default values for the selected range.

8. **Create UDFs**  
   Click **Ok** to insert the selected UDFs in the validated sheet area.

9. Cadify will generate the corresponding formulas and data layouts automatically.

---

**Example Screenshot**  
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/sketcher/images/image.png" alt="Example">

---

With the Sketcher, you can quickly build a new sheet and insert default UDFs by:
- Using the **Cadify** ribbon tab and **New Sheet** menu item.
- Validating the selected range.
- Choosing which UDFs to add through a user-friendly interface.
- Automatically generating formulas and layout for engineering tasks.

**Create output to show on NopCommerce Product Page**

1. **Add a new Web Control**
    Click on 'Add' button on Task Pane and create a new Web Control that will create a tab container to show the svg output created from your 'Sketcher'
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/sketcher/images/addControl.png" alt="AddControl">

2. **Creation Example**
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/sketcher/images/createSvg.png" alt="CreationExample">

3. **Product preview in NopCommerce**
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/sketcher/images/nopCpreview.png" alt="ProductPreview">