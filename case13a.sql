drop table test13 purge;
create table test13(eno number,ename varchar2(10));
insert into test13 values(1,'A');
insert into test13 values(2,'B');
commit;
update test13 set ename='X' where eno=1;
