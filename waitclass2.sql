set lines 200 pages 1000
col wait_class for a30
SELECT wait_class, count(*)
 FROM v$event_name
 GROUP BY rollup(wait_class)
 ORDER BY wait_class;
