set echo on
begin
 dbms_workload_repository.modify_snapshot_settings(interval => 15,retention => 30*60*24);
end;
/
set echo off
