set lines 200 pages 1000
col plan for a20
col GROUP_OR_SUBPLAN for a20
select plan, group_or_subplan, switch_time, switch_io_megabytes, switch_io_reqs
from dba_rsrc_plan_directives
where plan in (select name from v$rsrc_plan)
and (switch_time is not null
or switch_io_megabytes is not null
or switch_io_reqs is not null);

