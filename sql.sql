col status for a10
col username for a10
col event for a20
set lines 200
select username, sid, serial#, status, sql_id, prev_sql_id, event, seconds_in_wait from v$session
where username like nvl('&username',username)
and sid like nvl('&sid',sid)
--and sql_id='&sql_id'
order by username, sid, serial#;
