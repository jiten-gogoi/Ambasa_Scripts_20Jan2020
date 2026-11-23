set lines 200
col table_name for a20
col index_name for a20
col COLUMN_NAME for a36
set sqlbl on
select TABLE_NAME,BLOCKS,NUM_ROWS,OWNER,to_char(last_analyzed, 'DD-MON-YYYY HH24:MI:SS') from dba_tables where table_name = '&table_name';
l
