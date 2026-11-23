col event for a30
col module for a30
col username for a15
set lines 200
select sid,serial#,username,event,status,module from v$session where username<>'BACKGROUND';
l
