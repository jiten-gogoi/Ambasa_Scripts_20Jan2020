set sqlbl on
set lines 200
SELECT
              to_char(max(end_time),'hh24:mi:ss')
              dbts,
              sum(decode(metric_name,'Average Active
              Sessions',value,0))  taas,
              sum(decode(metric_name, 'Total PGA
              Allocated', value,0))    spga    from
              gv$sysmetric
              where  metric_name in ('Average Active
              Sessions','Total PGA Allocated')      and
              group_id = 3
/
