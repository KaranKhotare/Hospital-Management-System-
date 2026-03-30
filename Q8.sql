-- 8. Treatment Cost Alerts
-- Task: Find treatments costing above a certain threshold (e.g., ₹50,000).
-- Challenge: Include the doctor name and patient details for those treatments.
SELECT 
	CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
	t.cost
FROM treatments t
JOIN appointments a USING(appointment_id)
JOIN patients p USING(patient_id)
JOIN doctors d USING(doctor_id)
WHERE t.cost>4800
ORDER BY t.cost DESC