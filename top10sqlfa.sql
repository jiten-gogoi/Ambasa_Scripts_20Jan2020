SET NUMWIDTH 10
SET TAB OFF


set long 1000000;
set longchunksize 1000;
set feedback off;
set veri off;

-- Get the sql statement to tune


column elapsed format 9999999.90;
variable newl varchar2(64);

begin
  :newl := '
';
end;
/


prompt
prompt 10 Most expensive SQL in the workload repository
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

select * from (
 select stat.sql_id as sql_id, sum(elapsed_time_delta) / 1000000 as elapsed, 
     (select to_char(substr(replace(st.sql_text,:newl,' '),1,55)) 
     from dba_hist_sqltext st
     where st.dbid = stat.dbid and st.sql_id = stat.sql_id) as sql_text_fragment
 from dba_hist_sqlstat stat, dba_hist_sqltext text
 where stat.sql_id = text.sql_id and
       stat.dbid   = text.dbid
 group by stat.dbid, stat.sql_id
 order by elapsed desc
) where ROWNUM <= 10;


undefine sqlid;
set feedback on;
set veri on;

