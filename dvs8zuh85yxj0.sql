old   6: sql_id='&&sql_id'
new   6: sql_id='dvs8zuh85yxj0'
old   7: and child_number = &&child_no
new   7: and child_number = 0
old   9: sql_id='&&sql_id'
new   9: sql_id='dvs8zuh85yxj0'
old  10: and child_number = &&child_no
new  10: and child_number = 0

variable SYS_B_0 NUMBER

begin
old  26: sql_id like nvl('&&sql_id',sql_id)
new  26: sql_id like nvl('dvs8zuh85yxj0',sql_id)
old  27: and child_number = &&child_no
new  27: and child_number = 0
case when bind_type in (1,12) then '''' else null end || ';'
                       *
ERROR at line 10:
ORA-00904: "ENKITEC"."DISPLAY_RAW": invalid identifier



end;

/
old   1: select regexp_replace(sql_fulltext,'(select |SELECT )','select /* test &&sql_id */ ',1,1) sql_fulltext from (
new   1: select regexp_replace(sql_fulltext,'(select |SELECT )','select /* test dvs8zuh85yxj0 */ ',1,1) sql_fulltext from (
old   4: where sql_id = '&&sql_id')
new   4: where sql_id = 'dvs8zuh85yxj0')

select /* test dvs8zuh85yxj0 */ * from ambasa.dept_test where deptno=:"SYS_B_0";
