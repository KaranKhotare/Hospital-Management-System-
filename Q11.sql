-- 11. Top Performing Doctors
-- Task: Find top 5 doctors by total revenue generated from treatments.
-- Challenge: Include number of treatments, total patients served, and success rate of payments.
-- Top 5 doctors by revenue (using billing.amount; fallback to treatment.cost)
SELECT
  d.doctor_id,
  CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
  d.hospital_branch,
  COUNT(DISTINCT t.treatment_id) AS num_treatments_performed,
  COUNT(DISTINCT a.patient_id) AS distinct_patients_served,
  ROUND(SUM(COALESCE(b.amount, t.cost)),2) AS total_revenue,
  SUM(CASE WHEN LOWER(b.payment_status) IN ('paid') THEN 1 ELSE 0 END) AS paid_bills,
  COUNT(b.bill_id) AS total_bills,
  ROUND(100.0 * SUM(CASE WHEN LOWER(b.payment_status) IN ('paid') THEN 1 ELSE 0 END) / NULLIF(COUNT(b.bill_id),0), 2) AS payment_success_rate_pct
FROM doctors d
LEFT JOIN appointments a ON a.doctor_id = d.doctor_id
LEFT JOIN treatments t ON t.appointment_id = a.appointment_id
LEFT JOIN billing b ON b.treatment_id = t.treatment_id
GROUP BY d.doctor_id
ORDER BY total_revenue DESC
LIMIT 5;
