set sqlbl on
set lines 200
select SESSION_ID,NAME,P1,P2,P3,WAIT_TIME,CURRENT_OBJ#,CURRENT_FILE#,CURRENT_BLOCK#
       from v$active_session_history ash, v$event_name enm 
       where ash.event#=enm.event# 
       and SESSION_ID=&SID and SAMPLE_TIME>=(sysdate-&minute/(24*60));
