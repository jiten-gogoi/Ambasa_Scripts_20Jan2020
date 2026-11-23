SELECT
        TO_CHAR (
            sample_time
            ,'YYYY-MM-DD HH24'
        ) || ':00' sample_hour
        ,sql_id
        ,sql_plan_hash_value
        ,COUNT (*) * 10 seconds
        ,ROUND (
            COUNT (*) * 10 / 3600
            ,2
        ) AAS
        ,COUNT (
            DISTINCT sql_exec_start || sql_exec_id
        ) sampled_execs
    FROM
        dba_hist_active_sess_history
    WHERE
        dbid = : dbid --
        AND instance_number = : inst_id
        AND sample_time BETWEEN TO_DATE (
            '2016-11-16 07:28'
            ,'YYYY-MM-DD HH24:MI:SS'
        ) AND TO_DATE (
            '2016-11-16 08:28'
            ,'YYYY-MM-DD HH24:MI:SS'
        )
        AND sql_id LIKE '%'
    GROUP BY
        TO_CHAR (
            sample_time
            ,'YYYY-MM-DD HH24'
        ) || ':00'
        ,sql_id
        ,sql_plan_hash_value
    ORDER BY
        sample_hour
        ,sql_id
;
