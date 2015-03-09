declare -A size
size[customer]=4
size[orders]=16
for t in customer
do
  n=${size[$t]}
  for i in $(seq 1 $n);
do
  name=${t}.tbl.${i}
  echo /root/tachyon/bin/tachyon tfs free /tpch30/${t}/${name}
  /root/tachyon/bin/tachyon tfs free /tpch30/${t}/${name}

done
done

