# Web Control Types Documentation

<p>This document provides an overview of the various <strong>Web Control</strong> types that you can create to manipulate your product. Each control includes a preview that will be shown both in the Task Pane and on the published product in nopCommerce. Once you've created a control, you can set up references to dynamically update your Excel formulas.</p>

<p>You can download sample products from the <a href="https://github.com/Cadify/Cadify-Light-User-Manual/tree/main/samples">samples folder</a>.</p>

---

## Textbox

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/textbox_wizard.png" alt="Textbox Wizard">
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

## Multiline Textbox

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/multiline_textbox_wizard.png" alt="Multiline Textbox Wizard">
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

## List Dropdown

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/list_dropdown_wizard.png" alt="List Dropdown Wizard">
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

## List Radio Button

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/list_radio_button_wizard.png" alt="List Radio Button Wizard">
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

## Image Squares

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/image_squares_wizard.png" alt="Image Squares Wizard">
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

## Numerical

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/numerical_wizard.png" alt="Numerical Wizard">
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
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/spinbox_updown_wizard.png" alt="Spinbox Up Down Wizard">
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
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/spinbox_slider_wizard.png" alt="Spinbox Slider Wizard">
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

## Checkboxes

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/checkboxes_wizard.png" alt="Checkboxes Wizard">
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

## List Numeric

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/list_numeric_wizard.png" alt="List Numeric Wizard">
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

## Custom Text

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/custom_text_wizard.png" alt="Custom Text Wizard">
  </div>
  <div class="col-8">
    <p>Output control for custom, static text.</p>
    <ul>
      <li><strong>Example Name:</strong> Full Name</li>
      <li><strong>Example Value:</strong> John Smith</li>
      <li><strong>Type:</strong> Output</li>
    </ul>
  </div>
</div>

---

## Custom HTML Text

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/custom_html_text_wizard.png" alt="Custom HTML Text Wizard">
  </div>
  <div class="col-8">
    <p>Output control for rich HTML-formatted content.</p>
    <ul>
      <li><strong>Example Name:</strong> HTML text</li>
      <li><strong>Example Value:</strong> <code>&lt;u&gt;Underline&lt;/u&gt;&lt;p&gt;paragraph&lt;/p&gt;</code></li>
      <li><strong>Type:</strong> Output</li>
    </ul>
  </div>
</div>

---

## Hyperlink

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/hyperlink_wizard.png" alt="Hyperlink Wizard">
  </div>
  <div class="col-8">
    <p>Output control for clickable links.</p>
    <ul>
      <li><strong>Example Name:</strong> Link</li>
      <li><strong>Example Value:</strong> https://cadify.gratis</li>
      <li><strong>Type:</strong> Output</li>
    </ul>
  </div>
</div>

---

## Numerical (Output)

<div class="grid">
  <div class="col-4">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/controls/images/numerical_output_wizard.png" alt="Numerical Output Wizard">
  </div>
  <div class="col-8">
    <p>Output control for computed or summary numeric values.</p>
    <ul>
      <li><strong>Example Name:</strong> Sum of A and B</li>
      <li><strong>Example Value:</strong> 25</li>
      <li><strong>Unit:</strong> mm</li>
      <li><strong>Type:</strong> Output</li>
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
