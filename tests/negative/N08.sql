-- Test ID: N08 | Rule: Valid patient reference | Prerequisite: session_id = 1 exists; patient_id 999999 absent | Expected Error: 1452 (Cannot add or update a child row)
INSERT INTO Booking (patient_id, session_id, status)
VALUES (999999, 1, 'Confirmed');
