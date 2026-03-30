-- 12. Treatment Profit Margin
-- Task: Calculate the profit margin for each treatment type assuming a given cost-to-hospital value.
-- Challenge: Rank treatments from highest to lowest margin.
SET @HOSPITAL_COST_PCT = 0.6;

SELECT
  t.treatment_type,
  COUNT(*) AS occurrences,
  ROUND(SUM(b.amount),2) AS total_revenue,
  ROUND(SUM(b.amount) * @HOSPITAL_COST_PCT, 2) AS estimated_total_cost_to_hospital,
 ROUND((SUM(b.amount)*(1- @HOSPITAL_COST_PCT)),2) AS profit_margin
FROM treatments t
LEFT JOIN billing b ON b.treatment_id = t.treatment_id
GROUP BY t.treatment_type
ORDER BY profit_margin DESC;