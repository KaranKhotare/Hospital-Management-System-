-- 13. Most Frequently Repeated Patients
-- Task: Find the top 10 patients with the most number of appointments.
-- Challenge: Include return visit percentage.
SELECT
  p.patient_id,
  CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
  COUNT(a.appointment_id) AS total_appointments
FROM patients p
LEFT JOIN appointments a ON a.patient_id = p.patient_id
GROUP BY p.patient_id
ORDER BY total_appointments DESC
LIMIT 10;
