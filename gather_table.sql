begin
dbms_stats.gather_table_stats('&owner','&table_name',no_invalidate => false,estimate_percent => 100,cascade=>true);
end;
/
l
