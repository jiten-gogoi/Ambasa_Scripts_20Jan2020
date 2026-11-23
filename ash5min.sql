select output from table(dbms_workload_repository.ash_report_text( (select dbid from v$database),
                             1,
                             sysdate-5/(24*60),
                             sysdate,
                             0))
/

