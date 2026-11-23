--Let's check how often we are finding the cursor in the session cache:
select
a.sid,a.parse_cnt,b.cache_cnt,trunc(b.cache_cnt/a.parse_cnt*100,2) pct
from
(select a.sid,a.value parse_cnt from v$sesstat a, v$statname b where
a.statistic#=b.statistic#
and b.name = 'parse count (total)' and value >0) a
,(select a.sid,a.value cache_cnt from v$sesstat a, v$statname b where
a.statistic#=b.statistic#
and b.name ='session cursor cache hits') b
where a.sid=b.sid
order by 4,2;
