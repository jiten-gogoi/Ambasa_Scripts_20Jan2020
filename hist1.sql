SELECT endpoint_value, endpoint_number,
endpoint_number - lag(endpoint_number,1,0)
OVER (ORDER BY endpoint_number) AS frequency
FROM dba_tab_histograms
WHERE upper(owner)=&'owner' and table_name = '&table_name'
AND column_name = '&column_name'
ORDER BY endpoint_number;
