-- Q03: Average waitlist queue length per session and total unmet demand by session type (MQ3)
SELECT
    st.type_id,
    st.type_name,
    COUNT(vs.session_id) AS total_sessions,
    COALESCE(ROUND(AVG(vs.waitlisted_count), 2), 0.00) AS avg_waitlist_length,
    COALESCE(SUM(vs.waitlisted_count), 0) AS total_unmet_demand
FROM SessionType AS st
LEFT JOIN v_session_summary AS vs
    ON st.type_id = vs.type_id
GROUP BY st.type_id, st.type_name
ORDER BY avg_waitlist_length DESC, total_unmet_demand DESC, st.type_name ASC;