set lines 200 pages 1000
col SNAP_INTERVAL for a30
col RETENTION for a30
SELECT snap_interval, retention, topnsql FROM dba_hist_wr_control;
l
