col owner for a20
col object_name for a40
select OWNER,OBJECT_NAME,OBJECT_TYPE,STATUS from dba_invalid_objects where status='INVALID';
l
