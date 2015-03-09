#!/bin/bash

# TODO: make sure you have set up dn.txt with your DataNode hostnames, 1 per line
cp ~/spark/conf/slaves dn.txt
for t in customer
#for t in orders partsupp part lineitem
do
cat dn.txt | while read h
do 
  ssh $h "cd /mnt/my-tpch-kit; ./gen-tpch-data-hdfs.sh $t" < /dev/null &
done
done
wait
