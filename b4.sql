--select * from v$open_cursor where sid=&sid and user_name='&username' order by last_sql_active_time;
--select * from v$open_cursor where sid=&sid and user_name='&username' and cursor_type not like '%LOOKUP CURSOR%' order by last_sql_active_time;
select * from v$open_cursor where sid=&sid and user_name='&username' and cursor_type='OPEN' order by last_sql_active_time;
