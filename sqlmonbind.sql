select xmltype(binds_xml) from v$sql_monitor where sid = &sid and status = 'EXECUTING';
