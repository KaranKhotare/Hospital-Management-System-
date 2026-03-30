-- 17. Cross-Treatment Opportunities
-- Task: Find patients who had Treatment A but never Treatment B (e.g., had physiotherapy but never surgery).
-- Challenge: Suggest possible follow-up treatments.
SELECT 	
	CONCAT(p.first_name,' ',last_name) AS full_name,
    treatment_type,
    COUNT(*) as cnt
FROM patients p
JOIN appointments a USING(patient_id)
JOIN treatments t USING(appointment_id)
GROUP BY full_name,treatment_type
HAVING cnt=0

