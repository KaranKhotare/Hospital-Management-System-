-- 6. Most Common Reason for Visit by Branch
-- Task: Find the most frequent reason_for_visit for each hospital branch.
-- Challenge: Include the number of visits for that reason.
SELECT
	reason_for_visit,
    COUNT(*) AS frequency
FROM appointments
GROUP BY reason_for_visit
ORDER BY frequency DESC