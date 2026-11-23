SELECT * FROM TABLE(DBMS_XPLAN.display_cursor('&&prev_sql_id.',&&prev_child_number,'RUNSTATS_LAST +alias'));
