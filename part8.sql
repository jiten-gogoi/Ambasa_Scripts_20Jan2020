set lines 200
col name for a15
col referenced_name for a15
select name
, type
, referenced_name
, referenced_type
from dba_dependencies
where referenced_name like 'REDEF_TEST'
and   referenced_owner = 'AMBASA';
l
