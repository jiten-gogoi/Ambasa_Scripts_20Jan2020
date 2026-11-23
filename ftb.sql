declare  
v_txid xid_array;
begin 
v_txid:=sys.xid_array('&xid');
 dbms_flashback.transaction_backout(1,v_txid,dbms_flashback.cascade);
commit;
END;
/
