set serveroutput on 
     DECLARE 
       I NUMBER; 
     BEGIN 
       I := DBMS_FLASHBACK.GET_SYSTEM_CHANGE_NUMBER; 
       DBMS_OUTPUT.PUT_LINE('Start_scn# '||I); 
     END; 
     /
