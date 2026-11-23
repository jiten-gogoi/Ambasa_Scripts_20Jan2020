set lines 150
set pages 40000
col operation format a55
col object format a25
select lpad(' ',2*depth)||operation||' '||options||decode(id, 0, substr(optimizer,1, 6)||' 
                   Cost='||to_char(cost)) operation,
object_name object, cpu_cost, io_cost
from v$sql_plan where sql_id='&sql_id' and child_number=&child_no;
