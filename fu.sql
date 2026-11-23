select substr(name,1,37) name,
version,
currently_used,
first_usage_date,
last_usage_date,
detected_usages
from dba_feature_usage_statistics
where first_usage_date is null
/
l
