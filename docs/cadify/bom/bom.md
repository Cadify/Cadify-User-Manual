# Bill of Materials (BOM) in Cadify

The Bill of Materials (BOM) in Cadify is a structured, living dataset that connects design, configuration, and production. Every BOM is generated from the product’s digital twin, ensuring correctness, completeness, and up‑to‑date information.

Unlike static lists, the Cadify BOM adapts in real time when configuration rules or product parameters change. In addition to parts and quantities, it carries process information, dependencies, costs, and supporting documentation—making it the single source of truth for sales, engineering, and manufacturing.

## Core Columns

### Level
Defines the product structure in a multi‑level hierarchy. Uses a section numbering format (e.g., `1.1.2`) to make dependencies and relationships easy to follow.

### BOM Type
Specifies the component type: `TopAssembly`, `SubAssembly`, or `Part`. Clarifies where each element belongs within the product structure.

### Name
Human‑ and ERP‑readable component name for cross‑system identification.

### Description
Additional information that supports ERP or manufacturing, e.g., function, design notes, production attributes.

### Amount
Required quantity of the item in the assembly to enable precise purchasing and production planning.

### Unit
Measurement unit (e.g., `pcs`, `mm`, `kg`, `m`) to remove ambiguity in procurement and usage.

### Part number
Unique identifier for each component, critical for traceability and consistent referencing throughout the lifecycle.

### Part number alias
Links Cadify’s internal part numbers with external supplier/manufacturer part numbers to improve supply‑chain flexibility.

### Manufacturing
Production‑related comments or instructions for clarity on tasks, special requirements, or operator guidance.

### Activity Station
Required resource for production, either a process (e.g., welding) or a physical location (e.g., Assembly Line 2).

### MFB Level (Must Finish Before)
Defines production dependencies: lists which level(s) cannot start until this component/process is completed, ensuring correct sequencing.

### Material cost
Material cost of the component to support cost breakdowns and margin analysis.

### Labor cost
Labor effort/cost associated with the component or process. Combined with material cost, provides full product economics.

### Attachment
Links to drawings, technical sheets, or CAD data (via Cadify Proxies). Keeps customer‑facing and production documentation aligned.

### Version
Version number for traceability and change management throughout the lifecycle.

## ERP/MES‑Focused Columns

This subchapter introduces the Bill of Materials (BOM) as Cadify’s core connector between configuration and enterprise systems. Every customer choice generates a structured BOM that feeds ERP and MES with complete and traceable data. The following sections describe the BOM structure, column definitions, and how cost, process, and documentation fields secure a seamless digital flow from configurator to production

When transferring the Cadify BOM via API to ERP/MES, some columns carry special importance for planning, scheduling, and execution:

- **Manufacturing** — actionable production instructions (e.g., required treatments, process steps, or quality notes).
- **Activity Station** — the machine/workstation/department for precise work‑order allocation.
- **MFB Level** — dependencies for sequencing to avoid deadlocks and ensure correct order of operations.
- **Material cost** — used in cost calculation, margin analysis, and purchasing.
- **Labor cost** — used in job costing and efficiency analysis alongside material cost.
- **Attachment** — machine‑ready files (drawings, datasheets, process instructions) available to work orders via API.
- **Version** — essential to ensure production uses current data.

## CNC, Laser Cutting, and 3D Printing

Cadify can generate production‑ready documentation and files (e.g., DXF, STEP, STL) directly from the configurator, together with the BOM. Because everything is updated in real time, machines can begin work immediately without manual conversion or error‑prone handoffs.

**Attachment field (clarification):** For digital manufacturing, this is where machine‑ready files (DXF, STEP, STL) are linked and transferred to ERP/MES.