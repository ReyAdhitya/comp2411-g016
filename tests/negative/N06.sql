-- Test ID: N06 | Rule: end_time > start_time | Prerequisite: type_id = 1 exists | Expected Error: 3819 (CHECK constraint violated)
INSERT INTO HealthSession (type_id, session_date, start_time, end_time, capacity)
VALUES (1, '2026-12-01', '14:00:00', '14:00:00', 10);
