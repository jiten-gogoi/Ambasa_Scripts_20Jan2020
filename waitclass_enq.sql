select wait_class, name
from v$event_name
where name LIKE 'enq%'
and wait_class <> 'Other'
order by wait_class
/
