SELECT wait_class,
round(time_waited, 3) AS time_waited,
round(1E2 * ratio_to_report(time_waited) OVER (), 1) AS "%"
FROM (
SELECT sid, wait_class, time_waited / 1E2 AS time_waited
FROM v$session_wait_class
WHERE total_waits > 0
UNION ALL
SELECT sid, 'CPU', value / 1E6
FROM v$sess_time_model
WHERE stat_name = 'DB CPU'
)
WHERE sid = &sid
ORDER BY 2 DESC;
