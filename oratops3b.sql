set sqlbl on
set lines 200
SELECT
              event,
              totwa,
              twsec,
              avgms,
              ROUND(RATIO_TO_REPORT(twsec) OVER
              () * 100) pctwa,
              wclas,
              evtid
              FROM
              (SELECT
              NVL(substr(b.event,1,28),' ')
              event,
              SUM(a.total_waits)
              totwa,
              ROUND(SUM(a.time_waited_micro)/1000000,
              0)   twsec,
              ROUND(SUM(a.time_waited_micro)/
              SUM(a.total_waits)/1000, 2)
              avgms,
              NVL(substr(a.wait_class,1,13),' ')
              wclas,
              b.wait_class_id
              evtid                         FROM
              GV$SESSION_EVENT a,

              GV$SESSION_WAIT b
              WHERE
              a.inst_id =b.inst_id and
              a.sid = b.sid and
              a.wait_class_id = b.wait_class_id
              and
              a.WAIT_CLASS <> 'Idle'  and
              b.WAIT_CLASS <> 'Idle'
              GROUP BY b.event, a.wait_class,
              b.wait_class_id
              HAVING SUM(a.total_waits) > 0
              UNION ALL
              SELECT
              'DB CPU'
              event,                                0
              totwa,
              AVG(icput)
              twsec,                                0
              avgms,
              ' '
              wclas,                                19
              evtid                           FROM  (
              select
              sum(VALUE)/100 icput
              FROM
              GV$SESSTAT
              WHERE STATISTIC# in
              (select STATISTIC# from v$statname
              where name in ('CPU used when call
              started',
              'CPU used by this session'))
              )
              ORDER BY twsec desc)
              WHERE ROWNUM <6
;
