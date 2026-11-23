column operation format a16
column options format a15
column object_name  format a20
column id  format 99
select lpad(' ',2*(level-1))||operation||' '||options||' '||object_name||' '||
       -- decode(partition_id, NULL, '',
       --         'PART:'||lower(partition_start||'-'||partition_stop))||
       decode(optimizer, NULL, '', ' ['||optimizer||']')||
       decode(id,0,' Cost=' ||nvl(position,   0)||
                   ' Rows=' ||nvl(cardinality,0)||
                   ' Bytes='||nvl(bytes,      0)) "Query Plan"
from   plan_table
where                                statement_id = 'XXX'
start   with     id = 0          and statement_id = 'XXX'
connect by prior id = parent_id  and statement_id = 'XXX'
/
