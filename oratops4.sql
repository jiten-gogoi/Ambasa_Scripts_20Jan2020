set sqlbl on
set lines 200
SELECT
              id, sid, pid, usr, prog, modl, actn,
              pgau, pgac, pgaf,
              pgax, opn, bses, bsi, st4, su4, ev4, wc4,
              siw, lcet                   FROM

              (
              select
              NVL(s.inst_id,-1)
              id,
              substr(to_char(NVL(s.sid,-1)),1,5)
              sid,             substr(NVL(p.spid,'-1
              '),1,5)                           pid,
              decode(s.username,NULL,'B/G', s.username)
              usr,             decode(p.pname,NULL,
              s.server,p.pname)                   prog,
              decode(s.module,NULL,' ', s.module)
              modl,             decode(s.action,NULL,'
              ', s.action)                      actn,
              NVL(p.PGA_USED_MEM, 0)
              pgau,
              NVL(p.PGA_ALLOC_MEM, 0)
              pgac,
              NVL(p.PGA_FREEABLE_MEM, 0)
              pgaf,             NVL(x.pgax, -1)
              pgax,
              substr(decode(a.action,0,'   ',
              a.name),1,3)              opn,
              NVL(s.FINAL_BLOCKING_SESSION, -1)
              bses,
              substr(decode(s.FINAL_BLOCKING_SESSION,
              NULL, NVL(s.SQL_ID, '              ')
              ,
              to_char(s.FINAL_BLOCKING_INSTANCE)||':'||
              to_char(s.FINAL_BLOCKING_SESSION) ||':'||
              (select NVL(BLOCKER_OSID,'-1   ')
              from v$WAIT_CHAINS
              where BLOCKER_SID =
              s.FINAL_BLOCKING_SESSION
              and BLOCKER_INSTANCE =
              s.FINAL_BLOCKING_INSTANCE
              and ROWNUM < 2)),1,14)
              bsi,             substr(NVL(s.status,'
              '),1,6)                        st4,
              substr(decode(s.state,'WAITING',
              decode(s.wait_class, 'User I/O', 'I/O',
              s.state),'CPU'),1,3)
              su4,
              decode(s.state,'WAITING', s.event,'wa for
              cpu')           ev4,
              substr(NVL(s.wait_class,'CPU      '),1,5)
              wc4,
              NVL(s.WAIT_TIME_MICRO,-1)
              siw,             NVL(s.last_call_et, -1)
              lcet              from GV$SESSION s,
              GV$PROCESS p,
              sys.AUDIT_ACTIONS a,
              (select inst_id, NVL(MAX(PGA_MAX_MEM), 0)
              pgax                              from
              GV$PROCESS group by inst_id) x
              where s.wait_class <> 'Idle'
              and a.action = s.command
              and s.paddr =p.addr (+)
              and s.inst_id=p.inst_id (+)
              and x.inst_id=p.inst_id
              )
              order by siw desc
;
