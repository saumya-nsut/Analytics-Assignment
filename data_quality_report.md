# Data Quality Report

## Major findings

| Issue | Detection | Treatment | Business impact |
|---|---|---|---|
| Duplicate payment IDs | 500 IDs repeat; 500 extra rows | Keep one record per payment_id | Removes ₹2.59 Cr of apparent successful recovery |
| Reused payment references | 4297 repeated non-null reference occurrences | Do not use payment_reference as a key | Reference-based deduplication can merge unrelated payments |
| Exact duplicate call rows | 1350 | Deduplicate exact duplicates; use call_id | Prevents inflated call metrics |
| Borrower identity mismatch | 100.0% of comparable event rows disagree with accounts | Use account_id as operational anchor; quarantine borrower IDs | Borrower-level analysis is unsafe |
| Borrower dimension conflicts | 8185 IDs have >1 name; 8399 have >1 phone | Do not treat borrower table as a clean entity master | Identity attributes can be wrong |
| Agent master conflicts | 1000 agent IDs have conflicting attributes | Quarantine conflicting master attributes | Agent/tenure comparisons need resolution |
| Timestamp chronology | 30,191 status rows have recorded_at < event_at | Flag unresolved chronology | Time-based analysis may be distorted |
| Partial August | August is incomplete | Exclude from trend conclusion | Avoids partial-month bias |
| Missing language | No language field supplied | Report unavailable | Do not invent a driver |
| Missing cost data | No reliable cost table/rates | Do not claim numerical ROI | Investment economics require an experiment and cost inputs |

## Golden-data flow

**Raw Records → Rejected/Corrected → Golden Dataset**

1. Parse timestamps and preserve source IDs.
2. Deduplicate stable event keys.
3. Use `account_id` as the operational anchor.
4. Deduplicate successful payments by `payment_id`.
5. Quarantine conflicting borrower identity attributes.
6. Aggregate to account-month.
7. Keep August separate as a partial month.
8. Quantify each material correction.

## Payment impact

Raw successful payment value: **₹134.15 Cr**

After payment-ID deduplication: **₹131.56 Cr**

Difference: **₹2.59 Cr (1.93%)**

## Attribution and causality

A universal “latest campaign caused the payment” rule is not supported by the supplied event structure. Descriptive channel/campaign/segment differences should therefore be labelled **correlation**, not causal lift.

The counterfactual should use controlled assignment, a fixed outcome window and explicit treatment/control records.
