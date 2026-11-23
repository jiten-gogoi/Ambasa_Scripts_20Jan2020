drop table itlemp purge;
create table itlemp (col1 number, col2 char(8));
   begin
      for i in 1..10000 loop 
              insert into itlemp values (i,'x');
      end loop;
      commit;
   end;
   /
