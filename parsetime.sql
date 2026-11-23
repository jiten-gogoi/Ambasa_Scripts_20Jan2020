SELECT a.sql_id, s.sql_text, count(*) AS parse_time
FROM v$active_session_history a, v$sqlstats s
WHERE a.sql_id = s.sql_id(+)
AND a.session_id = &sid
AND a.session_serial# = &serialno
AND a.in_parse = 'Y'
GROUP BY a.sql_id, s.sql_text
ORDER BY count(*) DESC;
