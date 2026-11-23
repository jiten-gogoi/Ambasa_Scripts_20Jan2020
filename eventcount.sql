set lines 200
col event for a50
SELECT count(*), event
FROM v$session_wait
WHERE wait_time = 0
	AND event NOT IN ('smon timer','pmon timer','rdbms ipc message', 
				'SQL*Net message from client')
GROUP BY event
ORDER BY 1 DESC;
