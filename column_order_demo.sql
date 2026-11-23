set echo on lines 200 pages 1000
drop table ambasa_test_column_order purge;

create table ambasa_test_column_order (C1 varchar2(10), C2 varchar2(10), C3 varchar2(3));

begin
 for i in 1.. 100000
 loop
 insert into ambasa_test_column_order values (i,i,'AAA');
 end loop;
 insert into ambasa_test_column_order values ('100001','100001','BBB');
 insert into ambasa_test_column_order values ('100001','100001','CCC');
 insert into ambasa_test_column_order values ('100001','100001','DDD');
commit;
 end;
/

pause
select count(*) from ambasa_test_column_order where C1 < 2;
pause
select count(*) from ambasa_test_column_order where C2 > 1;
pause
select * from ambasa_test_column_order where C2 > 1 and C1 < 2;
pause
select * from ambasa_test_column_order where C1 < 2 and C2 > 1;
pause
select count(*) from ambasa_test_column_order where C1 > 1 and C2=100001;
pause
select count(*) from ambasa_test_column_order where C2=100001 and C1 > 1;
pause
select count(*) from ambasa_test_column_order where C1 > 1;
pause
select count(*) from ambasa_test_column_order where C2=100001;
-- select count(*) from ambasa_test_column_order where
@fsqlfcio1
-- select count(*) from ambasa_test_column_order where
