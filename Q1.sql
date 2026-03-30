-- 1. Most Frequent Treatments
-- Task: Find the top 4 treatments performed based on total count.
-- Challenge: Include treatment type, total number of times performed, and total revenue from each.
SELECT 
    treatment_type,
    COUNT(*) AS treatment_count,
    ROUND(SUM(cost), 2) AS revenue
FROM
    treatments
GROUP BY treatment_type
ORDER BY treatment_count DESC
LIMIT 5
