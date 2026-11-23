set lines 200
select profile,resource_name,limit from dba_profiles where profile='&profile_name';
l
