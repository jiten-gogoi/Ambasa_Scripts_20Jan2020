SELECT name,first_usage_date,last_usage_date, description FROM dba_feature_usage_statistics
where last_usage_date is not null order by 1;
