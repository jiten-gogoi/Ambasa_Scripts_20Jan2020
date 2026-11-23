select runid, unit_number, unit_type, unit_owner, unit_name,unit_timestamp from plsql_profiler_units where unit_owner <> '<anonymous>' and runid = &rpt_runid;

