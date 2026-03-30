-- 4. Monthly Revenue Trend
-- Task: Show monthly total revenue for the last 12 months.
-- Challenge: Include the revenue for the current and previous month.
WITH rev_table AS(
SELECT 
	MONTH(bill_date) AS month,
    SUM(amount) AS monthly_revenue
FROM billing
WHERE payment_status  LIKE '%Paid'
GROUP BY month
    ),
RevenueWithLag AS (
  SELECT
    month,
    monthly_revenue,
    LAG(monthly_revenue,1,0) OVER (ORDER BY month) AS previous_month_revenue
  FROM
    rev_table
)
SELECT
	month,
    ROUND(monthly_revenue,2) AS monthly_revenue,
    ROUND(previous_month_revenue,2) AS previous_monthly_revenue,
    CASE
    WHEN previous_month_revenue = 0 THEN 0 
    ELSE ROUND(
      (monthly_revenue - previous_month_revenue) * 100.0 / previous_month_revenue, 2)
  END AS percentage_change
    
FROM RevenueWithLag
ORDER BY month