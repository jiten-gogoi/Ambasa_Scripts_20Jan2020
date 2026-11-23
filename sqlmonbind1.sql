select xmltype(binds_xml) from v$sql_monitor where sql_id = '&sql_id';
