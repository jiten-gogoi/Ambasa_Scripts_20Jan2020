SELECT s.sid sess_id, g.name consumer_group,
s.state, s.consumed_cpu_time cpu_time, s.cpu_wait_time, s.queued_time,(s.CURRENT_SMALL_READ_MEGABYTES+s.CURRENT_LARGE_READ_MEGABYTES) read_MB,(s.CURRENT_SMALL_WRITE_MEGABYTES+s.CURRENT_LARGE_WRITE_MEGABYTES) write_mb
FROM v$rsrc_session_info s, v$rsrc_consumer_group g
WHERE s.current_consumer_group_id = g.id and g.name='CPU_IO_LIMIT_GRP';
