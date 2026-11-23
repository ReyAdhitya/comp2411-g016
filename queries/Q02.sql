-- Q02: Waitlisted Cardiometabolic Screening patients who previously completed Influenza Vaccination (MQ2)
SELECT
    p.patient_id,
    p.first_name,
    p.last_name,
    p.email,
    hs.session_id,
    hs.session_date,
    b.booking_id,
    b.requested_at
FROM Patient AS p
JOIN Booking AS b
    ON p.patient_id = b.patient_id
JOIN HealthSession AS hs
    ON b.session_id = hs.session_id
JOIN SessionType AS st
    ON hs.type_id = st.type_id
WHERE b.status = 'Waitlisted'
  AND st.type_name = 'Cardiometabolic Screening'
  AND TIMESTAMP(hs.session_date, hs.end_time) > '2026-11-01 09:00:00'
  AND EXISTS (
      SELECT 1
      FROM Booking AS b2
      JOIN HealthSession AS hs2
          ON b2.session_id = hs2.session_id
      JOIN SessionType AS st2
          ON hs2.type_id = st2.type_id
      WHERE b2.patient_id = p.patient_id
        AND b2.status = 'Completed'
        AND st2.type_name = 'Influenza Vaccination'
  )
ORDER BY b.requested_at ASC, b.booking_id ASC;