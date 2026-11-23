col version for a10
col name for a30
col class for a20
col sql_feature for a20
set lines 200
--Oracle 8i

select NAME,CLASS,SQL_FEATURE from v$sql_hint where VERSION LIKE '8%';

--Oracle 9i
select NAME,CLASS,SQL_FEATURE from v$sql_hint where VERSION LIKE '9%';


--Oracle 10gR1
select NAME,CLASS,SQL_FEATURE from v$sql_hint where VERSION LIKE '10.1%';


--Oracle 10gR2
select NAME,CLASS,SQL_FEATURE,VERSION from v$sql_hint where VERSION LIKE '10.2%' order by 4;

--Oracle 11gR1
select NAME,CLASS,SQL_FEATURE,VERSION from v$sql_hint where VERSION LIKE '11.1%' order by 4;

--Oracle11gR2
select NAME,CLASS,SQL_FEATURE,VERSION from v$sql_hint where VERSION LIKE '11.2%' order by 4;


