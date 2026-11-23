SET LINESIZE 200
COLUMN trace_file FORMAT A70
col username for a10

SELECT s.sid,s.username,
       s.serial#,
       pa.value || '/' || LOWER(SYS_CONTEXT('userenv','instance_name')) ||    
       '_ora_' || p.spid || '.trc' AS trace_file
FROM   v$session s,
       v$process p,
       v$parameter pa
WHERE  pa.name = 'user_dump_dest'
AND    s.sid=&sid
AND    s.paddr = p.addr and s.username is not null;
