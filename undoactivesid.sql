set lines 200
col sid for 999999999999
col serial# 999999999999999
set sqlbl on
set lines 100 pages 999
col username format a15
col command format a20
select	ses.username,ses.sid
,	substr(ses.program, 1, 19) command
,	tra.used_ublk,tra.xidusn,tra.xid
from	v$session ses
,	v$transaction tra
where	ses.saddr = tra.ses_addr;
