set lines 200 pages 100
col name for a40
select a.ksppinm name, b.ksppstvl value from x$ksppi a, x$ksppcv b where a.indx = b.indx and upper(a.ksppinm) like '%'||upper(nvl('&ksppinm',ksppinm))||'%'
and a.ksppinm not like '%from x$ksppi where ksppinm like nvl(%';
