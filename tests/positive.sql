-- Test ID: POS01 | Valid Patient insert (with optional NULL phone_number)
INSERT INTO Patient (first_name, last_name, date_of_birth, phone_number, email)
VALUES ('Mei', 'Chan', '1992-05-14', NULL, 'mei.chan.test@example.org');

-- Test ID: POS02 | Valid SessionType insert
INSERT INTO SessionType (type_name)
VALUES ('Pediatric Checkup');

-- Test ID: POS03 | Valid HealthSession insert (capacity >= 1, end_time > start_time)
INSERT INTO HealthSession (type_id, session_date, start_time, end_time, capacity)
SELECT type_id, '2026-11-28', '09:00:00', '10:00:00', 5
FROM SessionType
WHERE type_name = 'Pediatric Checkup';

-- Test ID: POS04 | Valid Booking insert using DEFAULT CURRENT_TIMESTAMP for requested_at
INSERT INTO Booking (patient_id, session_id, status)
SELECT p.patient_id, hs.session_id, 'Confirmed'
FROM Patient p
CROSS JOIN HealthSession hs
WHERE p.email = 'mei.chan.test@example.org'
  AND hs.session_date = '2026-11-28'
  AND hs.start_time = '09:00:00'
LIMIT 1;

-- Test ID: POS05 | Valid status transition to 'Cancelled'
UPDATE Booking
SET status = 'Cancelled'
WHERE booking_id = LAST_INSERT_ID();

-- Test ID: POS06 | Valid DELETE of an unreferenced SessionType (e.g., Diabetes Workshop, type_id = 6)
DELETE FROM SessionType
WHERE type_name = 'Diabetes Workshop'
  AND type_id NOT IN (SELECT DISTINCT type_id FROM HealthSession);
