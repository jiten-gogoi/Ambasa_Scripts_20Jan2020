set sqlbl on 
set lines 200
SELECT
              inid, hcpu, sgfr, utps, ucps, saas, mbps,
              ssrt, iorl, load, upga,          aspq,
              dbcp, dbwa, iops, scnt, cpas, ioas, waas,
              dcpu, ncpu             FROM
              (select  inst_id
              inid,      sum(decode(metric_name, 'I/O
              Megabytes per Second' , value,0))  mbps,
              sum(decode(metric_name,
              'SQL Service Response Time' ,
              value*10000,0))                ssrt,
              sum(decode(metric_name,
              'Average Synchronous Single-Block Read
              Latency' , value,0))  iorl,
              sum(decode(metric_name, 'Current OS Load'
              , value,0))           load,
              sum(decode(metric_name, 'Active Parallel
              Sessions' , value,0))  aspq,
              sum(decode(metric_name, 'CPU Usage Per
              Sec' , value,0))         dcpu,
              sum(decode(metric_name, 'Database CPU
              Time Ratio' , value,0))   dbcp,
              sum(decode(metric_name, 'Database Wait
              Time Ratio' , value,0))  dbwa,
              sum(decode(metric_name, 'I/O Requests per
              Second' , value,0))   iops   from
              gv$sysmetric
              where    metric_name in (

              'I/O Megabytes per Second',
              'SQL Service Response Time',
              'Average Synchronous Single-Block Read
              Latency',
              'Current OS Load',
              'Active
              Parallel Sessions',
              'CPU Usage Per
              Sec',
              'Database CPU Time
              Ratio',
              'Database Wait Time Ratio',
              'I/O Requests per Second'
              )
              and group_id=2
              group by inst_id
              ),
              (select  inst_id
              id1,      sum(decode(metric_name, 'Host
              CPU Utilization (%)' , value,0))  hcpu,
              sum(decode(metric_name, 'Shared Pool Free
              %' , value,0))        sgfr,
              sum(decode(metric_name, 'User Transaction
              Per Sec' , value,0))  utps,
              sum(decode(metric_name, 'User Calls Per
              Sec' , value,0))        ucps,
              sum(decode(metric_name, 'Average Active
              Sessions' , value,0))   saas,
              sum(decode(metric_name, 'Total PGA
              Allocated' , value,0))       upga   from
              gv$sysmetric
              where    metric_name in
              (
              'Host CPU Utilization (%)',
              'Shared Pool Free
              %',
              'User Transaction Per Sec',
              'User Calls Per Sec',
              'Average Active Sessions',
              'Total PGA Allocated'
              )
              and group_id=3
              group by inst_id
              ),
              ( select inst_id
              id2,       count(*)
              scnt,
              sum(decode(WAIT_TIME,0,0,1))
              cpas,
              sum(decode(wait_class,'User I/O',1,0))
              ioas,
              sum(decode(WAIT_TIME,0,

              decode(wait_class, 'Idle',0,

              decode(wait_class, 'User I/O',0,1)),0))
              waas   from     gv$session
              where    type='USER'
              group by inst_id
              ),
              (SELECT inst_id
              id3,      TO_NUMBER(VALUE)
              ncpu  from   gv$osstat
              where  stat_name = 'NUM_CPUS'
              )
              WHERE id1=inid
              and id2=inid
              and id3=inid
              and ROWNUM <= 5 ORDER BY dbwa DESC;
