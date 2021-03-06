drop table if exists s3customer;
create external table s3customer (C_CUSTKEY INT,
 C_NAME STRING,
 C_ADDRESS STRING,
 C_NATIONKEY INT,
 C_PHONE STRING,
 C_ACCTBAL DOUBLE,
 C_MKTSEGMENT STRING,
 C_COMMENT STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' STORED AS TEXTFILE
LOCATION 's3n://tachyon-qifan/tpch/tachyon/data/';

