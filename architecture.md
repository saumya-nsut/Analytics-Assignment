# Production Analytics Architecture

**Raw → Staging → Clean → Golden → Feature → Metrics → Dashboard**

- Raw: immutable source extracts.
- Staging: schema and timestamp validation.
- Clean: deduplication, key checks, chronology flags and standardised codes.
- Golden: account-month analytical layer with documented source-of-truth decisions.
- Feature: targeting, DPD/risk, contact, payment and complaint features.
- Metrics: version-controlled KPI definitions.
- Dashboard: one-screen leadership view.

Controls include data contracts, primary keys, lineage, incremental processing, late-arrival lookbacks, backfills, DQ checks, monitoring and anomaly detection.

Late-arriving records are handled by reprocessing affected date partitions from an immutable raw layer. Backfills use the same transformations as incremental processing.

For the targeting counterfactual, treatment/control assignment and campaign exposure IDs should be persisted so the experiment can be reproduced.
