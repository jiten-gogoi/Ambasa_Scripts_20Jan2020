begin
for i in 1..1000000000
loop
execute immediate 'select * from ambasa.ambasa_test2';
end loop;
end;
/

