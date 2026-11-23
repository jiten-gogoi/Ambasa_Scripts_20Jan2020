set echo on
set lines 200
col snap_interval for a20
select snap_interval,retention from dba_hist_wr_control;
pause
select dbid,
      extract( day from snap_interval) *24*60+
      extract( hour from snap_interval) *60+
      extract( minute from snap_interval ) "Snapshot Interval",
      extract( day from retention) *24*60+
      extract( hour from retention) *60+
      extract( minute from retention ) "Retention Interval"
from dba_hist_wr_control;
set echo off
