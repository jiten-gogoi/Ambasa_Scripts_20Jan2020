SET lines 200
SET pages 1000
SET SQLBL ON
SELECT *
     FROM
       (SELECT status,
         --username,
         sql_id,
         sql_exec_id,
         TO_CHAR(sql_exec_start,'dd-mon-yyyy hh24:mi:ss') AS sql_exec_start,
         ROUND(elapsed_time/1000000)                      AS "Elapsed (s)",
         ROUND(cpu_time    /1000000)                      AS "CPU (s)",
         buffer_gets,
         ROUND(physical_read_bytes /(1024*1024)) AS "Phys reads (MB)",
         ROUND(physical_write_bytes/(1024*1024)) AS "Phys writes (MB)"
       FROM v$sql_monitor
       ORDER BY sql_exec_start desc
       )
     WHERE rownum<=20;


