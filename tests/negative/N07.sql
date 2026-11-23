-- Test ID: N07 | Rule: Booking status domain | Prerequisite: patient_id = 1 and session_id = 1 exist | Expected Error: 1265 (Data truncated)
INSERT INTO Booking (patient_id, session_id, status)
VALUES (1, 1, 'Pending');
