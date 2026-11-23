for i in 1 2 3 4
do
echo 
echo Ambasa Query Running $i ....
echo 
sqlplus -s ambasa/a <<AEOF
set timing on pages 1000 lines 200
@t1.sql
AEOF
done
