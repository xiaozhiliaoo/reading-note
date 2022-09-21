# 90-分布式技术原理与算法解析 聂鹏程

https://time.geekbang.org/column/intro/100036401



# Keywords

分布式互斥(集中式算法，分布式算法P2P，令牌环算法，两层结构的分布式令牌环算法)

分布式选举(Buddy,Raft(2014),ZAB(2011))  crash-recovery atomic broadcast algorithm

分布式共识(PoW 工作量证明,PoS 权益证明,DPos 委托权益证明)

分布式事务(2PC,3PC,MQ) 刚性事务 ACID  柔性事务 BASE

ACID:2pc,2pc Base:MQ

分布式锁(ZK,DB,Redis)  分布式锁羊群效应

分布式体系结构：集中式（Borg(2015)，Mesos(2013)，K8S(2014)）  Mesos+Marathon(Docker,cgroups)

分布式体系结构：非集中式(Akka Cluster(可容错，去中心化集群管理), Redis Cluster, Cassandra Cluster)  akka,redis是去中心化，但是需要选主，而cassandra是p2p，不用选主

分布式调度
    单体调度：Bord Scheduler，Hadoop，Spark，K8S  
    两层调度：Mesos（MMF-最大最小公平算法，DRF-主导资源公平算法），Yarn
    共享状态调度：Google Omega，Microsoft Apollo，Hashicorp Nomad

分布式计算
    MapReduce(Fork-Join)
    Stream：Storm，Flink，Spark，yahoo S4，Facebook Puma，Baidu Dstream，Taobao银河流数据处理平台，InfoSphere Stream
    Actor：Erlang/OTP, Akka，Quasar
    流水线：tersorflow

分布式通信
    RPC，RMI，Dubbo
    消息（P2P，PubSub），Kafka
    消息队列 RocketMQ

CAP
    CA：mysql，oracle
    CP：Redis，HBase，ZK
    AP：Eureka，CoachDB，Cassandra，DynamoDB

分布式存储
    分布式数据库(结构化)：MySQL sharding,Microsoft SQL Azure, Spanner, OceanBase
    分布式键值对(半结构化)：Redis，Memcache
    分布式存储(非结构化)：Ceph，GFS，HDFS，Swift(OpenStack)

数据分布(Sharding)
    Hash
    一致性Hash(Cassandra)
    带有限负载的一致性Hash(Google Cloud Pub/Sub, HAProxy) 
    带有虚拟节点的一致性Hash(Memcache)

数据复制
    同步复制(MySQL)
    异步复制(MySQL默认，Redis Cluster)
    半同步复制(ZK CP,Microsoft SQL Azure Cloud SQL Server, ETCD)

MySQL
    全同步复制
    半同步复制
    异步复制
Oracle
    最大保护模式
    最大性能模式
    最大可用性模式

故障检测
    固定心跳检测策略 (K，T)
    历史心跳信息预测故障策略：phi φ值检测：akka，hz

网络分区处理策略(产生很多分区后，选择一个分区对外服务) 集中式拓扑与非集中式拓扑
    Static Quorum
    Keep Majority（保留子集群节点数w>n/2的集群，如果分区过多，很难从很多分区找出一个>n/2集群）
    设置仲裁机制
    基于共享资源方式处理网络分区

Akka network partion
    发现
         stable-after
    处理策略
        Static Quorum
        Keep Majority
        Keep Oldest
        Keep Referee
        Down All
        Lease Majority

Hazelcast network partion
     Bron–Kerbosch algorithm

OOP vs Aoctor

E-PVM算法

Akka Cluster：面向应用程序平台的分布式集群管理

Spark,Hadoop,Marathon

Docker，Rocket

Memcache Ketama算法

Repcache实现Memchche的复制功能


# Notes

吞吐量 qps tps bps

akka虽然有Leader和非Leader节点，但是不影响非集中式结构的节点的平等关系。节点有角色，但是没有控制关系。

去中心化和选主没有必然关系。一般master/slave是集中结构，而leader/非leader是非集中结构。也不一定。

Acotr=状态+行为+消息

Omega是Borg的下一代。


# Question
为什么需要分布式系统？

一致性和共识区别？


# Wiki


# Person

Jeff Dean

Sage Weil: https://en.wikipedia.org/wiki/Sage_Weil

Sanjay Ghemawat



# Paper

PacificA: Replication in Log-Based Distributed Storage Systems 2008 

Large-scale cluster management at Google with Borg

Dominant Resource Fairness: Fair Allocation of Multiple Resource Types

Apollo: Scalable and Coordinated Scheduling for Cloud-Scale Computing

Omega: flexible, scalable schedulers for large compute clusters

Consistent Hashing with Bounded Loads  Google 2017

The φ Accrual Failure Detector

# Paper Recommend
## 理论基础
Time, Clocks, and the Ordering of Events in a Distributed System  1978   Lamport 

The byzantine generals problem 1982 LAMPORT

Brewer’s Conjecture and the Feasibility of Consistent, Available, Partition-Tolerant Web  2002  Seth Gilbert  Nancy Lynch

CAP Twelve Years Later: How the "Rules" Have Changed 2012 Eric Brewer

Base: An Acid Alternative 2008  Dan Pritchett, Ebay

A simple totally ordered broadcast protocol 2008 

Virtual Time and Global States of Distributed Systems 2002

## 分布式一致性算法

A brief history of Consensus, 2PC and Transaction Commit. 2007

Paxos Made Simple 2001 Lamport

Paxos Made Practical 2007 David Mazieres

Paxos Made Live - An Engineering Perspective 2006  Tushar Deepak Chandra Robert Griesemer Joshua Redstone

In Search of an Understandable Consensus Algorithm(Extended Version)  2014 Diego Ongaro and John Ousterhout

ZooKeeper: Wait-free coordination for Internet-scale systems 2010 

Using Paxos to Build a Scalable, Consistent, and Highly Available Datastore 2011

Impossibility of Distributed Consensus with One Faulty Process 1985

Consensus in the Presence of Partial Synchrony 1988 

## 分布式数据结构

Chord: A Scalable Peer-to-peer Lookup Protocol for Internet Applications 2003

Pastry: Scalable, Decentralized Object Location, and Routing for Large-Scale Peer-to-Peer Systems 2001

Kademlia: A Peer-to-Peer Information System Based on the XOR Metric 2002

A Scalable Content-Addressable Network 2001

Ceph: A Scalable, High-Performance Distributed File System  2006 OSDI   Sage Weil

The Log-Structured Merge-Tree (LSM-Tree) 1996 

HBase: A NoSQL Database 2017 Hiren Patel

Tango: Distributed Data Structures over a Shared Log 2013



## 分布式系统实战

The Google File System 2003 Sanjay Ghemawat

Bigtable: A Distributed Storage System for Structured Data 2006

The Chubby lock service for loosely-coupled distributed systems 2006

Finding a needle in Haystack: Facebook's photo storage 2010

Windows Azure Storage: A Highly Available Cloud Storage Service with Strong Consistency 2011

Resilient Distributed Datasets: A Fault-Tolerant Abstraction for In-Memory Cluster Computing 2012

Scaling Distributed Machine Learning with the Parameter Server 2014

Dremel: Interactive Analysis of Web-Scale Datasets 2010

Pregel: A System for Large-Scale Graph Processing 2013

Spanner: Google's Globally-Distributed Database 2012

Dynamo: Amazon’s Highly Available Key-value Store 2007

S4: Distributed Stream Computing Platform 2010

Storm @Twitter 2015 https://cs.brown.edu/courses/cs227/archives/2015/papers/ss-storm.pdf

Large-scale cluster management at Google with Borg 2015

F1: A Distributed SQL Database That Scales 2013

Cassandra - A Decentralized Structured Storage System 2009

Megastore: Providing Scalable, Highly Available Storage for Interactive Services 2011

Dapper, a Large-Scale Distributed Systems Tracing Infrastructure 2010

Kafka : a Distributed Messaging System for Log Processing 2011

Amazon Aurora: Design Considerations for High Throughput Cloud-Native Relational Databases 2017

Amazon Aurora: On Avoiding Distributed Consensus for I/Os, Commits, and Membership Changes 2018




# Product

mongodb bully: https://docs.mongodb.com/manual/core/replica-set-elections/

es bully: https://www.elastic.co/blog/found-leader-election-in-general

es pacificA:https://www.elastic.co/guide/en/elasticsearch/reference/current/docs-replication.html

kafka pacificA: https://kafka.apache.org/documentation/#design_replicatedlog

k8s:https://kubernetes.io/blog/2016/01/simple-leader-election-with-kubernetes/

zk leader selection:https://zookeeper.apache.org/doc/r3.2.2/zookeeperInternals.html

etcd: https://etcd.io/docs/v3.5/learning/why/

Bookeeper https://zookeeper.apache.org/doc/r3.2.2/bookkeeperStarted.html

https://mesos.apache.org/documentation/latest/high-availability/

https://doc.akka.io/docs/akka/current/typed/cluster-concepts.html  (Gossip+ Phi Accrual Failure Detector)

https://redis.io/topics/cluster-spec

https://redis.io/topics/sentinel

https://docs.datastax.com/en/cassandra-oss/3.x/cassandra/architecture/archTOC.html

https://docs.hazelcast.com/imdg/4.2/network-partitioning/partial-network-partitions

# Book



# Site

https://hazelcast.com/glossary/cap-theorem/

https://docs.hazelcast.com/imdg/4.2/consistency-and-replication/consistency

https://ai.googleblog.com/2017/04/consistent-hashing-with-bounded-loads.html

https://www.metabrew.com/article/libketama-consistent-hashing-algo-memcached-clients

https://doc.akka.io/docs/akka-enhancements/current/split-brain-resolver.html