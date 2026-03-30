
-- 16. Categorize Patients
-- Task: Categorize patients as “frequent” if they have more than 5 treatments, otherwise “occasional.”
-- Challenge: List patient ID, name, total treatments, and category.
SELECT
  p.patient_id,
  CONCAT(p.first_name,' ',p.last_name) AS patient_name,
  COUNT(t.treatment_id) AS total_treatments,
  CASE
	WHEN COUNT(t.treatment_id) > 5 THEN 'frequent'
	WHEN COUNT(t.treatment_id) <= 5 AND COUNT(t.treatment_id) > 0  THEN 'occasional'
    ELSE 'non visitor' 
  END AS category
FROM patients p
LEFT JOIN appointments a ON a.patient_id = p.patient_id
LEFT JOIN treatments t ON t.appointment_id = a.appointment_id
GROUP BY p.patient_id
ORDER BY total_treatments DESC;
