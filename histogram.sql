drop table ambasa.test_histo purge;
create table ambasa.test_histo(c1 varchar(30), c2 varchar(10), c3 varchar(10), c4 varchar(3));

begin
 for i in 1..10000 loop
 insert into ambasa.test_histo values(i,i,i,'AAA');
commit;
 end loop;
 insert into ambasa.test_histo values('10001','10001','10001','BBB');
commit;
 end;
 /

PAUSE

select c4, count(*) from ambasa.test_histo group by c4;

PAUSE



create index index_ambasa_t1 on ambasa.test_histo (c4);

PAUSE


set lines 200 pages 1000
set sqlbl on
col owner for a10
col table_name for a15

select owner,table_name,num_rows,blocks  from dba_tables where table_name='TEST_HISTO';




set lines 200
 
set sqlbl on
 
col owner for a10

col table_name for a15

col column_name for a15
select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,histogram from dba_tab_columns where table_name='TEST_HISTO';

PAUSE


exec dbms_stats.gather_table_stats('AMBASA','test_histo',cascade=>true,method_opt=>'for all columns size 1',estimate_percent=>100);

PAUSE



select owner,table_name,num_rows,blocks  from dba_tables where table_name='TEST_HISTO';

PAUSE

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='TEST_HISTO';

PAUSE

select c4, count(*) from ambasa.test_histo group by c4;

PAUSE

explain plan for select * from ambasa.test_histo  where c4='AAA';
select * from table(dbms_xplan.display);

PAUSE

explain plan for select * from ambasa.test_histo  where c4='BBB';
select * from table(dbms_xplan.display);


PAUSE

set autotrace traceonly

PAUSE

select * from ambasa.test_histo  where c4='AAA';

PAUSE

select * from ambasa.test_histo  where c4='BBB';

PAUSE

set autotrace off

PAUSE

exec dbms_stats.gather_table_stats('AMBASA','test_histo', method_opt=> 'for all columns size 75',no_invalidate => false,estimate_percent => 100);

PAUSE

select owner,table_name,num_rows,blocks  from dba_tables where table_name='TEST_HISTO';

PAUSE

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='TEST_HISTO';

PAUSE

explain plan for select * from ambasa.test_histo  where c4='AAA';
select * from table(dbms_xplan.display);

PAUSE

explain plan for select * from ambasa.test_histo  where c4='BBB';
select * from table(dbms_xplan.display);

PAUSE

set autotrace traceonly
select * from ambasa.test_histo  where c4='AAA';

PAUSE

select * from ambasa.test_histo  where c4='BBB';

PAUSE

set autotrace off

PAUSE

exec dbms_stats.gather_table_stats('AMBASA','test_histo', method_opt=> 'for all columns size 1',-
no_invalidate => false,estimate_percent => 100);

PAUSE

select owner,table_name,num_rows,blocks  from dba_tables where table_name='TEST_HISTO';

PAUSE

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='TEST_HISTO';

PAUSE

explain plan for select * from ambasa.test_histo  where c4='AAA';
select * from table(dbms_xplan.display);

PAUSE

explain plan for select * from ambasa.test_histo  where c4='BBB';
select * from table(dbms_xplan.display);

PAUSE

set autotrace traceonly
select * from ambasa.test_histo  where c4='AAA';

PAUSE

select * from ambasa.test_histo  where c4='BBB';

PAUSE

set autotrace off

PAUSE

exec dbms_stats.gather_table_stats('AMBASA','test_histo', method_opt=> 'for all columns size 1',-
no_invalidate => false,estimate_percent => 100);

PAUSE

select owner,table_name,num_rows,blocks  from dba_tables where table_name='TEST_HISTO';

PAUSE

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='TEST_HISTO';


PAUSE

explain plan for select * from ambasa.test_histo  where c4='AAA';
select * from table(dbms_xplan.display);

PAUSE

explain plan for select * from ambasa.test_histo  where c4='BBB';
select * from table(dbms_xplan.display);

PAUSE

set autotrace traceonly

PAUSE

select * from ambasa.test_histo  where c4='AAA';

PAUSE

select * from ambasa.test_histo  where c4='BBB';

PAUSE

set autotrace off

PAUSE

exec dbms_stats.gather_table_stats('AMBASA','test_histo')

PAUSE

select owner,table_name,num_rows,blocks  from dba_tables where table_name='TEST_HISTO';

PAUSE

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='TEST_HISTO';

PAUSE

explain plan for select * from ambasa.test_histo  where c4='AAA';
select * from table(dbms_xplan.display);

PAUSE

explain plan for select * from ambasa.test_histo  where c4='BBB';
select * from table(dbms_xplan.display);

PAUSE

set autotrace traceonly

PAUSE

select * from ambasa.test_histo  where c4='AAA';

PAUSE

select * from ambasa.test_histo  where c4='BBB';

set autotrace off
