set lines 200
col id 999
col name for a20
col status 10

select id, name, status, to_char(start_time,'dd.mm.yyyy:hh24:mi:ss') start_time,
to_char(end_time,'dd.mm.yyyy:hh24:mi:ss') end_time, dir_path from dba_workload_captures;
