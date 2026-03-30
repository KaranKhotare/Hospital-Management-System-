-- Final Task: Stored Procedure
-- Task: Create a procedure so that when a new billing record is inserted, it checks if payment is successful.
--  If successful, mark the treatment as "completed" in the treatments table.
DELIMITER $$
CREATE PROCEDURE new_billing_record (
    IN p_bill_id VARCHAR(10),
    IN p_patient_id VARCHAR(10),
    IN p_treatment_id VARCHAR(10),
    IN p_bill_date DATE,
    IN p_amount DOUBLE,
    IN p_payment_method VARCHAR(100),
    IN p_payment_status VARCHAR(10)
)
BEGIN 
INSERT INTO billing (
        bill_id, patient_id, treatment_id, bill_date, amount, payment_method, payment_status
    )
    VALUES (
        p_bill_id, p_patient_id, p_treatment_id, p_bill_date, p_amount, p_payment_method, p_payment_status
    );

    -- If payment is successful, update treatment status
    IF LOWER(p_payment_status) IN ('paid') THEN
        UPDATE treatments
        SET description = 'completed'
        WHERE treatment_id = p_treatment_id;
    END IF;
END$$

DELIMITER ;

-- CALL BY FOLLOWING CODE
CALL NEW_billing_record(
    'B101',        -- bill_id
    'P005',        -- patient_id
    'T002',        -- treatment_id
    CURDATE(),     -- bill_date
    1500.00,       -- amount
    'Credit Card', -- payment_method
    'Paid'         -- payment_status
)