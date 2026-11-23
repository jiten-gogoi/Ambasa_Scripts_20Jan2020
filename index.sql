set lines 200
col index_name for a25
col table_name for a25
col table_owner for a10
col column_name for a15
select index_name,column_name,column_position,table_name,table_owner from dba_ind_columns where table_name='&TABLE_NAME' and table_owner='&table_owner';
