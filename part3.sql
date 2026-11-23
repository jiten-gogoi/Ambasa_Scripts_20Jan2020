set sqlbl on
set lines 200
col TABLE_NAME FOR A20
col SUBPARTITION_NAME FOR A15
col HIGH_VALUE for A20
select TABLE_NAME, 

PARTITION_NAME,SUBPARTITION_NAME,SUBPARTITION_POSITION,HIGH_VALUE,TABLESPACE_NAME from dba_tab_subpartitions where table_owner='&table_owner';

