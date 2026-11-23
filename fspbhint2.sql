select a.name, b.comp_data
from sys.sqlobj$ a, sys.sqlobj$data b
where a.signature = b.signature and a.plan_id = b.plan_id
and a.obj_type = b.obj_type and a.category = b.category;
