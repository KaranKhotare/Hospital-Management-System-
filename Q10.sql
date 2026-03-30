-- 10. Payment Success Rate
-- Task: Calculate the percentage of successful payments for all bills.
-- Challenge: Show breakdown by payment method.

SELECT
  payment_method,
  SUM(CASE WHEN LOWER(payment_status) IN ('paid') THEN 1 ELSE 0 END) AS successful_payments,
  COUNT(*) AS total_payments,
  ROUND(100.0 * SUM(CASE WHEN LOWER(payment_status) IN ('paid') THEN 1 ELSE 0 END) / NULLIF(COUNT(*),0), 2) AS success_rate_percent
FROM billing
GROUP BY payment_method
ORDER BY success_rate_percent DESC;
