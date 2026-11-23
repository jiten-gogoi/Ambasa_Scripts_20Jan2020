select key, sql_id, sql_exec_id,
to_char(max(sql_exec_start) ,'DD/MM/YYYY HH24:Mi:SS')
sql_exec_start,
sql_child_address child_address
from v$sql_monitor
group by key, sql_id, sql_exec_id, sql_child_address
order by sql_exec_start;


col id format 999
col operation format a25
col object format a6
set colsep '|'
set lines 100
select p.id,
rpad(' ',p.depth*2, ' ')||p.operation operation,
p.object_name object,
p.cardinality card,
p.cost cost,
substr(m.status,1,4) status,
m.output_rows
from v$sql_plan p, v$sql_plan_monitor m
where p.sql_id=m.sql_id
and p.child_address=m.sql_child_address
and p.plan_hash_value=m.sql_plan_hash_value
and p.id=m.plan_line_id
and m.sql_id='&sql_id'
and m.sql_exec_id=&sql_exec_id
and m.sql_exec_start=to_date('20/11/2008 12:59:08 ','DD/MM/YYYY HH24:MI:SS')
order by p.id;
