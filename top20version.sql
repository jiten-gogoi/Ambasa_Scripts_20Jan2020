select * from (
select sql_id, version_count, executions, child_latch from v$sqlarea
order by 2 desc)
where rownum<=20;

