ALTER SYSTEM SET RESOURCE_MANAGER_PLAN ='';
begin
sys.dbms_resource_manager.clear_pending_area();
sys.dbms_resource_manager.create_pending_area();
sys.dbms_resource_manager.delete_plan_cascade ('CPU_IO_LIMIT');
sys.dbms_resource_manager.submit_pending_area();
end;
/
