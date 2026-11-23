col stale_stats  for a20
select owner,table_name,num_rows,blocks,stale_stats from dba_tab_statistics where owner='&owner' and table_name='&table_name';
