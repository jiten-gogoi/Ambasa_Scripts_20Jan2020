begin for i in 1..1000000 loop execute immediate 'begin dbms_application_info.set_client_info(''mutex'');end;'; end loop; end;
/
