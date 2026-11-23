set echo on
select count(*) from v$event_name;
select count(*) from v$event_name where name like 'latch%';
select count(*) from v$event_name where name like 'enq%';
