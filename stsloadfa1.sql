DECLARE
  l_cursor  DBMS_SQLTUNE.sqlset_cursor;
BEGIN
  OPEN l_cursor FOR
    SELECT VALUE(p)
    FROM   TABLE (DBMS_SQLTUNE.select_workload_repository (
                    &begin_snap,  -- begin_snap
                    &end_snap,  -- end_snap
                    NULL, -- basic_filter
                    NULL, -- object_filter
                    NULL, -- ranking_measure1
                    NULL, -- ranking_measure2
                    NULL, -- ranking_measure3
                    NULL, -- result_percentage
                    10)   -- result_limit
                  ) p;

  DBMS_SQLTUNE.load_sqlset (
    sqlset_name     => '&sqlset_name',
    populate_cursor => l_cursor);
END;
/
