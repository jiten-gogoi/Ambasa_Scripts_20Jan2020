declare
       baseline_ref_cursor DBMS_SQLTUNE.SQLSET_CURSOR;
     begin
       open baseline_ref_cursor for
         select VALUE(p) from table(DBMS_SQLTUNE.SELECT_WORKLOAD_REPOSITORY
			( &begin_snap,  -- begin_snap
                    &end_snap,  -- end_snap
		    'executions > 1 and disk_reads > 100',NULL,'disk_reads')) p;
       DBMS_SQLTUNE.LOAD_SQLSET('&sqlset_name', baseline_ref_cursor);
     end;
/
