-- 9. Appointment Delays
-- Task: Identify appointments scheduled more than 14 days after the registration date.
-- Challenge: Include patient and doctor details.
WITH TEMP_TABLE AS(
	SELECT 
	CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
	CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    DATEDIFF(a.appointment_date,p.registration_date) AS diff
FROM appointments a
JOIN patients p USING(patient_id)
JOIN doctors d USING(doctor_id)
) 
SELECT 
	doctor_name,
    patient_name,
    (CASE 
		WHEN diff<0 THEN 'Early appointed'
        WHEN diff > 0 AND diff < 100 THEN 'Appointment on time'
        ELSE 'Too Late'
	END) AS appointtime
FROM TEMP_TABLE
ORDER BY appointtime

    
    
