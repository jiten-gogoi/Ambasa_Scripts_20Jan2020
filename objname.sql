col object_name for a20
col object_type for a20
col owner for a10
col status for a10
set lines 200
select object_name,object_name,owner,status from dba_objects where upper(object_name)='&object_name';
l
