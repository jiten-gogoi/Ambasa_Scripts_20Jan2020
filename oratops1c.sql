set sqlbl on
set lines 200
SELECT
              sum(cpu) scpu, sum(sga) ssga,
              sum(ins) inst                        from
              (
              select SUM(VALUE) cpu, 0 sga,
              count(distinct inst_id) ins
              from   gv$osstat  where stat_name =
              'NUM_CPUS'
              union all
              select 0 cpu, SUM(VALUE) sga, 0 ins
              from   gv$sga )
;
