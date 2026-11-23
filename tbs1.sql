col tablespace format A16
SELECT /* + RULE */ df.tablespace_name "Tablespace",
df.bytes / (1024 * 1024) "Size (MB)",
SUM(fs.bytes) / (1024 * 1024) "Free (MB)",
df.bytes / (1024 * 1024) - SUM(fs.bytes) / (1024 * 1024) "Used (MB)",
Nvl(Round(SUM(fs.bytes) * 100 / df.bytes),1) "% Free",
Round((df.bytes - SUM(fs.bytes)) * 100 / df.bytes) "% Used"
FROM dba_free_space fs,
(SELECT tablespace_name,SUM(bytes) bytes
FROM dba_data_files
GROUP BY tablespace_name) df
WHERE fs.tablespace_name (+) = df.tablespace_name
GROUP BY df.tablespace_name,df.bytes
Order by 4;

