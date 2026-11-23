declare
   l_count number;
begin
for i in 1..100
loop
select 1 into l_count from dual where 1=2;
end loop;
end;
/

