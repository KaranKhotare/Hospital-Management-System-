-- 15. Inactive Doctors
-- Task: Identify doctors who haven’t had any appointments in the last 6 months.
-- Challenge: Show their last appointment date and total treatments done.
SELECT
  d.doctor_id,
  CONCAT(d.first_name,' ',d.last_name) AS doctor_name,
  d.hospital_branch,
  MAX(a.appointment_date) AS last_appointment_date,
  COUNT(t.treatment_id) AS total_treatments_done
FROM doctors d
LEFT JOIN appointments a ON a.doctor_id = d.doctor_id
LEFT JOIN treatments t ON t.appointment_id = a.appointment_id
GROUP BY d.doctor_id
HAVING (MAX(a.appointment_date) IS NULL OR MAX(a.appointment_date) < DATE_SUB(CURDATE(), INTERVAL 6 MONTH))
ORDER BY last_appointment_date ASC;