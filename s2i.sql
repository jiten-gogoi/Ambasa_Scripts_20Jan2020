select
table_name,
column_name,
num_distinct,
num_buckets,
to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram
from
dba_tab_columns
where
table_name ='&table_name';


