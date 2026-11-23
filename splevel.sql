SELECT parameter, value
FROM stats$statspack_parameter
UNPIVOT (
value FOR
parameter IN (snap_level, executions_th, parse_calls_th, disk_reads_th, buffer_gets_th,
sharable_mem_th, version_count_th, seg_phy_reads_th, seg_log_reads_th,
seg_buff_busy_th, seg_rowlock_w_th, seg_itl_waits_th, seg_cr_bks_rc_th,
seg_cu_bks_rc_th)
);
