set long 9999999 pages 1000 lines 200
--Extended Statistics
--	--A) Multi-Column Statistics
--	--B) Expression Statistics

drop table ambasa_customers_extstats purge;

create table ambasa_customers_extstats as select * from hr.EMP_DETAILS_VIEW;

select count(*) from ambasa_customers_extstats;

select distinct COUNTRY_NAME from ambasa_customers_extstats;

select distinct  COUNTRY_ID from ambasa_customers_extstats;

select distinct state_province from ambasa_customers_extstats;

select count(*) from ambasa_customers_extstats where country_name='United States of America' 
AND COUNTRY_ID='US' GROUP BY STATE_PROVINCE;

@planfcl

col stale_stats  for a20
col owner for a10
col table_name for a20
col column_name for a20

select owner,table_name,num_rows,blocks,stale_stats from dba_tab_statistics where 
owner='AMBASA' and table_name='AMBASA_CUSTOMERS_EXTSTATS';

col column_name for a20
select table_name, column_name,num_nulls, num_distinct,num_buckets,histogram,to_char
(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed  from dba_tab_col_statistics where 
owner='AMBASA' and table_name = 'AMBASA_CUSTOMERS_EXTSTATS';

execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size skewonly');

col stale_stats  for a20
col owner for a10
col table_name for a20
col column_name for a20

select owner,table_name,num_rows,blocks,stale_stats from dba_tab_statistics where 
owner='AMBASA' and table_name='AMBASA_CUSTOMERS_EXTSTATS';

col column_name for a20
select table_name, column_name,num_nulls, num_distinct,num_buckets,histogram,to_char
(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed  from dba_tab_col_statistics where 
owner='AMBASA' and table_name = 'AMBASA_CUSTOMERS_EXTSTATS';


select count(*) from ambasa_customers_extstats where country_name='United States of America' 
AND COUNTRY_ID='US' GROUP BY STATE_PROVINCE;

@planfcl


select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual; 

select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;



execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size 1');


col stale_stats  for a20
select owner,table_name,num_rows,blocks,stale_stats from dba_tab_statistics where owner='AMBASA' and table_name='AMBASA_CUSTOMERS_EXTSTATS';

col column_name for a20
select table_name, column_name,num_nulls, num_distinct,num_buckets,histogram,to_char
(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed  from dba_tab_col_statistics where 
owner='AMBASA' and table_name = 'AMBASA_CUSTOMERS_EXTSTATS';



select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl


execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size auto');

select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;

col stale_stats  for a20
select owner,table_name,num_rows,blocks,stale_stats from dba_tab_statistics where 
owner='AMBASA' and table_name='AMBASA_CUSTOMERS_EXTSTATS';

col column_name for a20
select table_name, column_name,num_nulls, num_distinct,num_buckets,histogram,to_char
(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed  from dba_tab_col_statistics where 
owner='AMBASA' and table_name = 'AMBASA_CUSTOMERS_EXTSTATS';


select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl


select dbms_stats.create_extended_stats ('AMBASA','AMBASA_CUSTOMERS_EXTSTATS','(country_name,COUNTRY_ID)') from dual;

--For Drop : exec dbms_stats.drop_extended_stats
('AMBASA','AMBASA_CUSTOMERS_EXTSTATS','(country_name,COUNTRY_ID)');

select col#, name, property from sys.col$ where obj# in (select obj# from sys.obj$ where name 
= 'AMBASA_CUSTOMERS_EXTSTATS');

select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;

desc AMBASA_CUSTOMERS_EXTSTATS

select COLUMN_NAME from dba_tab_columns where table_name = 'AMBASA_CUSTOMERS_EXTSTATS' and 
owner='AMBASA';

col stale_stats  for a20
select owner,table_name,num_rows,blocks,stale_stats from dba_tab_statistics where 
owner='AMBASA' and table_name='AMBASA_CUSTOMERS_EXTSTATS';

col column_name for a20
select table_name, column_name,num_nulls, num_distinct,num_buckets,histogram,to_char
(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed  from dba_tab_col_statistics where 
owner='AMBASA' and table_name = 'AMBASA_CUSTOMERS_EXTSTATS';


select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl

execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size auto');


select col#, name, property from sys.col$ where obj# in (select obj# from sys.obj$ where name = 'AMBASA_CUSTOMERS_EXTSTATS');

select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;

desc AMBASA_CUSTOMERS_EXTSTATS

select COLUMN_NAME from dba_tab_columns where table_name = 'AMBASA_CUSTOMERS_EXTSTATS' and owner='AMBASA';

col stale_stats  for a20
select owner,table_name,num_rows,blocks,stale_stats from dba_tab_statistics where owner='AMBASA' and table_name='AMBASA_CUSTOMERS_EXTSTATS';

col column_name for a20
select table_name, column_name,num_nulls, num_distinct,num_buckets,histogram,to_char (last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed  from dba_tab_col_statistics where owner='AMBASA' and table_name = 'AMBASA_CUSTOMERS_EXTSTATS';


select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl

execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size skewonly');

select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;

select col#, name, property from sys.col$ where obj# in (select obj# from sys.obj$ where name = 'AMBASA_CUSTOMERS_EXTSTATS');

desc AMBASA_CUSTOMERS_EXTSTATS

select COLUMN_NAME from dba_tab_columns where table_name = 'AMBASA_CUSTOMERS_EXTSTATS' and owner='AMBASA';

col stale_stats  for a20
select owner,table_name,num_rows,blocks,stale_stats from dba_tab_statistics where owner='AMBASA' and table_name='AMBASA_CUSTOMERS_EXTSTATS';

col column_name for a20
select table_name, column_name,num_nulls, num_distinct,num_buckets,histogram,to_char
(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed  from dba_tab_col_statistics where 
owner='AMBASA' and table_name = 'AMBASA_CUSTOMERS_EXTSTATS';


select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl

execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size auto');



select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;

select col#, name, property from sys.col$ where obj# in (select obj# from sys.obj$ where name = 'AMBASA_CUSTOMERS_EXTSTATS');

desc AMBASA_CUSTOMERS_EXTSTATS

select COLUMN_NAME from dba_tab_columns where table_name = 'AMBASA_CUSTOMERS_EXTSTATS' and owner='AMBASA';

col stale_stats  for a20
col owner for a10
select owner,table_name,num_rows,blocks,stale_stats from dba_tab_statistics where owner='AMBASA' and table_name='AMBASA_CUSTOMERS_EXTSTATS';

col column_name for a20
select table_name, column_name,num_nulls, num_distinct,num_buckets,histogram,to_char
(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed  from dba_tab_col_statistics where 
owner='AMBASA' and table_name = 'AMBASA_CUSTOMERS_EXTSTATS';


select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl


select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;



exec dbms_stats.drop_extended_stats ('AMBASA','AMBASA_CUSTOMERS_EXTSTATS','(country_name,COUNTRY_ID)');

select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;


select col#, name, property from sys.col$ where obj# in (select obj# from sys.obj$ where name = 'AMBASA_CUSTOMERS_EXTSTATS');

desc AMBASA_CUSTOMERS_EXTSTATS

select COLUMN_NAME from dba_tab_columns where table_name = 'AMBASA_CUSTOMERS_EXTSTATS' and owner='AMBASA';

col stale_stats  for a20
select owner,table_name,num_rows,blocks,stale_stats from dba_tab_statistics where owner='AMBASA' and table_name='AMBASA_CUSTOMERS_EXTSTATS';

col column_name for a20
select table_name, column_name,num_nulls, num_distinct,num_buckets,histogram,to_char
(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed  from dba_tab_col_statistics where 
owner='AMBASA' and table_name = 'AMBASA_CUSTOMERS_EXTSTATS';


select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl
