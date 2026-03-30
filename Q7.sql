-- 7. Patient Lifetime Value
-- Task: Calculate the total amount spent by each patient over their lifetime.
-- Challenge: Rank patients by total spend.
SELECT 
	patient_id,
    first_name,
    last_name,
    ROUND(SUM(amount) ,2)AS lifetime_value
FROM billing
JOIN patients USING(patient_id)
GROUP BY patient_id
ORDER BY lifetime_value DESC