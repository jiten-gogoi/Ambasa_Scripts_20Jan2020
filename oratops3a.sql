set sqlbl on
set lines 200
SELECT
              event,
              totwa,
              twsec,
              avgms,
              ROUND(RATIO_TO_REPORT(twsec) OVER () *
              100) pctwa,
              wclas,
              evtid
              FROM
              (SELECT
              NVL(substr(event,1,28),' ')
              event,
              SUM(total_waits)
              totwa,
              ROUND(SUM(time_waited_micro)/1000000, 0)
              twsec,
              ROUND(SUM(time_waited_micro)/

              SUM(total_waits)/1000, 2)
              avgms,
              NVL(substr(wait_class,1,13),' ')
              wclas,
              event_id
              evtid                           FROM
              GV$SYSTEM_EVENT
              WHERE WAIT_CLASS <> 'Idle'
              GROUP BY event, wait_class, event_id
              HAVING SUM(total_waits) > 0
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
              GV$SYSSTAT
              WHERE name in ('CPU
              used when call started',
              'CPU used by this session')
              )
              ORDER BY twsec desc)
              WHERE ROWNUM <6
;
