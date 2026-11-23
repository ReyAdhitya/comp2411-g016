-- Test ID: N01 | Rule: Non-empty first_name | Expected MySQL Error: 3819 (CHECK constraint violated)
INSERT INTO Patient (first_name, last_name, date_of_birth, phone_number, email)
VALUES ('   ', 'Wong', '1990-01-10', '91234567', 'n01.blank.first@example.org');
