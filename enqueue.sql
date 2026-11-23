select
distinct name
from
v$event_name
where
name like '%enq%'
order by 1;
l
