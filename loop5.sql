drop table ambasa_test_parse purge;
create table ambasa_test_parse (eno number);
begin
for i in 1 .. 100
loop
execute immediate 'insert into ambasa_test_parse values(' || i || ')';
end loop;
commit;
end;
/

