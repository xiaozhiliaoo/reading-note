# Partitioning&Sharding


分区是将大数据集拆分成小数据集的方法，拆分会带来两个问题，1 是寻找到分区信息Routing 2 是增减节点时候Rebalance分区

https://en.wikipedia.org/wiki/Shard_(database_architecture)

https://en.wikipedia.org/wiki/Partition_(database)

partition:hazelcast,kafka
shard:MongoDB,ES,Solr
region:Hbase,TiKV
tablet:Bigtable
vnode:Cassandra,Riak
vBucket(virtual buckets):Couchbase
slot:Redis
ShardRegion:akka


## System

Memcached

Redis:https://redis.io/topics/partitioning
https://redis.io/topics/cluster-tutorial

Cassandra https://docs.datastax.com/en/cassandra-oss/3.0/cassandra/architecture/archDataDistributeAbout.html
https://cassandra.apache.org/doc/latest/cassandra/architecture/dynamo.html#dataset-partitioning-consistent-hashing


DynamoDB

Google Spanner

Shardingsphere

rethinkdb：https://rethinkdb.com/docs/architecture

HBase：https://hbase.apache.org/book.html#manual_region_splitting_decisions
https://hbase.apache.org/book.html#regions.arch

BigTable：

MongoDB：https://docs.mongodb.com/manual/sharding/

voldemort: https://www.project-voldemort.com/voldemort/rebalance.html
https://www.project-voldemort.com/voldemort/design.html

Couchbase: https://docs.couchdb.org/en/stable/partitioned-dbs/index.html

MySQL:https://dev.mysql.com/doc/refman/8.0/en/partitioning.html

Riak:

voltdb：https://docs.voltdb.com/UsingVoltDB/IntroHowVoltDBWorks.php

HDFS:https://blog.cloudera.com/partition-management-in-hadoop/

Ketama
https://www.metabrew.com/article/libketama-consistent-hashing-algo-memcached-clients



## Request Routing

service discovery

https://helix.apache.org/

https://docs.mongodb.com/manual/core/sharded-cluster-config-servers/

https://github.com/couchbase/moxi




## Rebalancing(Split&Merge)