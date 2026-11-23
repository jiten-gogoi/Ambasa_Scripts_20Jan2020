*/

accept ls_obj_name prompt "Enter the exact object name:  " ;

select  ao.object_type || '  '  || ao.OWNER || '.' ||
        ao.OBJECT_NAME  as object
, max (pd.OBJECT_ID) as object_id
from  dba_objects  ao
join PUBLIC_DEPENDENCY pd
   on pd.object_id  = ao.object_id
join  all_objects  ao2
   on  ao2.object_id  = pd.REFERENCED_OBJECT_ID
where  ao.OBJECT_NAME = upper(  '&ls_obj_name' )     /* parent */
and  ao2.OWNER not IN ('SYS', 'SYSTEM')
group by ao.object_type || '  '  || ao.OWNER || '.' ||
        ao.OBJECT_NAME
/
accept ls_obj_id prompt "From above, enter the exact object_id:  " ;

select object_name
   || '   '    ||  the_level
   || '   '    ||  object_id
   || '   '    ||  the_rownum
    as  parent_lvl_objid_rownum
from
   (
   select  object_name     as object_name
   , OBJECT_ID
   , the_level
   , min (the_rownum)  as the_rownum
   from
       SELECT     LPAD(' ', 2*(LEVEL-1)) || '  '  ||
       ao.OBJECT_type || '  '  ||  ao.owner || '.' ||
       ao.object_name  || '   ' || ao.OBJECT_ID || '  ' || rownum
                AS THE_TREE
       , LPAD ( ' ', 2*(LEVEL-1) ) || '  '  ||
         ao.OBJECT_type || '  ' ||
         ao.owner ||  '.' ||
         ao.object_name
              as object_name
       , ao.owner ||  '.' || ao.object_name
            as object_name2
       , ao.OBJECT_type
       , ao.OBJECT_ID
       , ao.owner
       , rownum as the_rownum
       , level as the_level
       FROM               PUBLIC_DEPENDENCY   pd
       join         dba_objects  ao
            on    ao.object_id   = pd.object_id
/*       where ao.owner NOT in  ( 'SYS', 'SYSTEM', 'PUBLIC' )    */
       START WITH         pd.OBJECT_ID =  &ls_obj_id
       CONNECT BY PRIOR   pd.REFERENCED_OBJECT_ID = pd.OBJECT_ID
      )
   group by object_name, object_id, the_level
   )
order by the_rownum
/
