SET lines 200
SET pages 1000
SET SQLBL ON
col username for a7
col sid for 999
SELECT *
     FROM
       (SELECT status,
         sid,username,
         sql_id,
         sql_exec_id,
         TO_CHAR(sql_exec_start,'dd-mon-yyyy hh24:mi:ss') AS sql_exec_start,
         ROUND(elapsed_time/1000000)                      AS "Elapsed (s)",
         ROUND(cpu_time    /1000000)                      AS "CPU (s)",
         buffer_gets,
	 sql_text
       FROM v$sql_monitor
       where status not like '%DONE%'
       ORDER BY sql_exec_start desc
       )
WHERE rownum<=20;
