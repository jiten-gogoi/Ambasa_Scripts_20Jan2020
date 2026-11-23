set echo on
select * from v$pq_sesstat;
select count(*)
from (select /*+ parallel(oi,100) */ product_id,sum(unit_price*quantity)
from oe.order_items oi
group by product_id);
select * from v$pq_sesstat;
