
create table scott.emp12 ( eno number,description varchar2(20));

PAUSE

create or replace procedure proc_inst(i IN number := 0)
AS
begin
for i IN 1..100 loop
 if mod(i,2) = 0 then
    insert into scott.emp12 values(i,'i is even');
 else 
    insert into scott.emp12 values(i,'i is odd');  
 end if;
commit;
end loop;
end;
/

--exec proc_inst(0);
PAUSE

col owner for a10
col object_name for a15
col object_type for a12
col status for a10
set lines 200
select owner,object_name,object_type,status from dba_objects where owner='SYS'
and object_name='PROC_INST';

PAUSE
select OWNER,job_name,enabled from  dba_scheduler_jobs where owner='SYS';

PAUSE
select count(*) from scott.emp12;

PAUSE
truncate table scott.emp12;

PAUSE
select count(*) from scott.emp12;

PAUSE
BEGIN
sys.dbms_scheduler.create_job( 
job_name => '"SYS"."SCOTT_EMP12"',
job_type => 'STORED_PROCEDURE',
job_action => '"SYS"."PROC_INST"',
start_date => systimestamp at time zone 'Asia/Calcutta',
job_class => '"DEFAULT_JOB_CLASS"',
auto_drop => FALSE,
number_of_arguments => 1,
enabled => FALSE);
sys.dbms_scheduler.set_attribute( name => '"SYS"."SCOTT_EMP12"', attribute => 'raise_events', value => dbms_scheduler.job_started + dbms_scheduler.job_succeeded + dbms_scheduler.job_failed); 
sys.dbms_scheduler.set_job_argument_value( job_name => '"SYS"."SCOTT_EMP12"', argument_position => 1, argument_value => ''); 
sys.dbms_scheduler.enable( '"SYS"."SCOTT_EMP12"' ); 
END;
/
PAUSE


select count(*) from scott.emp12;

PAUSE

set lines 200
set owner for a10
set sqlbl on


select   t.OWNER,
t.job_name,t.STATUS,
t.ACTUAL_START_DATE,
t.ADDITIONAL_INFO
from dba_scheduler_job_run_details t
where  t.job_name like 'SCOTT_EMP12%' order by  t.ACTUAL_START_DATE;
PAUSE
select systimestamp from dual;
PAUSE
col REPEAT_INTERVAL for a12
select repeat_interval, next_run_date,job_name from dba_scheduler_jobs
where job_name = 'SCOTT_EMP12';
PAUSE
select log_id, log_date,status from  DBA_SCHEDULER_JOB_LOG where
job_name = 'SCOTT_EMP12' order by log_date desc ;

PAUSE

-- *********************BackOut****************************
PAUSE
drop table scott.emp12 purge;
drop procedure proc_inst;
pause
PAUSE
--Dropping Jobs;
---------------

BEGIN
  DBMS_SCHEDULER.drop_job (job_name => 'SCOTT_EMP12');
END;
/

