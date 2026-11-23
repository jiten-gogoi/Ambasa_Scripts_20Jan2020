drop table ambasa_test1 purge;
drop table ambasa_test2 purge;
create table ambasa_test1 as select * from dba_objects;
create table ambasa_test2 as select * from ambasa_test1;
exit;

