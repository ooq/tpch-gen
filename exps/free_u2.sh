declare -A size
size[customer]=4
size[orders]=16
size[partsupp]=8
size[part]=4
for t in partsupp part
do
  n=${size[$t]}
  for i in $(seq 1 $n);
do
  name=${t}.tbl.${i}
  echo /root/tachyon/bin/tachyon tfs free /tpch30/${t}/${name}
  /root/tachyon/bin/tachyon tfs free /tpch30/${t}/${name}

done
done

