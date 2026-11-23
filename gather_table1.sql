begin
dbms_stats.gather_table_stats('&owner','&table_name',no_invalidate => false,cascade=>true);
end;
/

