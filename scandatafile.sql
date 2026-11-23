set serveroutput on 
declare 
  scn number(12) := 0; 
  scnmax number(12) := 0; 
begin 
  for f in (select * from v$datafile) loop 
    scn := dbms_backup_restore.scandatafile(f.file#); 
    dbms_output.put_line('File ' || f.file# ||' absolute fuzzy scn = ' || scn); 
    if scn > scnmax then scnmax := scn; end if; 
  end loop; 

  dbms_output.put_line('Minimum PITR SCN = ' || scnmax); 
end;
/
