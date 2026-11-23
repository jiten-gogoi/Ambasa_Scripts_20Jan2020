select * from table(dbms_workload_repository.awr_sql_report_text(&db_id, &inst_num, &begin_snap_id,&end_snap_id, '&sql_id'));
