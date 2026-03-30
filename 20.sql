-- 20. Treatments with Decreasing Revenue
-- Task: Find top 10 treatments with the largest decrease in revenue from last year to this year.
-- Challenge: Show treatment ID, type, last year revenue, current year revenue, and decrease percentage
WITH monthly_revenue AS (
  SELECT
DATE_FORMAT(b.bill_date, '%Y-%m-01') AS revenue_month,
    t.treatment_type,
    SUM(b.amount) AS month_revenue
  FROM
    billing b
    JOIN treatments t USING (treatment_id)
  GROUP BY
    revenue_month,
    t.treatment_type
)

SELECT
  revenue_month,
  treatment_type,
  month_revenue,
  LAG(month_revenue, 1, 0) OVER (PARTITION BY treatment_type ORDER BY revenue_month) AS last_month_revenue
FROM
  monthly_revenue
ORDER BY
  treatment_type,
  revenue_month;