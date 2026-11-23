col KSPPINM format a35
col KSPPDESC format a40
col KSPPSTVL format a20
cil KSPPSTDF format a15
set lines 120

select   KSPPINM,
         KSPPDESC,
         nvl(KSPPSTVL,'NULL') KSPPSTVL,
         KSPPSTDF
from     sys.x$ksppi a, sys.x$ksppcv b 
where    a.INDX = b.INDX
order by KSPPINM;

