-- check what audit privileges have been granted and to what users and roles.
--

select *
from dba_sys_privs
where privilege like '%AUDIT%'

