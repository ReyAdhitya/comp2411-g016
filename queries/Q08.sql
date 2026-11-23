-- Q08: Receptionist contact list for upcoming active bookings handling missing phone numbers
SELECT
    b.booking_id,
    b.status,
    st.type_name,
    hs.session_date,
    hs.start_time,
    p.patient_id,
    p.first_name,
    p.last_name,
    p.phone_number,
    COALESCE(p.phone_number, 'Email Only') AS primary_contact,
    CASE
        WHEN p.phone_number IS NULL THEN 'Email'
        ELSE 'Phone or Email'
    END AS contact_channel,
    p.email
FROM Booking AS b
JOIN Patient AS p
    ON b.patient_id = p.patient_id
JOIN HealthSession AS hs
    ON b.session_id = hs.session_id
JOIN SessionType AS st
    ON hs.type_id = st.type_id
WHERE b.status IN ('Confirmed', 'Waitlisted')
  AND TIMESTAMP(hs.session_date, hs.end_time) > '2026-11-01 09:00:00'
ORDER BY hs.session_date ASC, hs.start_time ASC, b.booking_id ASC;