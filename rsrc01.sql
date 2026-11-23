col username for a12
col module for a10 trunc
col state for a20
col "QC SID" for 9999
col SID for 9999
col "QC/Slave" for A10
col "ReqDOP" for 999
col "ActDOP" for 999
col "slave set" for  A10
col event for a25 trunc
col action for a20 trunc
col p1text for a20 trunc
col secwait for 99999
col state for a10 trunc
col object for a25 trunc
col command for a15 trunc
set pages 300  lines 300
select
     s.inst_id,
     decode(px.qcinst_id,NULL,s.username,
           ' - '||lower(substr(s.program,length(s.program)-4,4) ) ) "Username",
     decode(px.qcinst_id,NULL, 'QC', '(Slave)') "QC/Slave" ,
     to_char( px.server_set) "Slave Set",
     to_char(s.sid) "SID",
     decode(px.qcinst_id, NULL ,to_char(s.sid) ,px.qcsid) "QC SID",
     px.req_degree "Requested DOP",
    px.degree "Actual DOP",s.module,s.sql_id,s.event,s.status
  from
    gv$px_session px,
    gv$session s
  where
    px.sid=s.sid (+) and
    px.serial#=s.serial# and
    px.inst_id = s.inst_id
 order by 2 desc;
