select thread#,max(sequence#) from gv$archived_log where applied='YES' group by thread#;
l
