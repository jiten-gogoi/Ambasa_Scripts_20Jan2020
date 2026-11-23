set lines 200 pages 1000 echo on
drop table histogram purge;
create table histogram as select rownum all_distinct, 10000 skew from dual connect
by level <= 10000;
desc histogram
PAUSE
select skew, count(*) from histogram group by skew order by skew;
PAUSE
select ALL_DISTINCT,SKEW from histogram where rownum<=20;
PAUSE
update histogram set skew=all_distinct where rownum<=10;
PAUSE
select skew, count(*) from histogram group by skew order by skew;
select ALL_DISTINCT,SKEW from histogram where rownum<=20;

PAUSE

set lines 200 pages 1000
set sqlbl on
col owner for a10
col column_name for a15
col table_name for a15

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='HISTOGRAM';

PAUSE
select column_name,num_distinct,density from user_tab_col_statistics where table_name='HISTOGRAM';

PAUSE
begin
dbms_stats.gather_table_stats(user,'HISTOGRAM', method_opt=>'for all columns size 1');
end;
/

PAUSE

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='HISTOGRAM';

PAUSE
select column_name,num_distinct,density from user_tab_col_statistics where table_name='HISTOGRAM';

PAUSE
explain plan for select * from histogram where skew=1;

PAUSE
select * from table(dbms_xplan.display);

PAUSE
explain plan for select * from histogram where skew=10000;

PAUSE
select * from table(dbms_xplan.display);

PAUSE
create index skew_idx on histogram(skew);


PAUSE

begin
dbms_stats.gather_index_stats(user,'SKEW_IDX');
end;
/

PAUSE

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='HISTOGRAM';

PAUSE

select column_name,num_distinct,density from user_tab_col_statistics where table_name='HISTOGRAM';

PAUSE
select column_name,endpoint_number,endpoint_value from user_tab_histograms where table_name='HISTOGRAM' and column_name='SKEW';

PAUSE
SELECT bucket_number, max(skew) AS endpoint_value
 FROM (
 SELECT skew, ntile(5) OVER (ORDER BY skew) AS bucket_number
 FROM histogram)
 GROUP BY bucket_number
 ORDER BY bucket_number;


PAUSE
select endpoint_value as column_value,
endpoint_number as cummulative_frequency,
endpoint_number - lag(endpoint_number,1,0) over (order by endpoint_number) as frequency
from user_tab_histograms
where table_name = 'HISTOGRAM' and column_name = 'SKEW';

PAUSE

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='HISTOGRAM';


PAUSE
explain plan for select * from histogram where skew=1;

PAUSE
select * from table(dbms_xplan.display);


PAUSE
explain plan for select * from histogram where skew=10000;

PAUSE
select * from table(dbms_xplan.display);

PAUSE

REM Let’s create histogram on column skew, this time with number of buckets equal to the actual number
REM of distinct values that is 11.

PAUSE
begin
dbms_stats.gather_table_stats(user,'HISTOGRAM',method_opt=>'for columns skew size 11');
end;
/

PAUSE

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='HISTOGRAM';


PAUSE
select column_name,num_distinct,density from user_tab_col_statistics where table_name='HISTOGRAM';

PAUSE
select table_name, column_name,endpoint_number,endpoint_value from
user_tab_histograms where table_name='HISTOGRAM' and column_name='SKEW';


PAUSE
SELECT bucket_number, max(skew) AS endpoint_value
 FROM (
 SELECT skew, ntile(5) OVER (ORDER BY skew) AS bucket_number
 FROM histogram)
 GROUP BY bucket_number
 ORDER BY bucket_number;

PAUSE

select endpoint_value as column_value,
endpoint_number as cummulative_frequency,
endpoint_number - lag(endpoint_number,1,0) over (order by endpoint_number) as frequency
from user_tab_histograms
where table_name = 'HISTOGRAM' and column_name = 'SKEW';


PAUSE

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='HISTOGRAM';

PAUSE
explain plan for select * from histogram where skew=1;


PAUSE
select * from table(dbms_xplan.display);

PAUSE
explain plan for select * from histogram where skew=10000;

PAUSE

select * from table(dbms_xplan.display);

PAUSE
REM Let’s create histogram on column skew, this time with number of buckets less than the actual number
REM of distinct values that is 11.

PAUSE

begin
dbms_stats.gather_table_stats(user,'HISTOGRAM',method_opt=>'for columns skew size 5');
end;
/

select table_name,column_name,num_distinct,num_buckets,to_char(last_analyzed, 'dd.mm.yyyy hh24:mi:ss') last_analyzed,
histogram from dba_tab_columns where table_name='HISTOGRAM';

PAUSE
select table_name, column_name,endpoint_number,endpoint_value from
user_tab_histograms where table_name='HISTOGRAM' and column_name='SKEW';

PAUSE
select column_name,num_distinct,density from user_tab_col_statistics where table_name='HISTOGRAM';

PAUSE
SELECT bucket_number, max(skew) AS endpoint_value
 FROM (
 SELECT skew, ntile(5) OVER (ORDER BY skew) AS bucket_number
 FROM histogram)
 GROUP BY bucket_number
 ORDER BY bucket_number;

PAUSE

select endpoint_value as column_value,
endpoint_number as cummulative_frequency,
endpoint_number - lag(endpoint_number,1,0) over (order by endpoint_number) as frequency
from user_tab_histograms
where table_name = 'HISTOGRAM' and column_name = 'SKEW';


PAUSE
explain plan for select * from histogram where skew=1;

PAUSE
select * from table(dbms_xplan.display);

PAUSE
explain plan for select * from histogram where skew=10000;

PAUSE
select * from table(dbms_xplan.display);

