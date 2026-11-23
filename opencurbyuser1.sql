select  sql_id,sql_text, count(*) as "OPEN CURSORS", user_name from v$open_cursor
group by sql_id,sql_text, user_name having user_name=upper('&user_name') order by count(*) desc;
 
