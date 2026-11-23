set pagesize 0 long 30000000 longchunksize 1000
select dbms_workload_capture.report(&IDFromabovequery,'TEXT') from dual;
