SELECT count(*) AS db_time,
count(nullif(in_parse, 'N')) AS parse_time,
count(nullif(in_hard_parse, 'N')) AS hard_parse_time
FROM v$active_session_history
WHERE session_id = &sid
AND session_serial# = &serialno;
