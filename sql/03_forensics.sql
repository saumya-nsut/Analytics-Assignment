-- 03_forensics.sql
-- Checks required by the assignment.

-- Duplicate payments
SELECT payment_id, COUNT(*) AS rows
FROM raw.payments
GROUP BY payment_id
HAVING COUNT(*) > 1;

-- Reused payment references
SELECT payment_reference, COUNT(*) AS rows, COUNT(DISTINCT account_id) AS accounts
FROM raw.payments
WHERE payment_reference IS NOT NULL
GROUP BY payment_reference
HAVING COUNT(*) > 1;

-- Event/account borrower mismatch
SELECT COUNT(*) AS mismatches
FROM raw.calls c
JOIN raw.accounts a USING (account_id)
WHERE c.borrower_id <> a.borrower_id;

-- Timestamp chronology
SELECT COUNT(*) AS invalid_chronology
FROM raw.account_status_history
WHERE recorded_at < event_at;

-- Denominator by month
SELECT DATE_TRUNC('month', target_date) AS month,
       COUNT(DISTINCT account_id) AS targeted_accounts
FROM raw.daily_targeting
GROUP BY 1
ORDER BY 1;
