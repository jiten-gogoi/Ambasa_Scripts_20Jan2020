set lines 200 pages 1000
col substr(wait_event_text,1,30) for a40
SELECT chain_id, num_waiters, in_wait_secs, osid, blocker_osid, substr(wait_event_text,1,30) FROM v$wait_chains;
l
