SELECT s.inst_id, s.sid, s.serial#, p.spid, s.username, s.program, p.pga_used_mem FROM gv$session s JOIN gv$process p ON p.addr = s.paddr AND p.inst_id = s.inst_id WHERE s.type != 'BACKGROUND' and s.program not like '%(P%' and
order by s.inst_id, s.sid, s.serial#;

