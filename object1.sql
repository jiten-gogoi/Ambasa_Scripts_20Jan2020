col owner for a10
col object_type for a15
col object_name for a30
col status for a10
select owner,object_type,object_name from dba_objects where upper(object_name) like upper('%&object_name%');
