-- Q04: Screening session volume and patient cancellation rate by session type (MQ4)
SELECT
    st.type_id,
    st.type_name,
    COUNT(s.session_id) AS scheduled_sessions,
    COALESCE(SUM(s.total_bookings), 0) AS total_bookings,
    COALESCE(SUM(s.cancelled_count), 0) AS cancelled_bookings,
    COALESCE(
        ROUND(SUM(s.cancelled_count) * 100.0 / NULLIF(SUM(s.total_bookings), 0), 2),
        0.00
    ) AS cancellation_rate_pct
FROM SessionType AS st
LEFT JOIN (
    SELECT
        hs.session_id,
        hs.type_id,
        COUNT(b.booking_id) AS total_bookings,
        SUM(CASE WHEN b.status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_count
    FROM HealthSession AS hs
    LEFT JOIN Booking AS b
        ON hs.session_id = b.session_id
    GROUP BY hs.session_id, hs.type_id
) AS s
    ON st.type_id = s.type_id
WHERE st.type_name LIKE '%Screening%'
GROUP BY st.type_id, st.type_name
ORDER BY scheduled_sessions DESC, cancellation_rate_pct DESC, st.type_name ASC;