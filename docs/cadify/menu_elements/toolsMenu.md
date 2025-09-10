# Tools Menu

This page explains the **Tools** menu in simple terms, focusing on what each option does and when it is available.

---

## Import/Export

### Import from design table

Loads parameter values from the product’s design table. **Disabled if no product is open.**

### Use Supplementary Excel Table

Opens and manages an additional Excel file with extra parameters.

### Merge excels *(debug only)*

Combines multiple Excel sources into one (only visible in debug mode).

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