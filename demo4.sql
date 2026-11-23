drop table muse;
create table muse (id number, muse_date date, name varchar2(10));

 declare
 v_count  number;
 begin
 v_count:=0;
 for i in 1..1830 loop
    for j in 1..1000 loop
    v_count:= v_count+1;
    insert into muse values (v_count, sysdate-i, 'MUSE');
    end loop;
 end loop;
 commit;
 end;
 /

exec dbms_stats.gather_table_stats(ownname=>'AMBASA', tabname=>'MUSE', cascade=>true, estimate_percent=>null, method_opt=>'FOR ALL COLUMNS SIZE 1');


set autot trace

select * from muse where muse_date > sysdate - 365;

set autot off


declare
v_count  number;
begin
v_count:=1830000;
for i in 1..365 loop
   for j in 1..1000 loop
   v_count:= v_count+1;
   insert into muse values (v_count, sysdate+i, 'MUSE');
   end loop;
end loop;
commit;
end;
/


set autot trace

select * from muse where muse_date > (sysdate+365) - 365;

set autot off

exec dbms_stats.gather_table_stats(ownname=>'AMBASA', tabname=>'MUSE', cascade=>true, estimate_percent=>null, method_opt=>'FOR ALL COLUMNS SIZE 1');


set autot trace

select * from muse where muse_date > (sysdate+365) - 365;

set autot off
