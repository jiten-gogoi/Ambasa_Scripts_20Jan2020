column column_name format a22 
column column_position format 999999999 
column descend format a5 

select lower(b.index_name) index_name, b.column_position,
b.descend, lower(b.column_name) column_name
from dba_ind_columns b
where b.table_owner = '&TABLE_OWNER'
and b.table_name = '&TABLE_NAME'
order by b.index_name, b.column_position, b.column_name
/
