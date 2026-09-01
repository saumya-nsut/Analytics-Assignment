# Executive Memo — Collections Performance

## What happened?

The reported **11% month-on-month recovery improvement is not supported as a sustained trend**.

After payment-ID deduplication, successful recovery changes from ₹18.72 Cr in January to ₹18.72 Cr in July, a **0.01% change across complete months**. February→March is about 11%, but the following month declines, so that single movement is not evidence of a persistent improvement.

August is partial and is excluded.

## Why?

**Fact:** Recovery fluctuates rather than improving monotonically.

**Strong evidence:** Payment duplication materially affects the headline. Deduplication removes about ₹2.59 Cr (1.93%) of raw successful-payment value.

**Strong evidence:** Event borrower IDs disagree with the account master in about 100.0% of comparable rows, making borrower-level attribution unsafe.

**Correlation only:** Segment/channel/campaign differences are descriptive and are not treated as causal.

**Data limitation:** Language and reliable cost data are absent from the supplied sources.

## Is 11% real?

**No, not as a sustained business improvement.**

The independent KPI is deduplicated successful recovery, supplemented by recovery per targeted account and recovery relative to targeted outstanding.

## Where should ₹10 Cr go?

### Strategic Recommendation: Capital Deployment into Better Borrower Targeting
We recommend allocating the ₹10 Cr capital investment exclusively to upgrade our core targeting engine. The data forensics audit proved that aggregate monthly cash recoveries are heavily distorted by duplicate ledger logs (₹2.59 Cr) and population mix biases (Simpson's Paradox). Escalating collection costs by simply hiring more human agents or buying raw telephony infrastructure will only scale these systemic errors. 

Upgrading the targeting system addresses the structural root cause: it improves predictive risk stratification so we stop wasting resources on unrecoverable cohorts.

### Execution Parameters
*   **Operational Integration:** Use the capital to replace legacy heuristic filters with the modified rule targeting models, embedding our payment de-duplication and time-zone harmonization rules directly into the live ingestion layer.
*   **Target Population Boundary:** Enforce a strict static population filter by risk band (DPD buckets) before routing cases to communication channels. This prevents the business from dropping non-responsive files to inflate recovery rates.
*   **Continuous Risk Controls:** Implement a automated 7-day lookback window across the telephony, WhatsApp, and payment schemas to actively verify that the targeting engine is selecting higher-yield, unique borrower accounts without spiking customer complaint frequencies.