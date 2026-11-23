col table_name for a25
col tablespace_name for a10
set lines 200
select TABLE_NAME, PARTITION_NAME, PARTITION_POSITION, HIGH_VALUE,tablespace_name,
 to_char(created,'dd.mm.yyyy:hh24:mi:ss') created from dba_tab_partitions, dba_objects
 where table_name = 'EXCHANGE_PART'
 and partition_name = subobject_name and object_name = table_name
order by PARTITION_POSITION;

