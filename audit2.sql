--
-- SQL to test for failed logon attempts, grouped per day.
--
select count(*),username,terminal,to_char(timestamp,'DD-MON-YYYY')
from dba_audit_session
where returncode<>0
group by username,terminal,to_char(timestamp,'DD-MON-YYYY')
/
