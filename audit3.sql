-- SQL to test for failed logon attempts, grouped per day.
-- Change to above SQL to show a little more details.
--

select count(*),username,terminal,to_char(timestamp,'DD-MON-YYYY'),returncode
from dba_audit_session
group by username,terminal,to_char(timestamp,'DD-MON-YYYY'),returncode
/
