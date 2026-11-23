col column_name for a20
select table_name, column_name,num_nulls, num_distinct,num_buckets,histogram,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed  from dba_tab_col_statistics where owner='&owner' and table_name = '&table_name';
