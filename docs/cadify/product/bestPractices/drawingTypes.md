# Drawing Types in Cadify


In Cadify, there are three basic types of drawing sheets you can create, plus a fourth option for create one from an existing sheet. Each type serves a different purpose in your workflow:

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/product/images/sheetStyles.png" alt="Sheet Styles" />


## 1. Drawing from Model

This is the standard method for generating technical drawings. It automatically creates a sheet with three standard views (Front, Top, and Left) from either the entire assembly or any selected sub-part.

**Plane Override:**

Users can override which model plane is used as the "Front" plane for the drawing views. For example, if your model was designed on the Right Plane but you want the drawing's front view to show that side, you can select the Right Plane as the front. This ensures your drawings always present the model from the intended perspective.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/product/images/overrideFrontPlane.png" alt="Select model plane to use as Front plane" />

**View Layout Override:**

The automatically inserted standard views (Front, Top, Left) can also be customized by the user. As shown in the image below, you can choose which views to insert—such as replacing the Left view with the Right view, omitting side views, or adding section/break views. This gives you full control over the drawing layout to match your documentation needs.

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/product/images/viewOptions.png" alt="Select views to insert and override layout" />

**Key features:**

- Supports both assemblies and parts.
- Users can specify view breaks and section views.
- Break positions can be controlled by Excel formulas, ensuring that only the relevant parts of long models are displayed (e.g., showing just the start and end of a long part).

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/product/images/sectionView.png" alt="Section View Settings" />

<img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/product/images/breakSettings.png" alt="Break View Settings" />

## 2. Notes

This option creates a completely empty sheet, ideal for adding note annotations, instructions, or other non-geometry information.

**Use case:**

- Add manufacturing notes, assembly instructions, or general documentation.

## 3. Laser Cut

Designed for sheet metal parts:
- If the model contains a sheet metal feature with a flat pattern, Cadify will automatically unsuppress the flat pattern and generate a flat pattern drawing view.
- If the model is not a sheet metal part, Cadify creates a "fake" laser cut drawing using only the model's front view.

## 4. From Existing Sheet

This option allows you to create a new drawing sheet by duplicating an existing one.

**Use case:**

- Reuse layouts, annotations, or view setups from previous drawings to save time and maintain consistency.

---

By choosing the appropriate drawing type, you can streamline your documentation process and ensure your drawings meet your project's needs.