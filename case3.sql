create or replace procedure procself_deadlock as 
begin
	execute immediate 'alter procedure procself_deadlock compile';
end;
/
execute procself_deadlock;
