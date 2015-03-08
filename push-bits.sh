#!/bin/bash

# TODO: make sure you have set up dn.txt with your DataNode hostnames, 1 per line
set -e
cp -r ~/spark/conf/slaves dn.txt
cat dn.txt | while read h
do
  scp -rp /mnt/my-tpch-kit $h:/mnt/
done
