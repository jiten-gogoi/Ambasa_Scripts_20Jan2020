SELECT
              sum(uct) uct, sum(dct) duser,
              sum(upt) uptm
              from (
              select count(sid) uct, count(distinct
              username) dct, 0 upt                 from
              gv$session where  type='USER'
              union all
              select 0 uct, 0 dct, max(SYSDATE -
              logon_time) * 24 upt
              from   gv$session where SID=1);
