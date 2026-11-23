set pages 20000
column load format a6 justify right
column executes format 9999999
break on load on executes

select
  substr(to_char(s.pct, '99.00'), 2) || '%'  load,
  s.executions  executes,
  p.sql_text
from
  ( 
    select
      address,
      disk_reads,
      executions,
      pct,
      rank() over (order by disk_reads desc)  ranking
    from
      (
	select
	  address,
	  disk_reads,
	  executions,
	  100 * ratio_to_report(disk_reads) over ()  pct
	from
	  sys.v_$sql
	where
	  command_type != 47
      )
    where
      disk_reads > 50 * executions
  )  s,
  sys.v_$sqltext  p
where
  s.ranking <= 10 and
  p.address = s.address
order by
  1, s.address, p.piece
/

