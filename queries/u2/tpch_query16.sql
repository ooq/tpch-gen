drop view if exists tempkey;
create view tempkey
as select
s_suppkey tem_suppkey
from supplier
where s_comment not like '%Customer%Complaints%'
group by s_suppkey;

select
	p_brand,
	p_type,
	p_size,
	count(distinct ps_suppkey) as supplier_cnt
from
	partsupp,
	part,
  tempkey
where
	p_partkey = ps_partkey
	and p_brand <> 'Brand#34'
	and p_type not like 'ECONOMY BRUSHED%'
	and p_size in (22, 14, 27, 49, 21, 33, 35, 28)
  and ps_suppkey = tem_suppkey
group by
	p_brand,
	p_type,
	p_size
order by
	supplier_cnt desc,
	p_brand,
	p_type,
	p_size;
