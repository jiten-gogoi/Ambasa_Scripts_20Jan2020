select pu.unit_name, pd.line#, pd.total_time / 1000000000 total_time,
us.text text
from plsql_profiler_data pd, plsql_profiler_units pu, user_source us
where pd.runid = &rpt_runid
and pd.unit_number = &rpt_unitid
and pd.runid = pu.runid
and pd.unit_number = pu.unit_number
and us.name = pu.unit_name
and us.line = pd.line#
and us.type in ('PACKAGE BODY','PROCEDURE','FUNCTION');

