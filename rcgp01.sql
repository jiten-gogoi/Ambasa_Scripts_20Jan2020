show parameter RESOURCE_MANAGER_PLAN

ALTER SYSTEM SET RESOURCE_MANAGER_PLAN ='';
begin
sys.dbms_resource_manager.clear_pending_area();
sys.dbms_resource_manager.create_pending_area();
sys.dbms_resource_manager.delete_plan_cascade ('CPU_IO_LIMIT');
sys.dbms_resource_manager.submit_pending_area();
end;
/


begin
sys.dbms_resource_manager.clear_pending_area();
sys.dbms_resource_manager.create_pending_area();
sys.dbms_resource_manager.create_consumer_group(CONSUMER_GROUP=>'CPU_IO_LIMIT_GRP',
COMMENT=>'Consumer group for AMBASA to limit parallelism,I/O and CPU Time');
sys.dbms_resource_manager.set_consumer_group_mapping(attribute => DBMS_RESOURCE_MANAGER.ORACLE_USER,
value => 'AMBASA',consumer_group =>'CPU_IO_LIMIT_GRP');

-- Create resource plan:
sys.dbms_resource_manager.create_plan(PLAN=> 'CPU_IO_LIMIT',COMMENT=>'Cancel Sql plan for AMBASA');

--Need to create plan_directive
--Limiting parallelism to max 4, I/O Limit to 20MB and CPU_time to 120 sec

sys.dbms_resource_manager.create_plan_directive(
PLAN=> 'CPU_IO_LIMIT',
GROUP_OR_SUBPLAN=>'CPU_IO_LIMIT_GRP',
COMMENT=>'Kill statement after exceeding 120 sec , limit parallelism to max 4 and limit i/o to 20M ',
PARALLEL_DEGREE_LIMIT_P1 => 4,
SWITCH_GROUP=>'CANCEL_SQL',
SWITCH_TIME=>120,
SWITCH_IO_MEGABYTES=>20,
SWITCH_ESTIMATE=>false
);

--Its compulsory to specify directive for OTHER_GROUPS else this will fail
dbms_resource_manager.create_plan_directive(PLAN=> 'CPU_IO_LIMIT',GROUP_OR_SUBPLAN=>'OTHER_GROUPS',CPU_P1=>100);
sys.dbms_resource_manager.validate_pending_area;
sys.dbms_resource_manager.submit_pending_area;
end;
/

--Grant AMBASA to switch group
exec dbms_resource_manager_privs.grant_switch_consumer_group('AMBASA','CPU_IO_LIMIT_GRP',false);

--Set initial group for AMBASA to CPU_IO_LIMIT_GRP

exec dbms_resource_manager.set_initial_consumer_group('AMBASA','CPU_IO_LIMIT_GRP');

--To enable resource manager plan
show parameter RESOURCE_MANAGER_PLAN

ALTER SYSTEM SET RESOURCE_MANAGER_PLAN ='CPU_IO_LIMIT';

show parameter RESOURCE_MANAGER_PLAN

@sqlmonstarte
@rsrc3
