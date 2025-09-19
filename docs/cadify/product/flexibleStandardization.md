## Introduction

<div class="grid" style="display:flex; align-items:flex-start; gap:12px; flex-wrap:nowrap;">
  <div class="col-4" style="flex:0 0 62%; max-width:62%; box-sizing:border-box; padding-right:12px;">
    Cadify demonstrates how flexible standardization should be applied across multiple levels. Firstly, drawings and sheet templates follow recognized industrial standards, ensuring compatibility and compliance. Additionally, rules and parameters manage controlled variation, so product families can adapt to production capacities, available materials, and customer-specific needs.    
  </div>
  <div class="col-8" style="flex:0 0 38%; max-width:38%; box-sizing:border-box; text-align:center;">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/product/images/FlexibleStandardizationPyramide.png" alt="FlexibleStandardizationPyramide">
  </div>
</div>

<div class="grid" style="display:flex; align-items:flex-start; gap:12px; flex-wrap:nowrap;">
  <div class="col-4" style="flex:0 0 50%; max-width:50%; box-sizing:border-box; padding-right:12px;">
    <img src="https://raw.githubusercontent.com/Cadify/Cadify-User-Manual/main/docs/cadify/product/images/DNV_ST_0194_BucklingReportExample.png" alt="DNV_ST_0194_BucklingReportExample">   
  </div>
  <div class="col-8" style="flex:0 0 50%; max-width:50%; box-sizing:border-box;">
    <p>A practical example is the DNV ST 0194 buckling calculation for hydraulic cylinders. This calculation combines multiple levels of standardization: geometric definitions such as cylinder length and diameters, material parameters for tubes and rods, and safety factors including friction allowances. In Cadify, these parameters are defined once and then reused across all variants.</p>
    <p>By embedding such certified engineering methods, Cadify ensures every configured cylinder remains within safe and approved limits. This not only secures compliance with international standards, it also guarantees that all automatically generated drawings, BOMs, and production data are correct.</p>
  </div>
</div>

## Excel Worksheet Example – Buckling Calculation (DNV ST 0194)

| **Parameter** | **Formula (Excel)** | **Value** | **Unit** |
|---------------|--------------------|-----------|----------|
| **L1** (cylinder body length) | `=61+12+73+0+180+50` | 376 | mm |
| **L2** (rod visible length) | `=180+13+61` | 254 | mm |
| **L** (total length) | `=L1+L2` | 630 | mm |
| **Do** (outer tube Ø) | *input* | 70 | mm |
| **Di** (inner tube Ø) | *input* | 60 | mm |
| **do** (rod Ø) | *input* | 30 | mm |
| **I1** (second moment tube) | `=(PI()*(Do^4-Di^4))/64` | 542,416 | mm⁴ |
| **I2** (second moment rod) | `=(PI()*(do^4-0^4))/64` | 39,761 | mm⁴ |
| **Z parameter** | *given* | 0.005746 | – |
| **FE** (buckling load) | `=206000*PI()^2/(L*Z)` | 561,644 | N |
| **Safety factor** | `=FE/4` | 140,411 | N |
| **pa** (buckling pressure) | `=Fa/((PI()/4)*Di^2)` | 49.66 | N/mm² |
| **pa (converted)** | `=N/mm²*100/9.81` | 506.2 | bar |
| **Friction adjustment** | `=506.2/1.02` | 496 | bar |
| **Final design pressure** | `=MIN(496,250)` | 250 | bar |

This table clearly shows how Cadify can embed industry formulas directly into a worksheet, linking geometric and material parameters with standardized calculations. Engineers set up the model once, and every customer configuration will calculate safely within these certified boundaries. The result is a consistent baseline for engineering integrity, combined with the flexibility to meet customer needs and production efficiency.

<a href="/Cadify-User-Manual/cadify/mediaManager/MediaManager/#1-print-from-excel-proxyreport"
   style="display:inline-block;padding:8px 14px;border:1px solid #222;border-radius:8px;
          text-decoration:none;font-weight:600;line-height:1.2;">
  Setting up Excel Report in Media Manager
</a>