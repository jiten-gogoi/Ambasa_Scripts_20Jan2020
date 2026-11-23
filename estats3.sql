set lines 200 long 999999 pages 1000
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

execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size skewonly');

select count(*) from ambasa_customers_extstats where country_name='United States of America' 
AND COUNTRY_ID='US' GROUP BY STATE_PROVINCE;

@planfcl


execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size 1');

select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl


execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size auto');

select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;

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

select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl

execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size auto');

select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl

execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size skewonly');

select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;

select col#, name, property from sys.col$ where obj# in (select obj# from sys.obj$ where name = 'AMBASA_CUSTOMERS_EXTSTATS');

desc AMBASA_CUSTOMERS_EXTSTATS

select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl

execute dbms_stats.gather_table_stats ('AMBASA','ambasa_customers_extstats',no_invalidate=>false,method_opt=>'for all columns size auto');



select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;

select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl


select dbms_stats.report_col_usage('AMBASA','AMBASA_CUSTOMERS_EXTSTATS')  from dual;


exec dbms_stats.drop_extended_stats ('AMBASA','AMBASA_CUSTOMERS_EXTSTATS','(country_name,COUNTRY_ID)');


select country_name,COUNTRY_ID,count(STATE_PROVINCE) from ambasa_customers_extstats where 
country_name='United States of America' AND COUNTRY_ID='US' GROUP BY country_name,COUNTRY_ID;

@planfcl

