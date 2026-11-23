-- Q01: Overall utilization rate across vaccination sessions in October 2026 (MQ1)
SELECT
    st.type_id,
    st.type_name,
    COUNT(s.session_id) AS total_sessions,
    SUM(s.occupied_places) AS total_occupied_places,
    SUM(s.capacity) AS total_capacity,
    ROUND(SUM(s.occupied_places) * 100.0 / NULLIF(SUM(s.capacity), 0), 2) AS utilization_rate_pct
FROM SessionType AS st
JOIN (
    SELECT
        hs.session_id,
        hs.type_id,
        hs.capacity,
        SUM(CASE WHEN b.status IN ('Confirmed', 'Completed') THEN 1 ELSE 0 END) AS occupied_places
    FROM HealthSession AS hs
    LEFT JOIN Booking AS b
        ON hs.session_id = b.session_id
    WHERE hs.session_date >= '2026-10-01'
      AND hs.session_date <  '2026-11-01'
    GROUP BY hs.session_id, hs.type_id, hs.capacity
) AS s
    ON st.type_id = s.type_id
WHERE st.type_name LIKE '%Vaccination%'
GROUP BY st.type_id, st.type_name
ORDER BY utilization_rate_pct DESC, st.type_name ASC;
