# Input - Numerical Web Controls

<p>This document provides an overview of the various <strong>Numerical</strong> Web Control types that you can create to manipulate your product. Each control includes a preview that will be shown both in the Task Pane and on the published product in nopCommerce. Once you've created a control, you can set up references to dynamically update your Excel formulas.</p>

<p>You can download sample products from the <a href="https://github.com/Cadify/Cadify-User-Manual/tree/main/samples">samples folder</a>.</p>

---

Numerical web controls in Cadify handle values that may include both static and dynamic min/max limits. Each input is validated against defined ranges, ensuring that calculations remain consistent and errors are avoided. When a value falls outside limits, the system applies strategies such as error messages or guided corrections. This section introduces the concept before detailing each numerical type.

Example: Hole Count on PCD
Numerical controls often need both minimum and maximum values, and these may change dynamically with the geometry. The illustration shows a case where the number of holes on a pitch circle (PCD) depends on hole size and available space.

<div class="grid" style="display:flex; align-items:flex-start; gap:12px; flex-wrap:nowrap;">
  <div class="col-4" style="flex:0 0 60%; max-width:60%; box-sizing:border-box; padding-right:12px;">
    If the user enters a value above the maximum allowed, the Excel field turns red and a message appears, as shown in the example where 11 holes is outside the valid range of 4–10. Cadify then applies a chosen strategy: block the value, suggest a valid alternative, or automatically correct it.
  </div>
  <div class="col-8" style="flex:0 0 40%; max-width:40%; box-sizing:border-box; text-align:center;">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/menu_elements/images/MaxMinHolesInPCD.png" alt="Textbox Wizard">
  </div>
</div>

This ensures that inputs always respect physical limits and that the resulting data remains consistent and usable in production.

---

## Numerical

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/numerical_wizard.png" alt="Numerical Wizard">
  </div>
  <div class="col-8">
    <p>Simple numeric input.</p>
    <ul>
      <li><strong>Example Name:</strong> How tall are you</li>
      <li><strong>Example Value:</strong> 1900</li>
      <li><strong>Unit:</strong> mm</li>
      <li><strong>Min/Max:</strong> 0 / 10000</li>
      <li><strong>Decimal:</strong> 0</li>
      <li><strong>Increment:</strong> 1</li>
      <li><strong>Type:</strong> Output</li>
    </ul>
  </div>
</div>

---

## Spinbox Up Down

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/spinbox_updown_wizard.png" alt="Spinbox Up Down Wizard">
  </div>
  <div class="col-8">
    <p>Numeric input with increment/decrement buttons.</p>
    <ul>
      <li><strong>Example Name:</strong> Number A</li>
      <li><strong>Example Value:</strong> 10</li>
      <li><strong>Unit:</strong> mm</li>
      <li><strong>Min/Max:</strong> 1 / 1000</li>
      <li><strong>Decimal:</strong> 0</li>
      <li><strong>Increment:</strong> 1</li>
      <li><strong>Type:</strong> Input</li>
    </ul>
  </div>
</div>

---

## Spinbox Slider

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/spinbox_slider_wizard.png" alt="Spinbox Slider Wizard">
  </div>
  <div class="col-8">
    <p>Slider control for numeric input within a range.</p>
    <ul>
      <li><strong>Example Name:</strong> Number B</li>
      <li><strong>Example Value:</strong> 15</li>
      <li><strong>Unit:</strong> mm</li>
      <li><strong>Min/Max:</strong> 1 / 1000</li>
      <li><strong>Decimal:</strong> 0</li>
      <li><strong>Increment:</strong> 1</li>
      <li><strong>Type:</strong> Input</li>
    </ul>
  </div>
</div>

---

## List Numeric

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/list_numeric_wizard.png" alt="List Numeric Wizard">
  </div>
  <div class="col-8">
    <p>Input control for lists of numeric values.</p>
    <ul>
      <li><strong>Example Name:</strong> Numeric List</li>
      <li><strong>List Values:</strong> 1;2;3;4;5;6;7</li>
      <li><strong>Unit:</strong> mm</li>
      <li><strong>Type:</strong> Input</li>
    </ul>
  </div>
</div>

---

## Notes

<ul>
  <li><strong>Min/Max</strong> indicates allowed range for numeric controls.</li>
  <li><strong>Type</strong> is either "Input" (user provides value) or "Output" (value shown to user).</li>
  <li><strong>Increment/Decimal</strong> are relevant for numeric controls to define step size and precision.</li>
  <li><strong>List Values</strong> are separated by semicolons.</li>
  <li>Controls with <strong>Condition</strong> or <strong>CT Settings</strong> may have additional rules for when and how they're displayed or editable.</li>
</ul>
