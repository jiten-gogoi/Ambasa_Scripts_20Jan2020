set serveroutput on
declare
v_int pls_integer;
begin
v_int := dbms_spm.load_plans_from_sqlset (
sqlset_name => '&sqlset_name',
sqlset_owner => '&sqlset_owner',
basic_filter => q'#sql_id='&sql_id' and plan_hash_value =&plan_hash#',
fixed => 'NO',
enabled => 'NO');
DBMS_OUTPUT.PUT_line(v_int);
end;
/
