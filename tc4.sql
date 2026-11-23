drop table big_table purge;
create table big_table as select * from dba_segments;
insert into big_table select * from big_table;
commit;

begin
for i in 1.. 10 loop insert into big_table select * from big_table; end loop;commit; end;
/
