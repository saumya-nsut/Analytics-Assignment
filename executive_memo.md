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

### Strategic Recommendation: Data-Targeting Experiment
The current historical dataset lacks a reliable control group, cost logs, or unique campaign exposure IDs. Proposing a definitive ROI or a fixed break-even horizon on this data alone would create false precision. 

The most defensible strategy is to commit a subset of the ₹10 Cr to run a staged, randomized control trial (RCT) to evaluate the modified borrower targeting system.

### Staged Trial Architecture (RCT)
*   **Treatment Group:** Eligible delinquent accounts routed via the modified rule targeting engine.
*   **Control Group:** A matched subset of accounts held on legacy baseline routing parameters.
*   **Stratification:** Accounts will be strictly stratified across identical risk bands and DPD (Days Past Due) cohorts to prevent mix shifts from skewing the results.
*   **Evaluation Metric:** Core recovery rate, measured as:
    $$\Delta \text{ Recovery Rate} = \frac{\text{Success Recoveries}}{\text{Total Portfolio Outstanding}}$$
*   **Downside Controls:** Implement a weekly lookback window to immediately halt the trial if targeting errors degrade contact rates or increase customer complaints.
