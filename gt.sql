exec dbms_stats.gather_table_stats(user, '&table_name', no_invalidate=>false);
