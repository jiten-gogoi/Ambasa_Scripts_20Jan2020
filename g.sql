begin
dbms_stats.gather_table_stats('AMBASA','&TABLE_NAME');
end;
/
l
