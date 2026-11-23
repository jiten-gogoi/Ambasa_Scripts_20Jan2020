begin
for i in 1..1000000000
loop
execute immediate 'select /*+ use_nl(t1 t2) */ count(*)  from ambasa_sql_profile_test1 t1, ambasa_sql_profile_test2 t2 where t1.c1=t2.c1';
end loop;
end;
/

