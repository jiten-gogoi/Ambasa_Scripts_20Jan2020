SELECT activity_pct,
db_time,
sql_id
FROM (
SELECT round(100 * ratio_to_report(count(*)) OVER (), 1) AS activity_pct,
count(*) AS db_time,
sql_id
FROM v$active_session_history
WHERE 
sql_id IS NOT NULL
GROUP BY sql_id
ORDER BY count(*) DESC
)
WHERE rownum <= 10;
