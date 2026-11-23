col day format a15; 
col hour format a4; 
col total format 999; 
select to_char(first_time,'yyyy-mm-dd') day, to_char(first_time,'hh24') hour, count(*) total 
from v$log_history 
group by to_char(first_time,'yyyy-mm-dd'),to_char(first_time,'hh24') 
order by to_char(first_time,'yyyy-mm-dd'),to_char(first_time,'hh24') asc; 
