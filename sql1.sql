clear breaks
clear columns
break on username skip 2 on SID skip 1 on osuser
column username format a23
column osuser format a16
column users justify centre
column sid justify centre

alter session set sort_area_size = 1000000000;
select nvl(sesion.username,sesion.program) username
,      sesion.osuser
,      sesion.sid
,      sqltext.sql_text
  from v$sqltext sqltext, v$session sesion
 where sesion.type = 'USER'
   and sesion.status = 'ACTIVE'
   and sesion.sql_hash_value = sqltext.hash_value
   and sesion.sql_address    = sqltext.address
order by username, sid, piece
/


