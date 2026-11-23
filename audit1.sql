whenever sqlerror exist rollback
set feed on
set head on
set arraysize 1
set space 1
set verify on
set pages 25
set lines 80
set termout on

undefine number_of_days

col username for a10
col os_username for a10
col timestamp for a9
col logoff_time for a9
col returncode for 999999999999
col terminal for a10
col userhost for a10


select 	a.username,
	os_username,
	a.timestamp,
	a.logoff_time,
	a.returncode,
	terminal,
	userhost
from dba_audit_session a
where (a.username,a.timestamp) in 
	(select b.username,max(b.timestamp)
		from dba_audit_session b
		group by b.username)
and a.timestamp<(sysdate-&&number_of_days)
/

