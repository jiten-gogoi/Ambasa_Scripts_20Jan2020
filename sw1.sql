col state for a20
col event for a40
set lines 200
select sid,state,seconds_in_wait,wait_time,event,wait_class from v$session_wait where wait_class# <> 6;
l
