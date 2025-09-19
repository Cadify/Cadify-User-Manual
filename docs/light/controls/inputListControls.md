# Input - List Web Controls

<p>This document provides an overview of the various <strong>List</strong> Web Control types that you can create to manipulate your product. Each control includes a preview that will be shown both in the Task Pane and on the published product in nopCommerce. Once you've created a control, you can set up references to dynamically update your Excel formulas.</p>

<p>You can download sample products from the <a href="https://github.com/Cadify/Cadify-User-Manual/tree/main/samples">samples folder</a>.</p>

---

## Static Lists
Lists in Cadify provide a simple way to present available choices for configuration. They are static by default, showing all options regardless of previous selections, which is ideal when every choice is always valid.

---

## Dynamic Lists
Dynamic Lists in Cadify provide structured handling of product variants and sub-variants. Instead of static ranges, lists are filtered in Excel and updated dynamically with each customer choice. This ensures that only valid options are presented and maintained throughout the configuration. In this section, the manual explains the logic, use cases, and configuration steps for implementing dynamic lists.

Dynamic lists in Cadify operate by filtering available options in Excel based on the customer’s current selection. Rather than showing all possible sub-variants at once, only the valid subset is displayed and updated interactively. This prevents errors and simplifies the configuration process.

<div class="grid" style="display:flex; align-items:flex-start; gap:12px; flex-wrap:nowrap;">
  <div class="col-4" style="flex:0 0 60%; max-width:60%; box-sizing:border-box; padding-right:12px;">
    The illustration demonstrates this principle. On the left, a complete list of variants is shown in Excel with both Variant A and Variant B together with their sub-variants. A filter is applied, represented by the funnel, which reduces the list according to the customer’s choice. On the right, the result is a clean table showing only the valid sub-variants of Variant A, in this case, a1, a2, a3.
  </div>
  <div class="col-8" style="flex:0 0 40%; max-width:40%; box-sizing:border-box; text-align:center;">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/DynamicLists.png" alt="DynamicLists">
  </div>
</div>

This mechanism ensures that:
Invalid or irrelevant sub-variants are never presented to the customer.
Each choice dynamically controls the list shown in the next step.
Excel remains the foundation for managing ranges and logic, but Cadify ensures that updates happen instantly in the web interface.

By relying on this structured filtering, large and complex product families can be managed without overwhelming the customer. For engineers, it secures a clear rule-based process that adapts as new variants are added.

---

## List Controls

### List Dropdown

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/list_dropdown_wizard.png" alt="List Dropdown Wizard">
  </div>
  <div class="col-8">
    <p>Drop-down selection from a defined list of values.</p>
    <ul>
      <li><strong>Example Name:</strong> Quantity</li>
      <li><strong>List Values:</strong> One;Two;Three</li>
      <li><strong>Example Value:</strong> One</li>
      <li><strong>Type:</strong> Input</li>
    </ul>
  </div>
</div>

---

### List Radio Button

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/list_radio_button_wizard.png" alt="List Radio Button Wizard">
  </div>
  <div class="col-8">
    <p>Radio button group for single selection from multiple options.</p>
    <ul>
      <li><strong>Example Name:</strong> Selector</li>
      <li><strong>List Values:</strong> One;Two;Three</li>
      <li><strong>Example Value:</strong> One</li>
      <li><strong>Type:</strong> Input</li>
    </ul>
  </div>
</div>

---

### Image Squares

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/image_squares_wizard.png" alt="Image Squares Wizard">
  </div>
  <div class="col-8">
    <p>Input control for selecting images represented as squares.</p>
    <ul>
      <li><strong>Example Name:</strong> Select your favorite color</li>
      <li><strong>List Values:</strong> Red;Green</li>
      <li><strong>Example Value:</strong> Red</li>
      <li><strong>Type:</strong> Input</li>
    </ul>
  </div>
</div>

---

### Checkboxes

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/checkboxes_wizard.png" alt="Checkboxes Wizard">
  </div>
  <div class="col-8">
    <p>Multi-select group from a list of values.</p>
    <ul>
      <li><strong>Example Name:</strong> Select multiple</li>
      <li><strong>List Values:</strong> 1;2;3;4;5;6;7;8</li>
      <li><strong>Example Value:</strong> 1;4</li>
      <li><strong>Type:</strong> Input</li>
    </ul>
  </div>
</div>

---

## Numericals

Numerical web controls in Cadify handle values that may include both static and dynamic min/max limits. Each input is validated against defined ranges, ensuring that calculations remain consistent and errors are avoided. When a value falls outside limits, the system applies strategies such as error messages or guided corrections. This section introduces the concept before detailing each numerical type.

### Numerical

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

### Spinbox Up Down

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

### Spinbox Slider

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

### List Numeric

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

## Other

### Textbox

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/textbox_wizard.png" alt="Textbox Wizard">
  </div>
  <div class="col-8">
    <p>A single-line text input for basic string values.</p>
    <ul>
      <li><strong>Example Name:</strong> Last Name</li>
      <li><strong>Example Value:</strong> John</li>
      <li><strong>Min/Max:</strong> 0 / 100</li>
      <li><strong>Type:</strong> Input</li>
    </ul>
  </div>
</div>

---

### Multiline Textbox

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/controls/images/multiline_textbox_wizard.png" alt="Multiline Textbox Wizard">
  </div>
  <div class="col-8">
    <p>A multi-line text input for longer or formatted string entries.</p>
    <ul>
      <li><strong>Example Name:</strong> First Name</li>
      <li><strong>Example Value:</strong> Smith</li>
      <li><strong>Min/Max:</strong> 0 / 100</li>
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
