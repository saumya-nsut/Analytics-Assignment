-- 01_staging_and_golden.sql
-- Adapt DATE_TRUNC / table syntax to the production warehouse.

CREATE OR REPLACE TABLE staging_payments AS
SELECT *, ROW_NUMBER() OVER (PARTITION BY payment_id ORDER BY event_at) AS rn
FROM raw.payments;

CREATE OR REPLACE TABLE clean_payments AS
SELECT *
FROM staging_payments
WHERE rn = 1
  AND payment_status = 'SUCCESS';

CREATE OR REPLACE TABLE golden_account_month AS
SELECT
    t.account_id,
    DATE_TRUNC('month', t.target_date) AS month,
    COUNT(DISTINCT t.target_date) AS target_days,
    AVG(t.priority) AS targeting_priority,
    COUNT(DISTINCT t.campaign_id) AS campaign_count,
    a.outstanding_amount,
    a.dpd,
    a.risk_segment,
    a.loan_type
FROM raw.daily_targeting t
JOIN raw.accounts a USING (account_id)
GROUP BY 1,2,6,7,8,9;
