# Collections Analytics — Data Analyst Assignment

This repository contains the requested deliverables from the assignment brief:

- `analysis_notebook.ipynb`
- `sql/`
- `data/golden_account_month.csv`
- `data_quality_report.md`
- `dashboard.html`
- `executive_memo.md`
- `architecture.svg`
- `architecture.md`

## Conclusion

After payment-ID deduplication, January→July recovery changes by about **0.01%** across complete months. February→March is about 11%, but this is not sustained. August is partial.

The data also contains material quality issues, including duplicate payments and conflicting borrower identity information. The investment recommendation is therefore to **test better borrower targeting through a controlled experiment rather than claim a numerical ROI from observational data**.

The original raw CSVs are not copied into this repository. Keep them outside Git and point the notebook's `RAW` path to their location when reproducing the analysis.
