--Grant AMBASA to switch group
exec dbms_resource_manager_privs.grant_switch_consumer_group('AMBASA','CPU_IO_LIMIT_GRP',false);

--Set initial group for AMBASA to CPU_IO_LIMIT_GRP

exec dbms_resource_manager.set_initial_consumer_group('AMBASA','CPU_IO_LIMIT_GRP');

