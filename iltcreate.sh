drop table itltest purge;
create table itltest (col1 number, col2 varchar2(200));

begin
   for i in 1..1000 loop
           insert into itltest values (
                   i,'INITIAL VALUE OF COLUMN');
   end loop;
commit;
end;
/
set sqlbl on
 select
    dbms_rowid.rowid_relative_fno(rowid) File#,
    dbms_rowid.rowid_block_number(rowid) Block#,
    count(1)
 from itltest
 group by
    dbms_rowid.rowid_relative_fno(rowid),
    dbms_rowid.rowid_block_number(rowid)
 order by 2,3
 /


select min(col1), max(col1)
 from itltest
 where dbms_rowid.rowid_block_number(rowid) = &blockno
 /
