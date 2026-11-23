select  count(*) as "OPEN CURSORS", user_name from v$open_cursor group by user_name order by count(*) desc;
