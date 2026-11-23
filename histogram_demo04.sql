set lines 200 pages 1000
drop table histogram purge;
create table histogram as select rownum all_distinct, 10000 skew from dual connect
by level <= 10000;

update histogram set skew=all_distinct where rownum<=10;


select skew, count(*) from histogram group by skew order by skew;


exec dbms_stats.gather_table_stats(user,'HISTOGRAM', method_opt=>'for all columns size 1');

select column_name,num_distinct,density from user_tab_col_statistics where table_name='HISTOGRAM';

explain plan for select * from histogram where skew=1;


select * from table(dbms_xplan.display);

explain plan for select * from histogram where skew=10000;

select * from table(dbms_xplan.display);

create index skew_idx on histogram(skew);


exec dbms_stats.gather_index_stats(user,'SKEW_IDX');


explain plan for select * from histogram where skew=10000;

select * from table(dbms_xplan.display);

select column_name,num_distinct,density from user_tab_col_statistics where table_name='HISTOGRAM';

select column_name,endpoint_number,endpoint_value from user_tab_histograms where table_name='HISTOGRAM' and column_name='SKEW';

select endpoint_value as column_value,
endpoint_number as cummulative_frequency,
endpoint_number - lag(endpoint_number,1,0) over (order by endpoint_number) as frequency
from user_tab_histograms
where table_name = 'HISTOGRAM' and column_name = 'SKEW';

select column_name, density, histogram from user_tab_col_statistics where table_name='HISTOGRAM' and column_name='SKEW';


explain plan for select * from histogram where skew=10000;

select * from table(dbms_xplan.display);


explain plan for select * from histogram where skew=1;

select * from table(dbms_xplan.display);

--Let’s create histogram on column skew, this time with number of buckets less than the actual number
of distinct values that is 11.

exec dbms_stats.gather_table_stats(user,'HISTOGRAM',method_opt=>'for columns skew size 5');

select table_name, column_name,endpoint_number,endpoint_value from
user_tab_histograms where table_name='HISTOGRAM' and column_name='SKEW';


SELECT bucket_number, max(skew) AS endpoint_value
 FROM (
 SELECT skew, ntile(5) OVER (ORDER BY skew) AS bucket_number
 FROM histogram)
 GROUP BY bucket_number
 ORDER BY bucket_number;


