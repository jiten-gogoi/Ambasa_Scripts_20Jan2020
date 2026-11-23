column value format 999,999,999
select name,to_number(value) value from v$parameter where name in
('open_cursors','session_cached_cursors');
