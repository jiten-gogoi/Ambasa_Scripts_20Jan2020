set lines 200 pages 1000
 column pu format a8 heading 'O/S|Login|ID'
 column su format a8 heading 'Oracle|User ID'
 column stat format a8 heading 'Session|Status'
 column ssid format 999999 heading 'Oracle|Session|ID'
 column sser format 999999 heading 'Oracle|Serial|No'
 column spid format 999999 heading 'UNIX|Process|ID'
 column txt format a40 heading 'Current Statment'
 SELECT p.username pu,
s.username su,
s.status stat,
s.sid ssid,
s.serial# sser,
lpad(p.spid,7) spid,
s.sql_id,
s.sql_child_number,
s.prev_sql_id,
substr(sa.sql_text,1,540) txt
FROM v$process p, v$session s, v$sqlarea sa
WHERE p.addr=s.paddr
AND s.username is not null
AND s.sql_address=sa.address(+)
AND s.sql_hash_value=sa.hash_value(+)
AND s.status='ACTIVE'
 ORDER BY 1,2,7;
