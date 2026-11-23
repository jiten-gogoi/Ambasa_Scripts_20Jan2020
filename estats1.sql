set echo on

drop table test_funct purge;

create table test_funct (id number, name varchar2(30), revenue number, costs number);

declare
v_1 number; v_2 number; v_3 varchar2(30); v_4 number;
begin
for i in 1.. 100000 loop
v_3 := 'This is customer '||i;
v_1 := i*245;
v_2 := (v_1-100)/1.2;
select round(v_2) into v_4 from dual;
insert into test_funct values (i,v_3,v_1,v_4);
end loop;
end;
/

set lines 200
col table_name for a20
col column_name for a15
col owner for a15
select owner,table_name,num_rows,blocks  from dba_tables where table_name='TEST_FUNCT';

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='TEST_FUNCT';

explain plan for select revenue from test_funct where upper(name) = :a1;

select * from table(dbms_xplan.display);

exec dbms_stats.gather_table_stats('','test_funct',method_opt => 'for all columns size 1');

select owner,table_name,num_rows,blocks  from dba_tables where table_name='TEST_FUNCT';

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='TEST_FUNCT';


explain plan for select revenue from test_funct where upper(name) = :a1;

select * from table(dbms_xplan.display);
pause
select dbms_stats.create_extended_stats(null,'test_funct','(upper(name))') funct_upper from dual;

---Incase multi column statistics
--select dbms_stats.create_extended_stats(null,'test_asl_ambasa_ext_stat','(c2,c3,c4)') from dual;


--While creation if you spell the function different, it still works!
--exec dbms_stats.drop_extended_stats('','test_funct','(UpPer(NamE))');
--select dbms_stats.create_extended_stats(null,'test_funct','(Upper(NaMe))') funct_upper from dual;


col column_name for a40
select column_name, count(*) from dba_histograms where owner='AMBASA' and table_name = 'TEST_FUNCT' group by column_name;


select table_name, column_name, num_distinct from dba_tab_col_statistics where table_name = 'TEST_FUNCT';

desc test_funct

select COLUMN_NAME from dba_tab_columns where table_name = 'TEST_FUNCT';

select col#, name, property from sys.col$ where obj# in (select obj# from sys.obj$ where name = 'TEST_FUNCT');
pause
select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='TEST_FUNCT';

select table_name, extension_name, extension from dba_stat_extensions where table_name = 'TEST_FUNCT';

select table_name, column_name, num_distinct from dba_tab_col_statistics where table_name = 'TEST_FUNCT';


explain plan for select revenue from test_funct where upper(name) = :a1;

select * from table(dbms_xplan.display);

exec dbms_stats.gather_table_stats('','test_funct',method_opt => 'for all columns size 1');


explain plan for select revenue from test_funct where upper(name) = :a1;

select * from table(dbms_xplan.display);

pause
select table_name, extension_name, extension from dba_stat_extensions
where table_name = 'TEST_FUNCT';


col column_name for a40
select column_name, count(*) from dba_histograms where owner='AMBASA' and table_name = 'TEST_FUNCT' group by column_name;

desc test_funct

select COLUMN_NAME from dba_tab_columns where table_name = 'TEST_FUNCT';

select col#, name, property from sys.col$ where obj# in (select obj# from sys.obj$ where name = 'TEST_FUNCT');

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='TEST_FUNCT';

pause
--changes after gather stats
select table_name, column_name, num_distinct from dba_tab_col_statistics where table_name = 'TEST_FUNCT';


--As you can see, additional statistics for this virtual column have now been collected, however this
--information is ONLY visible over dba_tab_col_statistics, not over dba_tab_columns (because this is a virtual
--column and not a real column).


--Before Histogram collection

col column_name for a40
select column_name, count(*) from dba_histograms where owner='AMBASA' and table_name = 'TEST_FUNCT' group by column_name;


--After Histogram collection

exec dbms_stats.gather_table_stats('','test_funct',method_opt => 'for all columns size 75');

select column_name, count(*) from dba_histograms where owner='AMBASA' and table_name = 'TEST_FUNCT' group by column_name;
