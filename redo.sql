set lines 200
col member for a45
col status for a10
select * from v$Loghist order by sequence# ;
SELECT L.GROUP#,L.STATUS, MEMBER, SEQUENCE#, FIRST_CHANGE#,NEXT_CHANGE#
FROM V$LOG L, V$LOGFILE LF 
WHERE L.GROUP# = LF.GROUP# order by SEQUENCE#;

