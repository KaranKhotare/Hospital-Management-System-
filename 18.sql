-- 18. Top 5 Patients by Bills in Each Branch
-- Task: Identify top 5 patients by total billing amount for each hospital branch.
-- Challenge: Include total treatments and last treatment date.
SELECT 
	CONCAT(p.first_name,' ',p.last_name) AS full_name,
    ROUND(SUM(b.amount),2) AS total_bill,
    COUNT(treatment_id) AS total_treatments,
    MAX(t.treatment_date) AS last_treatment_date
FROM patients p
JOIN billing b USING(patient_id)
JOIN appointments a USING(patient_id)
JOIN doctors d USING(doctor_id)
JOIN treatments t USING(treatment_id)
GROUP BY full_name