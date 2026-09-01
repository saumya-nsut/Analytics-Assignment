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

**Recommended direction: Better borrower targeting — but only as a controlled, staged experiment.**

The current dataset is insufficient to produce a defensible numerical causal lift, ROI or break-even estimate. The correct response is to state that limitation rather than create false precision.

### Experiment

- Treatment: randomly assigned eligible accounts under the new targeting strategy.
- Control: current targeting strategy.
- Stratify by material risk/DPD/portfolio groups.
- Pre-register a fixed recovery window.
- Primary outcome: incremental deduplicated recovery.
- Secondary outcomes: recovery per targeted account, recovery relative to targeted outstanding and complaint rate.
- Require reliable treatment/exposure IDs and verified cost inputs.

**Expected incremental recovery:** measured from experimental lift × eligible population.

**Estimated cost:** staged spend, up to ₹10 Cr.

**Expected ROI:** incremental recovery ÷ incremental spend.

**Break-even:** spend ÷ incremental recovery rate.

**Downside:** zero lift, targeting errors or adverse borrower outcomes.

**Confidence:** high that the 11% headline is not a sustained trend; low for numerical causal ROI until the experiment is run.
