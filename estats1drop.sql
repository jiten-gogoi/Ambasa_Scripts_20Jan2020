
--Wrong Syntax do not use
exec dbms_stats.drop_extended_stats('','test_funct','SYS_STUMMY#LUDFVUOI56L724JL4ZO');

--ERROR at line 1:
--ORA-20001: Invalid extension: does not start with (

--Correct Syntax
exec dbms_stats.drop_extended_stats('','test_funct','(upper(name))');
col column_name for a40
select column_name, count(*) from dba_histograms where owner='AMBASA' and table_name = 'TEST_FUNCT' group by column_name;

select table_name, column_name, num_distinct from dba_tab_col_statistics where table_name = 'TEST_FUNCT';

desc test_funct

select COLUMN_NAME from dba_tab_columns where table_name = 'TEST_FUNCT';

select col#, name, property from sys.col$ where obj# in (select obj# from sys.obj$ where name = 'TEST_FUNCT');

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='TEST_FUNCT';
