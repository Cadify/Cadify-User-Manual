# Advanced technologies

Creating Web Controls and setting up calculations to have dynamically changing lists.

This guide shows how to build Web Controls for a TableTop product directly and wire controls to lookups and calculations that live in the Table Top Database sheet of the same workbook.

## Starting point
- Add a new worksheet and name it 'Table Top Database'
- Determine some static elements like the List of Materials and Available thicknesses for Wood (e.g., 10, 15, 20, 25, 30)
<img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/createStatics.png" alt="CreateStatics" style="vertical-align: middle;">

## Create the first Control
Create a control to manage material selection, name it 'Select Material,' and set up the values list to the material list created on the 'Table Top Database' tab.

| Parameter        | Value       |
|------------------|-------------|
| Name             | Select Material |
| Type             | List Radio Button |
| List Source      | =TEXTJOIN(";",TRUE,'Table Top Database'!$B$42:$B$45) |

<img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/createListControl.png" alt="CreateListControl" style="vertical-align: middle;">

## Set up your first calculation
To determine the available thicknesses based on the selected material, you will need to create your first formulas in 'Table Top Database':
- Determine the selected index of available materials:

| Target Cell        | Value       |
|------------------|-------------|
| 'H40' on Table Top Database tab           | =WHERE('Cadify MASTER'!G15;'Table Top Database'!B42:B45;0) |

- Now with the index, we can select the proper available thicknesses:

| Target Cell        | Value       |
|------------------|-------------|
| 'I42' on Table Top Database tab           | =CHOOSE(H40;D42:D46;E42:E46;F42:F45;G42:G45) |

<img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/createFirstDynamicList.png" alt="CreateListControlDynamic" style="vertical-align: middle;">

- As a last step, now create a control with the generated list:

| Parameter        | Value       |
|------------------|-------------|
| Name             | Select Thickness |
| Type             | List Dropdown |
| List Source      | =TEXTJOIN(";",TRUE,'Table Top Database'!$I$42:$I$59) |

<img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/createControlWithDynamicList.png" alt="CreateListControlDynamic" style="vertical-align: middle;">

💡 *Hint: Always select a range large enough to cover all possible values. Cadify will automatically remove any empty elements from the control, so you don’t need to worry about blanks.*

🎉 Congratulations! You have successfully created your first control with dynamically changing available thicknesses based on the selected material.
