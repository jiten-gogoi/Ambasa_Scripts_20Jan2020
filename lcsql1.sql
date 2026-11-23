set lines 200
col spid for a8
col INST_ID for 99
col sid for 99999
col action format a20
col logon_time format a15
col module format a13
col cli_process format a7
col cli_mach for a15
col status format a10
col username format a10
col event for a20
col program for a20
col "Last SQL" for a30
col last_call_et_hrs for 999.99
col sql_hash_value for 9999999999999
select p.INST_ID,p.spid,s.sid, s.serial#, s.status,s.last_call_et/3600 last_call_et_hrs ,
s.machine cli_mach,sw.event,
s.module,s.sql_hash_value,lpad(t.sql_text,30) "Last SQL"
from gv$session s, gv$sqlarea t,gv$process p,gv$session_wait sw
where s.sql_address =t.address and
s.sql_hash_value =t.hash_value and
p.addr=s.paddr and
s.sid=sw.sid and
sw.event like '%library cache%'
order by p.spid;
