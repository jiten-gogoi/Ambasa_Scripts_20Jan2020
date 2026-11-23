select version,regexp_replace(version,'\..*') Version_Number, regexp_substr(version,'[0-9]+',1,2) Release_Number from v$instance;
l
