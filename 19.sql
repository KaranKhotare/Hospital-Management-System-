-- 19. Revenue by Insurance Provider
-- Task: Calculate total revenue covered by each insurance provider.
-- Challenge: Include total patients served and average claim amount.
SELECT insurance_provider,
	SUM(b.amount) AS insuarce_revenue,
    COUNT(patient_id) AS total_patient_served
FROM patients p
JOIN billing b USING(patient_id)
GROUP BY insurance_provider