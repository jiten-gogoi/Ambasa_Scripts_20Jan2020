set long 1000000;
set longchunksize 1000;
set feedback off;
set veri off;

-- Get the sql statement to tune

prompt
prompt 10 Most expensive SQL in the cursor cache
prompt ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

column elapsed format 99,990.90;
variable newl varchar2(64);

begin
  :newl := '
';
end;
/

select * from (
 select sql_id, elapsed_time / 1000000 as elapsed, SUBSTRB(REPLACE(sql_text,:newl,' '),1,55) as sql_text_fragment
 from   V$SQLSTATS
 order by elapsed_time desc
) where ROWNUM <= 10;
undefine sqlid;
set feedback on;
set veri on;

