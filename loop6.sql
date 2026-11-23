begin
for i in 1 .. 100
loop
execute immediate 'insert into ambasa_test_parse values( :x )' using i;
end loop;
end;
/

