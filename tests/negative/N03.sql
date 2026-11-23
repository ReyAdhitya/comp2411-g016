-- Test ID: N03 | Rule: Unique patient email | Prerequisite: patient_id = 1 exists | Expected Error: 1062 (Duplicate entry)
INSERT INTO Patient (first_name, last_name, date_of_birth, phone_number, email)
SELECT 'Duplicate', 'User', '1988-03-20', '91234569', email
FROM Patient
WHERE patient_id = 1;
