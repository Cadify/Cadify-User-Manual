# Drawings

This chapter introduces how Cadify creates and manages drawings directly from the validated 3D model. All drawings remain synchronized with the approved configuration, any change in parameters regenerates the set consistently. 

You will learn how to control sheet formats and templates, view sets and title blocks, model and drawing dimensions, relative notes anchored to geometry and fixed notes for meta information, symbols and GD and T, BOM balloons and callouts. Cadify supports multiple drawings per product, and multiple sheets per drawing, while every sheet in a drawing uses the same sheet format template as the first sheet. Role based distribution delivers the right drawing to the right party, customer, contractor, installer, quality, with versioning and approval marks recorded. Generated drawing packs are attached to the order together with the BOM and machine ready files, so production starts without manual rework. 

The following sections describe the Drawing Task Pane, recommended workflows, approval options, and how drawing updates propagate safely through roles in 7 tabs.

## Creating a New Drawing

### Start a New Drawing
In **SolidWorks Task Pane → Tools → Drawings → Settings for Drawings**, click the **“+”** tab to create a drawing entry. Define:

- Drawing title
- Web store prompt
- Format template & margins
- Role-based distribution

Close the **Drawing Settings** window, then go to **Task Pane → Drawings** to structure and refine content.

### Accessing Drawing Task Pane Tabs
The **Drawings** tab includes four sub-tabs:

- **Model Dimensions**, which exposes/manages parametric dimensions from the 3D model.
- **Drawing Dimensions**, dimensions created directly in the drawing.
- **Notes**, including annotations, comments, and metadata.
- **Sketches**, for auxiliary views or highlighting geometry (to be documented).

Together, these tools configure drawing output end-to-end.

## Drawing Task Pane

### Model Dimensions

#### Purpose
Transfers dimensions defined in the 3D CAD model to the drawing, preserving design intent and avoiding manual re-entry. Updates in the model propagate to the drawing.

#### Structure
A hierarchical tree linked to the selected model:

- **Global Variables**, parameters controlling model-wide behavior.
- **Layout Sketches**, sketches with geometric definitions and dimension sets.
- **Features and Parts**, parametric elements with their dimensions.

Items expand to reveal named dimensions with references and values.

#### Available Elements
- Show/hide dimensions
- Text orientation: top/bottom/left/right
- Level assignment: inner/center/outer
- Text position: before/inside/after dimension line
- Add to horizontal/vertical sliders
- Optional value override
- Extension line gaps (before/after)
- Font family, size, underline

Checked dimensions are shown in the drawing and stored in **Cadify MASTER (Excel)** in the correct API map. Selecting a model dimension opens a sub-dialog to place it in the most appropriate view; the original view is highlighted in green and can be overridden.

#### Workflow
- Select target model, expand relevant sketches/features.
- Tick dimensions to display.
- Confirm insertion into the suggested view (or override).
- Adjust visibility and formatting.
- Decide whether the dimension is fixed or added to a slider.
- Verify it appears in the drawing and is registered in **Cadify MASTER (Excel)**.

#### Best Practices
- Use consistent naming conventions.
- Keep default SolidWorks names for feature-based sketches; give meaningful names to top-level layout/drawing sketches.
- Expose only relevant dimensions for the audience.
- Avoid over-crowding; use overrides sparingly.

### Drawing Dimensions

#### Purpose
Dimensions created directly in the drawing to clarify intent or highlight otherwise unshown measurements.

#### Structure
Lists user-created drawing dimensions with identifiers, references, and values. Also stored in **Cadify MASTER (Excel)**.

#### Available Elements
- Show/hide
- Text orientation and position
- Assign to sliders
- Value override
- Extension line gaps
- Font family, size, underline
- **Delete**, which permanently removes the dimension from the drawing and the Cadify MASTER/API.

#### Workflow
- Create dimensions by selecting edges/points/sketches.
- Adjust formatting/placement.
- Verify registration in **Cadify MASTER (Excel)**.
- Use **Delete** to remove from drawing and API when no longer needed.

#### Best Practices
- Prefer model dimensions when possible.
- Avoid duplicating dimensions already imported.
- Minimize overrides.
- Always use the **Delete** function for permanent removal.

### Notes

#### Purpose
Manages textual annotations (BOM info, process instructions, comments). Integrated with **Cadify MASTER (Excel)** so text can update from system data.

#### Structure
- **Header Notes**, global notes across the drawing
- **Fixed Notes**, fixed sheet position
- **Relative Notes**, attached to geometry with an arrow

Each note has an identifier, text, and formatting options.

#### Available Elements
- Show/hide
- Delete (removes from drawing and API)
- Position fixed notes by X/Y coordinates
- Anchor relative notes to geometry
- Multi-line text editing
- Font, size, underline

#### Fixed Notes
Static position (BOM, title blocks). Text can update automatically from Cadify.

#### Relative Notes
Follow model geometry while text can update dynamically from Cadify.

#### Workflow
- Create/select a note.
- Choose **fixed** or **relative**.
- Position or anchor accordingly.
- Enter text or allow Cadify updates.
- Confirm storage in **Cadify MASTER (Excel)**.

#### Best Practices
- Use fixed notes for BOM and title blocks.
- Use relative notes when annotation must follow geometry.
- Prefer Cadify-driven updates; minimize manual edits.
- Use **Delete** to remove from drawing and API.

### Sketches
*(To be completed later.)* Will cover adding auxiliary geometry, section outlines, and highlight features.