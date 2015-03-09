select
	p_partkey as min_p_partkey,
	min(ps_supplycost) as min_ps_supplycost
from
	part,
	partsupp,
	supplier,
	nation,
	region
where
	p_partkey = ps_partkey
	and s_suppkey = ps_suppkey
	and s_nationkey = n_nationkey
	and n_regionkey = r_regionkey
	and r_name = 'EUROPE'
group by
	p_partkey;

