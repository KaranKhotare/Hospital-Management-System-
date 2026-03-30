
-- 14. Pending Payments
-- Task: Find all bills that are unpaid but the treatment is completed.
-- Challenge: Include patient details, bill date, and treatment type.

SELECT
  b.bill_id,
  b.bill_date,
  b.amount,
  b.payment_method,
  b.payment_status,
  p.patient_id,
  CONCAT(p.first_name,' ',p.last_name) AS patient_name,
  p.contact_number,
  t.treatment_id,
  t.treatment_type,
  a.appointment_id,
  a.appointment_date,
  a.status AS appointment_status
FROM billing b
JOIN treatments t ON t.treatment_id = b.treatment_id
JOIN appointments a ON a.appointment_id = t.appointment_id
JOIN patients p ON p.patient_id = b.patient_id
WHERE b.payment_status NOT IN ('paid','pending') AND a.status='Completed'
ORDER BY b.bill_date DESC;
