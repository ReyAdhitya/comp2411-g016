-- 03_views.sql (Rey)
-- v_session_summary: one row per session with its number of waitlisted bookings.
-- Used by queries/Q03.sql.

CREATE VIEW v_session_summary AS
SELECT s.session_id, s.type_id,
       SUM(CASE WHEN b.status = 'Waitlisted' THEN 1 ELSE 0 END) AS waitlisted_count
FROM HealthSession s
LEFT JOIN Booking b ON b.session_id = s.session_id
GROUP BY s.session_id, s.type_id;
