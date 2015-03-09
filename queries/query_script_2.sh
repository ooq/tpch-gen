#/root/spark/bin/beeline -u jdbc:hive2://localhost:10000 -n root -p ignored -f ../create_tables/alltables.sql
for qn in 1 10 12 13
do
  bash free_u1.sh
  echo /root/spark/bin/beeline -u jdbc:hive2://localhost:10000 -n root -p ignored -f tpch_query${qn}.sql
  /root/spark/bin/beeline -u jdbc:hive2://localhost:10000 -n root -p ignored -f tpch_query${qn}.sql > res_query${qn} 2>&1
done
