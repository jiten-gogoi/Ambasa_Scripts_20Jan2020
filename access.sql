col owner for a20
col object for a20
col type for a15
set lines 200
select * from v$access where upper(object)=upper('&object_name');
l
