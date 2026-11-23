col username for a14
col state for a19
col event for a30
col module for a10
SELECT sid,serial#,username,module,event, state, seconds_in_wait from v$session where type <> 'BACKGROUND' ORDER BY 4;

