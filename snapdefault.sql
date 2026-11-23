set echo on
begin
 dbms_workload_repository.modify_snapshot_settings(interval => 60,retention => 8*60*24);
end;
/
set echo off

