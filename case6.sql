drop table ambasa_tab1;
create table ambasa_tab1 (ambasa_tab1_col number);
begin
for i in 1..1000000
loop
insert into ambasa_tab1 values (i);
end loop;
end;
/
