drop table ambasa_blocktest purge;
create table ambasa_blocktest(eno number,ename varchar2(10),sal number);
insert into ambasa_blocktest values(1,'A',10000);
insert into ambasa_blocktest values(1,'b',20000);
commit;


