-- Test ID: N02 | Rule: Non-empty last_name | Expected MySQL Error: 3819 (CHECK constraint violated)
INSERT INTO Patient (first_name, last_name, date_of_birth, phone_number, email)
VALUES ('Alex', '  ', '1990-01-10', '91234568', 'n02.blank.last@example.org');
