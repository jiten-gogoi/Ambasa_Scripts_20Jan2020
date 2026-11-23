begin
sys.dbms_resource_manager.clear_pending_area();
sys.dbms_resource_manager.create_pending_area();
sys.dbms_resource_manager.create_consumer_group(CONSUMER_GROUP=>'CPU_IO_LIMIT_GRP',
COMMENT=>'Consumer group for RO_USER to limit parallelism,I/O and CPU Time');
sys.dbms_resource_manager.set_consumer_group_mapping(attribute => DBMS_RESOURCE_MANAGER.ORACLE_USER,
value => 'RO_USER',consumer_group =>'CPU_IO_LIMIT_GRP');

-- Create resource plan:
sys.dbms_resource_manager.create_plan(PLAN=> 'CPU_IO_LIMIT',COMMENT=>'Cancel Sql plan for RO_USER');

--Need to create plan_directive
--Limiting parallelism to max 4, I/O Limit to 10000Mb and CPU_time to 3600 sec
sys.dbms_resource_manager.create_plan_directive(
PLAN=> 'CPU_IO_LIMIT',
GROUP_OR_SUBPLAN=>'CPU_IO_LIMIT_GRP',
COMMENT=>'Kill statement after exceeding 3600 sec , limit parallelism to max 4 and limit i/o to 20000M ',
PARALLEL_DEGREE_LIMIT_P1 => 4,
SWITCH_GROUP=>'CANCEL_SQL',
SWITCH_TIME=>3600,
SWITCH_IO_MEGABYTES=>20000,
SWITCH_ESTIMATE=>false
);

--Its compulsory to specify directive for OTHER_GROUPS else this will fail
dbms_resource_manager.create_plan_directive(PLAN=> 'CPU_IO_LIMIT',GROUP_OR_SUBPLAN=>'OTHER_GROUPS',CPU_P1=>100);
sys.dbms_resource_manager.validate_pending_area;
sys.dbms_resource_manager.submit_pending_area;
end;
/
