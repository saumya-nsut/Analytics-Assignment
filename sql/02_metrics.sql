-- 02_metrics.sql
-- Independent recovery definitions.

WITH payment_month AS (
    SELECT DATE_TRUNC('month', event_at) AS month,
           SUM(amount) AS recovery,
           COUNT(DISTINCT account_id) AS paying_accounts
    FROM clean_payments
    GROUP BY 1
),
target_month AS (
    SELECT DATE_TRUNC('month', month) AS month,
           COUNT(DISTINCT account_id) AS targeted_accounts,
           SUM(outstanding_amount) AS targeted_outstanding
    FROM golden_account_month
    GROUP BY 1
)
SELECT t.month,
       t.targeted_accounts,
       p.recovery,
       p.paying_accounts,
       p.recovery / NULLIF(t.targeted_accounts, 0) AS recovery_per_targeted_account,
       p.recovery / NULLIF(t.targeted_outstanding, 0) AS recovery_rate_on_targeted_outstanding
FROM target_month t
LEFT JOIN payment_month p USING (month)
ORDER BY 1;
