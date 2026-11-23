set lines 200 pages 100
col name for a40
col description for a50
col value for a20
select a.ksppinm name,a.ksppdesc description, b.ksppstvl value from x$ksppi a, x$ksppcv b where a.indx = b.indx and upper(a.ksppinm) like '%'||upper(nvl('&ksppinm',ksppinm))||'%' and a.ksppinm not like '%from x$ksppi where ksppinm like nvl(%';
