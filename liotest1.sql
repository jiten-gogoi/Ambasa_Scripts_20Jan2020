select
    /*+ monitor
        ordered 
        use_nl(b) use_nl(c) use_nl(d) 
        full(a) full(b) full(c) full(d) */
    count(*)
from
    sys.obj$ a,
    sys.obj$ b,
    sys.obj$ c,
    sys.obj$ d
where
    a.owner# = b.owner#
and b.owner# = c.owner#
and c.owner# = d.owner#
and rownum <= &1
/
