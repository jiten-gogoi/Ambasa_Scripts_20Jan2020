set lines 200 pages 999
col object_name format a30
select owner,object_type,object_name,count(*) from dba_objects where status='INVALID' group by owner,object_type,object_name;

