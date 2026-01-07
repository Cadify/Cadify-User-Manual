## Publishing a Sketcher Output

The Sketcher renders live **Cadify UDF** content in Excel, but these are **not published automatically**.  
To make your Sketcher visible in the browser, you must link it as an **Output** in the **Web Controls** panel.

### Quick Steps

1. Open **Web Controls** from the **Task Pane**.  
2. Click **Add → Output = Sketcher**.  
3. Re-publish your project to **cadify.gratis** or your connected commerce site.

> **Note:**  
> If no Web Control is linked to the Sketcher, the Named Sketcher will not be included in the online view.  
> Always verify Output mapping before publishing.  
>  
> **Tip:** The name of the Named Sketcher appears as the label on the corresponding web tab.

## User Assistance Features

Cadify provides several features to ensure your drawings and sketchers are correctly configured for the web.

### 1. Automatic Sketcher Control Creation
When you create a new `CadifySheet` UDF (with optional other UDFs) using the **New Sheet** wizard from the Cadify Ribbon in Excel, Cadify detects potential sketchers and prompts you:

> "Would you like us to automatically create a Sketcher output control for the newly inserted CadifySheet?"

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/sketcher/images/createSketcherControl.png" alt="Create Sketcher On New Sheet Wizzard" style="max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

This allows you to immediately link your new drawing to the web interface without manual setup.

### 2. Pre-Publish Validation
Before publishing, Cadify validates that all your defined Sketchers are actually connected to a Web Control. If unconnected sketchers are found, a warning appears:

> "{n} out of {total} Sketcher(s) are not included in a Sketcher Control, so they will not appear in the published product. Do you want to continue publishing anyway?
>
> To create the missing Sketchers, go to **Web Task Pane** → **Add Web Control**, and add the missing Sketcher Control(s) using the wizard."

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/sketcher/images/publishSketcherValidation.png" alt="Publish Validation Warning" style="max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">

### 3. Task Pane Status Bar
You can check the connectivity status of your sketchers at any time using the Task Pane status bar element. Hovering over the icon displays the current state:

*   **Missing Links:** *"{n} out of {total} Sketcher(s) are not included in a Sketcher Control, so they will not appear in the published product."*
*   **All Connected:** *"All ({total}) Sketchers are included in a Sketcher Control."*
*   **None Defined:** *"No Sketchers defined in the current product."*

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/sketcher/images/SketcherStatusBar.png" alt="Task Pane Status Ba" style="max-width:100%; height:auto; border:1px solid #ccc; border-radius:6px;">