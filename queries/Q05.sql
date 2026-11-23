-- Q05: Patients holding at least 2 active future bookings (Rule 6; excludes past expired waitlists)
SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    p.email,
    COUNT(b.booking_id) AS active_future_bookings,
    SUM(CASE WHEN b.status = 'Confirmed'  THEN 1 ELSE 0 END) AS confirmed_bookings,
    SUM(CASE WHEN b.status = 'Waitlisted' THEN 1 ELSE 0 END) AS waitlisted_bookings
FROM Patient AS p
JOIN Booking AS b
    ON p.patient_id = b.patient_id
JOIN HealthSession AS hs
    ON b.session_id = hs.session_id
WHERE b.status IN ('Confirmed', 'Waitlisted')
  AND TIMESTAMP(hs.session_date, hs.end_time) > '2026-11-01 09:00:00'
GROUP BY p.patient_id, p.first_name, p.last_name, p.email
HAVING COUNT(b.booking_id) >= 2
ORDER BY active_future_bookings DESC, p.patient_id ASC;