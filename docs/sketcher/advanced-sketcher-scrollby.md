# Advanced Option: Scroll-By Rules for Sketcher Tabs in Cadify Sketcher

This guide describes an advanced feature in Cadify Sketcher that allows you to dynamically control which Sketcher tab is displayed based on user input or selection. This is especially useful when you have multiple Controls and multiple Sketcher Tabs in your product, and you want to create a "scroll-by" rule to determine which Sketcher tab should be shown for each control.

---

## What is a Scroll-By Rule?

A scroll-by rule links a Control (such as a dropdown or input field) to a specific Sketcher tab (sheet). Based on the user’s selection in the Control, the corresponding Sketcher tab is activated and displayed. This enables a highly dynamic and responsive user experience.

---

## Setting Up Scroll-By Rules

To configure scroll-by rules, follow these steps in the Control Editor:

### 1. Create a new Sketcher Control

- **Cadify Control:** Set this to `Sketcher`.
- **Available Sketcher Sheet(s):** Select the Sketcher tab (sheet) you want this rule to affect.
- **Display Order:** Set the display order if needed.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/sketcher/images/addsketcherscrollby.png" alt="AddSketcher">

### 2. Define Scroll-By Parameters

On the right side of the Control Editor, you will find the section for scroll-by parameters:

#### Steps:
1. **Available Input Parameters:** Select the parameter you want to use as the basis for the scroll-by rule (e.g., "Select your favorite color").
2. Click **Add reference** to add it to the **Selected Scroll-by parameters** list.

The screenshot below shows a parameter ("Select your favorite color") added as a scroll-by parameter:

<img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/sketcher/images/addedscrollby.png" alt="AddedScrollBy">

#### Tip:
Once a parameter is added, it will be highlighted in the **Selected Scroll-by parameters**. The **Available values for condition** section will display all possible values for this parameter (e.g., Red, Green, Blue).

### 3. (Optional) Define Specific Condition Values

You can further refine the rule by selecting which parameter values should trigger the display of this Sketcher tab.

- **Available values for condition:** Lists all possible parameter values.
- **Selected condition values:** Add values here if you only want the Sketcher tab to show for specific inputs. (If left empty, the rule applies to all values.)

---

## Example Use Case

You can download a sample product from the [sample folder](https://github.com/Cadify/Cadify-Light-User-Manual/tree/main/samples/ScrollBy).

Suppose you have a control for "Select your favorite color" and three Sketcher tabs (Sheet A, Sheet B, Sheet C). You can configure:

- If the user scrolls the "Select your favorite color" control to the middle, show Sheet C.
- If "Choose a Letter", show Sheet D.
- If "Selector", show Sheet B.

This setup enables a tailored experience where the visible Sketcher tab responds directly to the user's input.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-Light-User-Manual/main/docs/sketcher/images/ScrollByActivation.png" alt="ScrollByActivation">

---

## Summary

By leveraging scroll-by rules in Cadify Sketcher, you can create sophisticated, responsive forms that adapt to user choices. This is particularly valuable in complex products with multiple controls and Sketcher tabs.

