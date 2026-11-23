-- Q07: Audit of past sessions with bookings eligible for completion or expired waitlists (Rule 9)
SELECT
    b.booking_id,
    hs.session_id,
    st.type_name,
    TIMESTAMP(hs.session_date, hs.end_time) AS session_end_at,
    p.patient_id,
    p.first_name,
    p.last_name,
    b.status,
    CASE
        WHEN b.status = 'Confirmed'  THEN 'Mark Completed (Rule 9)'
        WHEN b.status = 'Waitlisted' THEN 'Expired Waitlist (Excluded from Active Limit)'
    END AS audit_action
FROM Booking AS b
JOIN HealthSession AS hs
    ON b.session_id = hs.session_id
JOIN SessionType AS st
    ON hs.type_id = st.type_id
JOIN Patient AS p
    ON b.patient_id = p.patient_id
WHERE TIMESTAMP(hs.session_date, hs.end_time) <= '2026-11-01 09:00:00'
  AND b.status IN ('Confirmed', 'Waitlisted')
ORDER BY session_end_at ASC, b.booking_id ASC;