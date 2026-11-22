-- Q06: Upcoming FIFO waitlist promotion queue ordered by requested_at and booking_id (Rules 4 & 8)
SELECT
    hs.session_id,
    st.type_name,
    hs.session_date,
    hs.start_time,
    (
        SELECT COUNT(*)
        FROM Booking AS b2
        WHERE b2.session_id = b.session_id
          AND b2.status = 'Waitlisted'
          AND (
              b2.requested_at < b.requested_at
              OR (b2.requested_at = b.requested_at AND b2.booking_id <= b.booking_id)
          )
    ) AS queue_position,
    b.booking_id,
    b.requested_at,
    p.patient_id,
    p.first_name,
    p.last_name
FROM Booking AS b
JOIN Patient AS p
    ON b.patient_id = p.patient_id
JOIN HealthSession AS hs
    ON b.session_id = hs.session_id
JOIN SessionType AS st
    ON hs.type_id = st.type_id
WHERE b.status = 'Waitlisted'
  AND TIMESTAMP(hs.session_date, hs.end_time) > '2026-11-01 09:00:00'
ORDER BY hs.session_id ASC, b.requested_at ASC, b.booking_id ASC;