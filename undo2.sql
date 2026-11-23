set lines 100 pages 999
col username format a15
col command format a20
select	ses.username,ses.sid
,	substr(ses.program, 1, 19) command
,	tra.used_ublk
from	v$session ses
,	v$transaction tra
where	ses.saddr = tra.ses_addr;
