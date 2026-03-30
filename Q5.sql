-- 5. Patients with No Appointments
-- Task: Identify patients who registered but never booked an appointment.
-- Challenge: Show patient details and number of days since registration.
SELECT 
	patient_id,
    first_name,
    last_name,
	DATEDIFF(NOW(),registration_date) AS days_from_registration
FROM patients p
LEFT JOIN appointments a USING(patient_id)
WHERE appointment_id IS NULL
