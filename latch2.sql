col name format A35
select name, latch# , count(*) from v$latch_children group by name, latch#
having count(*) >1 order by 1;
l
