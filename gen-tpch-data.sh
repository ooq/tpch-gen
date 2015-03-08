#!/bin/bash
 #
 #-T c   -- generate cutomers ONLY
 #-T l   -- generate nation/region ONLY
 #-T L   -- generate lineitem ONLY
 #-T n   -- generate nation ONLY
 #-T o   -- generate orders/lineitem ONLY
 #-T O   -- generate orders ONLY
 #-T p   -- generate parts/partsupp ONLY
 #-T P   -- generate parts ONLY
 #-T r   -- generate region ONLY
 #-T s   -- generate suppliers ONLY
 #-T S   -- generate partsupp ONLY
# find out what our node number is
source nodenum.sh
declare -A cmap
cmap[customer]=c
cmap[lineitem]=L
cmap[nation]=n
cmap[orders]=O
cmap[partsupp]=S
cmap[part]=P
cmap[region]=r
cmap[supplier]=s
declare -A counts
counts[customer]=1
counts[lineitem]=20
counts[nation]=1
counts[orders]=4
counts[partsupp]=2
counts[part]=1
counts[region]=1
counts[supplier]=1

export TPCH_ROOT=/mnt/my-tpch-kit/tpch-dbgen
export TPCH_SCALE_FACTOR=30

#for t in customer lineitem nation orders partsupp part region supplier 
for t in customer lineitem orders partsupp part 
do
table=${cmap[$t]}
count=${counts[$t]}
DSDGEN_TOTAL_THREADS=$((count * 4))
start=(NODENUM-1)*$count+1
for (( c=$start; c<($count+$start); c++ ))
do
  echo "Generating part $c of ${DSDGEN_TOTAL_THREADS}"
   ${TPCH_ROOT}/dbgen \
    -T ${table} \
    -s ${TPCH_SCALE_FACTOR} \
    -S $c \
    -C ${DSDGEN_TOTAL_THREADS} \
    -b ${TPCH_ROOT}/dists.dss  \
    -f &&\
    #/root/tachyon/bin/tachyon tfs rm ${FLATFILE_HDFS_ROOT}/${t}/${t}_${c}_${DSDGEN_TOTAL_THREADS}.dat &&\
    /root/tachyon/bin/tachyon tfs copyFromLocal ./${t}.tbl.${c} /tpch${TPCH_SCALE_FACTOR}/${t}/${t}.tbl.${c} &
done
done
wait
