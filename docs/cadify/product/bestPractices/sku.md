# SKU and Revisions

## Introduction

Every product in Cadify deserves a clear, traceable identity from its first version to its latest iteration.  
This best practice describes how revisions are named, how changes are tracked, and how SKU and version data are embedded throughout the Cadify workflow.  

Following these guidelines ensures consistency, traceability, and smooth integration with engineering and production systems.

---

## 1. Purpose and Scope

This section defines how Cadify handles SKUs and revisions. It ensures clarity across engineering, production, integration, and downstream usage.  
It covers:

- Naming conventions  
- Life cycle rules  
- Responsibilities  
- Embedding revision data in BOMs and documentation  

**Applicable to:** All products managed through Cadify, whether internal, customer-facing, or handled via external manufacturing (drop ship).  

---

## 2. Revision Naming Scheme

**Format:**  

`<ProductName> Rev <Letter><Number>`

- **ProductName**: Descriptive identifier (for example, SAKON, SPROCKET)  
- **Rev**: Fixed literal "Rev."  
- **Letter**: Begins at A. Increments (B, C, D...) for major revisions (non-backward compatible changes).  
- **Number**: Begins at 1. Increments for minor revisions (backward compatible changes).  

**Examples:**  

- `SAKON Rev A1` (initial version)  
- `SAKON Rev A2` (minor backward compatible update)  
- `SAKON Rev B1` (major change, not backward compatible)  

**Rules:**  

- For non-backward compatible changes (for example, interface changes or altered mounting dimensions), increment **Letter** and reset **Number** to 1.  
- For backward compatible updates (for example, tolerance improvements or documentation edits), increment **Number** only.  

---

## 3. RAW Version as Master and Publishing Rule

The **RAW version** is always the master product baseline in Cadify.  
When a revision is published, the RAW version’s revision letter must be incremented so that RAW remains ahead as the authoritative source.  

- RAW before publish: `SAKON Rev A3` (working, private)  
- After publish: RAW becomes `SAKON Rev A4` (reset master)  
- Published variants or assemblies use the previous revisions.  

This guarantees RAW is always the authoritative baseline for future revisions.  

---

## 4. Lifecycle and Continuity

- The SKU spans the entire lifecycle: design, validation, production, retirement.  
- Revisions remain tied to this SKU. You do not create a new SKU for minor changes.  
- Some versions may be archived or deactivated, but revision history must always remain intact for traceability.  

---

## 5. Responsibility and Permissions

- Any SolidWorks engineer with valid Cadify plugin credentials may create or update a revision.  
- Role-based access in Cadify enforces who can publish or lock revisions.  
- Revision actions must include metadata: timestamp, user, justification, and change notes.  

---

## 6. Storage and Versioned Records

- Products may or may not store every SKU version actively in Cadify, depending on configuration and storage policies.  
- Even if older versions are deactivated, their revision history and metadata must remain accessible.  

---

## 7. Embedding SKU and Revision in Outputs

- SKU and revision must appear on the BOM so that every component, assembly, and subassembly is traceable.  
- It is recommended (but not mandatory) to include revision metadata in all exported files such as drawings, reports, and model files.  
- Metadata can appear in title blocks, headers, footers, or file names.  

---

## 8. Backward Compatibility and Supersession

- Non-backward compatible changes trigger a letter increment.  
- When a major revision is released (for example, Rev B1 replacing Rev A4), older versions may be superseded or flagged obsolete.  
- Users must be able to see which version is current, superseded, or obsolete, and how revisions are linked.  

---

## 9. Edit Control and Concurrency

- While editing a SKU revision, the item should be locked to prevent conflicting changes.  
- Cadify must warn or prevent concurrent edits to the same SKU/revision by different users.  
- Merging or branching beyond this revision scheme is not covered in this practice.  

---

## 10. Traceability and History

- Each revision change must be recorded in an audit trail with details on who made the change, when it was made, and why.  
- The system should support version comparisons (deltas) and allow rollback to earlier stable revisions when needed.  

---

## 11. Obsolescence and Retirement

- There is no enforced obsolescence. However, older revisions may be flagged obsolete once superseded.  
- Obsolete revisions remain readable for reference but must not be reissued as active versions.  

---

## Appendix: Recommendations and Use Cases

- Use **Letter** revisions only for changes that break compatibility.  
- Use **Number** revisions for smaller improvements, documentation updates, or tuning.  
- Always include full revision metadata when working with external partners or drop ship arrangements.  
- When integrating with ERP or MES, map the SKU and revision to their part or version identifiers to keep systems synchronized.