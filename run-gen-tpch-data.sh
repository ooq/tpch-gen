#!/bin/bash

# TODO: make sure you have set up dn.txt with your DataNode hostnames, 1 per line
cp ~/spark/conf/slaves dn.txt
cat dn.txt | while read h
do 
  ssh $h "cd /mnt/my-tpch-kit; ./gen-tpch-data.sh" < /dev/null &
done
wait
