# Weekly Usage and Monthly Invoicing

![Cadify billing aggregation process](./images/05-aggregation.png)

Cadify separates **usage measurement** from **invoice issuance** in order to provide accurate, continuous, and traceable billing data.

Usage is measured and recorded on a **weekly basis**, while invoices are issued on a **monthly basis**. This section explains how these two time scales are connected.

## Weekly usage as the billing base

Cadify collects usage data continuously and summarizes it into **weekly usage records**.

Each weekly record represents a complete and self-contained snapshot of usage for that period, including:

- Infrastructure capacity associated with the Store
- Measured process time by service category
- Average cloud storage usage for the week

Weekly records form the **base unit** for billing aggregation. They ensure that usage is captured consistently, regardless of calendar boundaries or activity patterns.

## Monthly invoice composition

A monthly invoice is constructed by **aggregating weekly usage records**.

Depending on how calendar weeks align with the month, a single invoice will typically include:

- Three full weekly records, or
- Four to five weekly records when partial weeks are involved

Weekly records that were not included in a previous invoice are carried forward and included in the next monthly invoice. This prevents both gaps and double counting.

The monthly invoice therefore represents a summarized view of all measured usage for the invoicing period.

## Partial weeks and continuity

Cadify treats partial weeks carefully to maintain continuity.

If a week spans two months, the portion of that week not included in the previous invoice is included in the next one. This ensures that every unit of measured usage is invoiced exactly once.

From the Store Owner’s perspective, this approach provides:

- Predictable monthly invoices
- Clear alignment with measured usage
- No hidden adjustments or retroactive corrections

## Transparency and traceability

Because monthly invoices are built from weekly usage records, there is a clear trace from:

- Individual executed services and stored data

    to
- Weekly usage summaries

    to
- Monthly invoice totals

This layered approach supports transparency and makes it possible to understand how invoiced amounts relate to actual platform usage, without exposing internal execution details.

## Why Cadify uses this model

Using weekly measurement with monthly invoicing provides several advantages:

- Accurate capture of fluctuating usage
- Stable and predictable invoice cadence
- Clear auditability over time

This model aligns with Cadify’s overall design philosophy: deterministic behavior, explicit measurement, and explainable outcomes.

## Summary

Cadify measures usage weekly and issues invoices monthly by aggregating weekly usage records. Each monthly invoice reflects all measured usage during the invoicing period, with careful handling of partial weeks to ensure continuity and correctness.

All invoices are based on **measured usage summarized per month**.