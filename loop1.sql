begin
for i in 1..100
loop
execute immediate 'select 1 from dual where 1=2';
end loop;
end;
/
