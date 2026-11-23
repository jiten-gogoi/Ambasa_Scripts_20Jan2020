---switch on seed column usage for 60 seconds
begin
dbms_stats.seed_col_usage(null,null,60);
end;
/

