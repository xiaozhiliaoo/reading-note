# Replication And Consistency(Not Consensus)

在分布式系统中，复制可用来实现Reliable, Scalable. 数据的复制会导致一致性问题。 数据的复制也即同步过程，会带来节点是否可用问题，这也是CAP中的AP权衡。
复制是一项基础技术，而一致性是这项技术带来的问题。可以认为没有复制便没有一致性问题。

Replication in database,kv,document-db,column-db,file system, distributed coordination,Framework

Replication Model https://en.wikipedia.org/wiki/Replication_(computing)

Consistency Model https://en.wikipedia.org/wiki/Consistency_model

Consistency Model https://jepsen.io/consistency

## Database

mysql  https://dev.mysql.com/doc/refman/8.0/en/replication.html

postgresql  https://www.postgresql.org/docs/current/high-availability.html

mariadb https://mariadb.com/kb/en/standard-replication/

## KV store

redis  https://redis.io/topics/replication

etcd https://etcd.io/docs/v3.3/faq/

riak https://docs.riak.com/riak/kv/latest/learn/concepts/replication/index.html

tikv: https://tikv.org/deep-dive/scalability/introduction/

dynamo

consul  https://www.consul.io/docs/architecture

## Document

mongodb https://docs.mongodb.com/manual/replication/

couchdb https://docs.couchdb.org/en/stable/replication/intro.html
https://guide.couchdb.org/editions/1/en/replication.html



## Framework

hazelcast  https://docs.hazelcast.com/imdg/4.2/consistency-and-replication/consistency

akka https://doc.akka.io/docs/akka/current/typed/cluster-concepts.html

## Column DB

cassandra  https://cassandra.apache.org/doc/latest/cassandra/architecture/overview.html

hbase https://hbase.apache.org/book.html#_cluster_replication

## Message

kafka https://kafka.apache.org/documentation/#replication
https://cwiki.apache.org/confluence/display/kafka/kafka+replication

rabbitmq https://www.rabbitmq.com/ha.html

rocketmq https://rocketmq.apache.org/docs/rmq-deployment/

activemq https://activemq.apache.org/clustering

## Search

elasticsearch https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-discovery.html

solr https://solr.apache.org/guide/6_6/index-replication.html

## File System

hdfs https://hadoop.apache.org/docs/r1.2.1/hdfs_design.html#Data+Replication

ceph

GFS

## Coordination

zookeeper: https://zookeeper.apache.org/doc/r3.2.2/zookeeperInternals.html

## Distributed database(newsql)

yugabyte https://docs.yugabyte.com/latest/architecture/docdb-replication/replication/

CockroachDB  https://www.cockroachlabs.com/docs/stable/architecture/replication-layer.html

## other

Aurora https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/Aurora.Replication.html

Spanner/F1

rethinkdb https://rethinkdb.com/docs/architecture/

Windows Azure Storage https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy

voldemort  https://www.project-voldemort.com/voldemort/design.html

Bigtable

Yahoo PNUTS

VoltDB https://docs.voltdb.com/UsingVoltDB/ChapReplication.php

ScyllaDB https://docs.scylladb.com/architecture/

foundationdb: https://apple.github.io/foundationdb/consistency.html
https://apple.github.io/foundationdb/fault-tolerance.html




| Application | Replication Model | Consistency Model |
| ----------- | ----------------- | ----------------- |
|             |                   |                   |
|             |                   |                   |
|             |                   |                   |

