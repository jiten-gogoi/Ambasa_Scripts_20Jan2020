col owner for a15
col object_name for a40
col object_type for a20
col status for a10
select owner,object_name,object_type,status from dba_objects where upper(owner)=upper('&owner') order by 3;
