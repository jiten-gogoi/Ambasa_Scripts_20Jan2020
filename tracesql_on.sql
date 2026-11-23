alter system set events 'sql_trace[SQL:&sql_id] plan_stat=all_executions,wait=true,bind=true';
