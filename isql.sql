col username for a10
col sql_text for a50 wrap
col module for a20
set lines 200
select sess.sid, sess.serial#, sess.username,sess.module, sql_text
 from v$sqlarea sqlarea, v$session sess
 where sess.prev_hash_value = sqlarea.hash_value
   and sess.prev_sql_addr  = sqlarea.address
   and sess.username is not null
   and sess.sid=&sid
   and sess.status='INACTIVE';
