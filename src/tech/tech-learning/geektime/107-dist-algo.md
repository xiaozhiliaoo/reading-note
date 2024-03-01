# 107-分布式协议与算法实战 韩健

https://time.geekbang.org/column/intro/100046101



# Keywords

BFT(Byzantine fault tolerance),CFT(Crash fault tolerance)

TCC/XA-DTP/2PC

All/Quorum/One/Any

Basic Paxos/Multi Paoxs(Chubby,Spanner)

Raft(Etcd,Consul,CockroachDB)

Raft(Leader Select/Log Replication/Membership change(Joint Consensus/Single-Server Changes))

logcabin(joint consensus)

Hashicorp Raft：Consul，[IPFS](https://github.com/ipfs/ipfs-cluster/blob/master/consensus/raft/raft.go),InfluxDB

https://www.consul.io/docs/architecture/consensus

区块链共识机制：POW、POA、POS、DPOS、PBFT、DBFT

ZAB:基于主备的原子广播协议-2007年

一致性算法时间顺序 Basic Paxos -> Multi Paoxs -> ZAB -> Raft

Raft+：配置中心，名字路由，KV存储

# Notes

实现AP比CP复杂。

MuitiPaxos没有考虑顺序问题，只是对共识，而ZAB解决了顺序问题，后面Raft也考虑顺序。



# Wiki
https://en.wikipedia.org/wiki/Eventual_consistency

https://en.wikipedia.org/wiki/Gossip_protocol

https://en.wikipedia.org/wiki/Byzantine_fault

https://en.wikipedia.org/wiki/Replication_(computing)


# Person

Nancy Lynch  https://people.csail.mit.edu/lynch/

Seth Gilbert https://www.comp.nus.edu.sg/~gilbert/

Eric Brewer  https://people.eecs.berkeley.edu/~brewer/

Leslie Lamport http://www.lamport.org/

Werner Vogels https://www.allthingsdistributed.com/


# Paper

The Byzantine Generals Problem 

Brewer’s Conjecture and the Feasibility of Consistent, Available, Partition-Tolerant Web Services

Practical Byzantine Fault Tolerance:https://pmg.csail.mit.edu/papers/osdi99.pdf

Zab: High-performance broadcast for primary-backup systems



# Product

https://www.influxdata.com/time-series-platform/telegraf/

Cassandra: Read Repair, Hinted Handoff

https://www.influxdata.com/blog/eventual-consistency-hhq/

https://docs.amazonaws.cn/en_us/amazondynamodb/latest/developerguide/Introduction.html

https://cassandra.apache.org/doc/latest/cassandra/architecture/dynamo.html#tunable-consistency

https://docs.influxdata.com/enterprise_influxdb/v1.9/concepts/clustering/

zilliqa: https://dev.zilliqa.com/docs/basics/basics-zil-consensus/

sawtooth: https://sawtooth.hyperledger.org/docs/pbft/nightly/master/using-pbft-consensus.html

https://zookeeper.apache.org/doc/current/zookeeperInternals.html#sc_consistency

influxdb：meta node:CP,raft  data node:AP,hinted-handoff,quorum,anti-entropy,自定义副本

# Book

Concurrency Control and Recovery in Database Systems


# Site

https://www.allthingsdistributed.com/2008/12/eventually_consistent.html

https://www.influxdata.com/blog/multiple-data-center-replication-influxdb/

https://www.influxdata.com/blog/influxdb-clustering-design-neither-strictly-cp-or-ap/

https://github.com/influxdata/influxdb-comparisons

C: https://github.com/willemt/raft
C++:https://github.com/logcabin/logcabin

https://github.com/hashicorp/raft-boltdb

