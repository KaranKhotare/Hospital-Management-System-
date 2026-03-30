-- 3. Average Billing Amount per Patient
-- Task: Compute the average bill amount for each patient.
-- Challenge: Include only patients with more than 5 treatments.

WITH PatientSummary AS (
  SELECT 
    p.patient_id,
    concat(p.first_name,' ',p.last_name) AS Full_Name,
    AVG(b.amount) AS average_by_patient,
    COUNT(b.treatment_id) AS treatment_count 
  FROM 
    patients p

  JOIN 
    billing b USING(patient_id)
  GROUP BY 
    p.patient_id
)

SELECT 
  Full_Name,
  ROUND(average_by_patient,2) AS average
FROM 
  PatientSummary
WHERE 
  treatment_count > 5; 
