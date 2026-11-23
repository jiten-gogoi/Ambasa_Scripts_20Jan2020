SELECT
wait_class_id,
wait_class,
COUNT(*) cnt
FROM dba_hist_active_sess_history
GROUP BY wait_class_id, wait_class
ORDER BY 3 desc;
