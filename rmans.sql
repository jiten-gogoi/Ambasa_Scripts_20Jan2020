set linesize 400
col opname for a33
select SID, opname,START_TIME,TOTALWORK, sofar, (sofar/totalwork) * 100 done, sysdate + TIME_REMAINING/3600/24 end_at,
time_remaining,to_char(to_date(time_remaining,'sssss'),'hh24:mi:ss')Hrs from v$session_longops where totalwork > sofar AND opname like 'RMAN%';

