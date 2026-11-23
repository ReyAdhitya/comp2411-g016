-- Test ID: N05 | Rule: capacity >= 1 | Prerequisite: type_id = 1 exists | Expected Error: 3819 (CHECK constraint violated)
INSERT INTO HealthSession (type_id, session_date, start_time, end_time, capacity)
VALUES (1, '2026-12-01', '10:00:00', '11:00:00', 0);
