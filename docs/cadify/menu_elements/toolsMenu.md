# Tools Menu

This page explains the **Tools** menu in simple terms, focusing on what each option does and when it is available.

---

## Import/Export

### Import from design table

Loads parameter values from the product’s design table. **Disabled if no product is open.**

### Use Supplementary Excel Table

Opens and manages an additional Excel file with extra parameters.

### Mate Reference Generator

Helps generate mate references for assembly components.

---

## Product settings

### General Information

Opens product information settings (e.g., name, metadata). **Disabled if no product is open.**

### Save log files

Saves the add-in’s log files to the cloud for support or debugging.

---

## Update

### Validate Product

Runs a product validation check to find issues or inconsistencies. **Disabled if no product is open.**

### Change update parameter sequence

Lets you rearrange the order in which model parameters update. **Disabled if no product is open.**

### Reload Cadify Table

Reloads the product model with values from the Cadify Table. **Disabled if no product is open.**

### Reload Model

Reloads the currently active model in SolidWorks. **Disabled if no product is open.**

### Add Cadify control

Adds a new Cadify control element to the project. **Disabled if no product is open.**

### Control Hierarchy Resolver

The Control Hierarchy Resolver (CHR) is the Cadify function that organizes calculation order inside configuration workbooks. After changes in logic or parameters, CHR evaluates dependencies between formulas and inputs, then regenerates the correct sequence. This prevents circular references and ensures consistent updates. In this section, the manual explains how CHR operates, where it is applied, and the procedures for using it effectively.

#### Functional Description

The Control Hierarchy Resolver (CHR) is responsible for defining and maintaining the correct calculation sequence in Cadify configuration workbooks. When logic or parameters change, CHR systematically reviews dependencies between formulas and inputs, ensuring that each step is processed in the right order.

<div class="grid" style="display:flex; align-items:flex-start; gap:12px; flex-wrap:nowrap;">
  <div class="col-4" style="flex:0 0 65%; max-width:65%; box-sizing:border-box; padding-right:12px;">
    <p>The importance of this function can be illustrated with a staircase:</p>
    <p>Floor height must be defined first, as it sets the overall span.</p>
    <p>Based on the height, the number of steps is calculated.</p>
    <p>Only when both height and steps are known can the railing be determined.</p>
  </div>
  <div class="col-8" style="flex:0 0 35%; max-width:35%; box-sizing:border-box; text-align:center;">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/menu_elements/images/CalculationOrderForStaircase.png" alt="Textbox Wizard">
  </div>
</div>

Without CHR, these dependencies risk being processed in the wrong sequence, leading to circular references or stalled calculations. With CHR, the workbook logic is re-evaluated after every change, placing each calculation in its correct order. This guarantees stable updates, reliable outputs, and a seamless translation of customer choices into consistent engineering and production data.

---

## Drawings

### One-click Drawing

Creates standard drawings automatically. **Disabled if no product is open.**

### Create Drawing

Opens a dialog to create a new drawing. Enabled only when a project is open and drawing data is available.

### Open Drawing

Opens an existing saved drawing (only visible if drawings are available).

### Delete Drawing

Deletes a drawing from the current project.

### Settings for drawing

Opens the drawing settings page to customize drawing output. **Disabled if no product is open.**