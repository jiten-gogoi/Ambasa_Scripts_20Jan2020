
DECLARE 

taskname varchar2(30) := 'SQLACCESS5766221';
task_desc varchar2(256) := 'SQL Access Advisor';
task_or_template varchar2(30) := 'SQLACCESS_EMTASK';
task_id number := 0;
num_found number;
sts_name varchar2(256) := '&sts_name';
sts_owner varchar2(30) := '&sts_owner';

BEGIN
/* Create Task */
dbms_advisor.create_task(DBMS_ADVISOR.SQLACCESS_ADVISOR,task_id,:taskname,:task_desc,:task_or_template);
/* Reset Task */
dbms_advisor.reset_task(:taskname);
/* Delete Previous STS Workload Task Link */
select count(*) into num_found from user_advisor_sqla_wk_map where task_name = :taskname and workload_name = :sts_name;
IF num_found > 0 THEN
dbms_advisor.delete_sts_ref(:taskname, sts_owner, :sts_name);
END IF;
/* Link STS Workload to Task */
dbms_advisor.add_sts_ref(:taskname,sts_owner, :sts_name);
/* Set STS Workload Parameters */
dbms_advisor.set_task_parameter(:taskname,'VALID_ACTION_LIST',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'VALID_MODULE_LIST',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'SQL_LIMIT',DBMS_ADVISOR.ADVISOR_UNLIMITED);
dbms_advisor.set_task_parameter(:taskname,'VALID_USERNAME_LIST',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'VALID_TABLE_LIST',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'INVALID_TABLE_LIST',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'INVALID_ACTION_LIST',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'INVALID_USERNAME_LIST',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'INVALID_MODULE_LIST',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'VALID_SQLSTRING_LIST',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'INVALID_SQLSTRING_LIST','"@!"');
/* Set Task Parameters */
dbms_advisor.set_task_parameter(:taskname,'ANALYSIS_SCOPE','INDEX');
dbms_advisor.set_task_parameter(:taskname,'RANKING_MEASURE','PRIORITY,OPTIMIZER_COST');
dbms_advisor.set_task_parameter(:taskname,'DEF_PARTITION_TABLESPACE',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'TIME_LIMIT',10000);
dbms_advisor.set_task_parameter(:taskname,'MODE','COMPREHENSIVE');
dbms_advisor.set_task_parameter(:taskname,'STORAGE_CHANGE',DBMS_ADVISOR.ADVISOR_UNLIMITED);
dbms_advisor.set_task_parameter(:taskname,'DML_VOLATILITY','TRUE');
dbms_advisor.set_task_parameter(:taskname,'WORKLOAD_SCOPE','PARTIAL');
dbms_advisor.set_task_parameter(:taskname,'DEF_INDEX_TABLESPACE',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'DEF_INDEX_OWNER',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'DEF_MVIEW_TABLESPACE',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'DEF_MVIEW_OWNER',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'DEF_MVLOG_TABLESPACE',DBMS_ADVISOR.ADVISOR_UNUSED);
dbms_advisor.set_task_parameter(:taskname,'CREATION_COST','TRUE');
dbms_advisor.set_task_parameter(:taskname,'JOURNALING','4');
dbms_advisor.set_task_parameter(:taskname,'DAYS_TO_EXPIRE','30');
/* Execute Task */
dbms_advisor.execute_task(:taskname);
END;
/
