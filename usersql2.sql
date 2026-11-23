SELECT s.sid,s.username,t.SQL_FULLTEXT
FROM v$session s, v$sql t
WHERE t.SQL_ID='&SQL_ID'
AND t.sql_id = s.sql_id;

