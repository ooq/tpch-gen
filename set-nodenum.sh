#!/bin/bash

# TODO: make sure you have set up dn.txt with your DataNode hostnames, 1 per line

n=1
cp ~/spark/conf/slaves dn.txt
cat dn.txt | while read h
do 
  echo "$h = $n"
  ssh $h "echo export NODENUM=${n} > /mnt/my-tpch-kit/nodenum.sh" < /dev/null
  ((n=n+1))
done
