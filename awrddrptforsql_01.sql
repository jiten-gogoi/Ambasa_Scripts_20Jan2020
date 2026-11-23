drop table t1 purge;

create table t1(c1, c2)  
as                                
select level, level               
from dual                         
connect by level <= 100000        
;                                 

select /*+ ordered use_nl(x y) */                                   
  count(*)                                                                   
from                                                                         
  (select level from dual connect by level <= 100) x,                        
  (select /*+ no_unnest */ * from t1 where c1 between 1 and 10) y            
;                                                                            


exec dbms_stats.gather_table_stats(user, 't1', no_invalidate=>false);
--exec dbms_workload_repository.add_colored_sql('&sql_id');
exec dbms_workload_repository.remove_colored_sql('f92v9t2zsx1sz');
exec dbms_workload_repository.add_colored_sql('f92v9t2zsx1sz');
--exec dbms_workload_repository.remove_colored_sql('&sql_id');

var dbid number; 
var inid number; 
                 
var bid1 number; 
var eid1 number; 
var bid2 number; 
var eid2 number;

begin                                         
  select dbid into :dbid from v$database;              
  select instance_number into :inid from v$instance;   
end;                                                   
/                                                      

print dbid

print inid

exec :bid1 := dbms_workload_repository.create_snapshot;

select /*+ ordered use_nl(x y) */                                   
  count(*)                                                                   
from                                                                         
  (select level from dual connect by level <= 100) x,                        
  (select /*+ no_unnest */ * from t1 where c1 between 1 and 10) y            
;                                                                            

exec :eid1 := dbms_workload_repository.create_snapshot;

create index t1_n1 on t1(c1);

exec :bid2 := dbms_workload_repository.create_snapshot;

select /*+ ordered use_nl(x y) */                       
  count(*)                                                       
from                                                             
  (select level from dual connect by level <= 100) x,            
  (select /*+ no_unnest */ * from t1 where c1 between 1 and 10) y
;                                                                

exec :eid2 := dbms_workload_repository.create_snapshot;

var sql_id varchar2(1000)
exec :sql_id := 'f92v9t2zsx1sz'

set lines 200 pages 1000
select * from
  table(dbms_workload_repository.awr_sql_report_text(
      :dbid, :inid, :bid1, :eid2, :sql_id
  ))
;
