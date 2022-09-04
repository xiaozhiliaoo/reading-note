# Hazelcast简介

Hazelcast is a streaming and memory-first application platform for fast, stateful, data-intensive workloads on-premises,
at the edge or as a fully managed cloud service.

产品有：Hazelcast Management Center，IMDG，Jet

# 学习进度

# 提供的新架构，解决方案

# 笔记

cache, distributed lock, key-value store, pub/sub, computing platform,

cache pattern: https://hazelcast.com/blog/a-hitchhikers-guide-to-caching-patterns/
cache read-through MapLoader write-through MapStore Write-Behind write-delay-seconds

内存计算大图：数仓方向Databend，apache arrow，Hadoop->Spark,HDFS->Alluxio,Arrow,HANA,HazelCast, Redis,VoltDB 这些技术的关系。IMDG到底是什么？

内存计算的含义是：IMDG+JET

Apache Beam和Jet组合起来？

IMDG(DataGrid-distributed data) IMDB(DataBase) IMDS(DataStore) IMCG(ComputeGrid-Jet)

使用方式Java Member和Java Client，其他语言只有Client。

Near Cache是client-server模式的二级缓存。

HZ核心设计文档：https://github.com/hazelcast/hazelcast/blob/master/docs/design/template.md

Bridging Between Java 8 Streams and Hazelcast Jet

In-Memory Storage/In-Memory Compute/Real-Time Processing

Distributed Data Design(Partitioning and Replication)： AP:Replication(lazy replication), primary-copy, best-effort, no
strong consistency but monotonic reads guarantee, anti-entropy,at-least-once, CP: Consensus algorithms Raft

嵌入式是否支持”跨应用”发现彼此？

membership具体细节，如何加入和如何退出，以及数据迁移细节官方文档涉及比较少。

Build Distributed System

Core Object：Config,DistributedObject,Node,NodeState,Cluster,HazelcastInstance

FD:PhiAccrualFailureDetector,PhiAccrualClusterFailureDetector,DeadlineClusterFailureDetector,PingFailureDetector

自定义对象：common infrastructure

simple data grid -> data grid infrastructure

## Jet

Hazelcast Jet no dependency on disk storage, it keeps all of its operational state in the RAM of the cluster

## 竞品

HZ的AP需要结合复制，一致性，选举去理解。而CP则需要结合线性一致性，共识去理解。

https://www.gartner.com/reviews/market/in-memory-data-grids

对比：https://hazelcast.com/resources/#topic=competitive
Apache Ignite，Pivotal Gemfire，Terracotta BigMemory，JBoss Data Grid，GigaSpaces，Oracle Coherence SAP HANA？timesten

https://www.oracle.com/java/coherence/

an alternative to Coherence and Terracotta

Distributed Snapshots: Chandy-Lamport algorithm JET using it?

讲座：https://hazelcast.com/blog/tech-talk-series/

hz和beam结合例子：https://hazelcast.com/blog/running-apache-beam-on-hazelcast-jet/

Testing the CP Subsystem with Jepsen：https://hazelcast.com/blog/testing-the-cp-subsystem-with-jepsen/
linearizable

问：Linearizable：单机jmm实现不了顺序一致性 采取了happen before一致性。为什么在分布式里面就能实现比顺序一致性高的线性一致性呢？（也许这是一个错误的问题）而raft是如何基于共识协议实现了线性一致性呢？
答：因为满足happen-before的属性是可线性化的，全序的，所有线程遵守约定次序。单锁保护对象读写都是可线性化的，
Java内存模型满足松弛内存模型的基本特性：如果程序的顺序一致性满足某些规则，那么该程序的所有执行在松弛内存模型仍然是顺序一致的。

https://docs.oracle.com/javase/8/docs/api/java/util/concurrent/package-summary.html#Weakly

假设Lock基于AQS，非阻塞同步，CAS，乐观并发。

CHashMap，单机不能实现强一致性(put完get肯定是最新的)。分布式也更加实现不了，如果实现了。

ConcurrentHashMap：Weak Consistency，单机的能保证read your write，但是能保证read others write吗？

jmm的happen-before：满足条件的是部分操作，而顺序一致性是所有操作。分布式系统里面，并没有定义哪些操作是happen before。如果定义了，那么等价于分布式的强一致性的Map。这里强
一致性是部分操作，不是所有操作。我在单机执行Map操作，然后复制结果到其他节点，完事。如果是CP的，那么Map每个操作都要强一致性的话，会很复杂。

如果是分布式的Map，意味着锁住整个Map，SynchronizedMap。并发集合是线程安全的，但不受单个互斥锁的控制。单个锁阻止对集合的所有访问时，“同步”类可能很有用。
Map的一致性性，操作非常多，不仅仅是put，get，还有size，isEmpty,containValue,迭代等功能。满足这些操作的全部强一致，代价较高。

K1=4 线程A：put(K1=6) get(K1)，线程B：get(K1) put(K1=5), 没有同步情况下，B: get(K1)是可能获取到A的值。为什么并发Map不会导致脏读？ 经过一段时间，K1的值是多少？

用底层不可靠机制实现了上层可靠机制。底层jmm happen before，但是上层happen before可以实现强一致性。

指令重排序，类似于消息乱序。

https://curator.apache.org/curator-recipes/index.html

CP：https://hazelcast.com/blog/author/ensarbasri/

https://github.com/jepsen-io/jepsen/tree/main/hazelcast

CP group Each CP group executes the Raft consensus algorithm independently

Beam缩写：Batch + strEAM

SQL基于calcite解析。

API文档：https://docs.hazelcast.org/docs/4.2.5/javadoc/，其中关于FencedLock很有意思。

缓存选择：IMap还是ReplicatedMap？为什么ReplicatedMap没有MapLoader和MapStore接口？ 缓存选择：IMap还是ICache？ ICache优于IMap，IMap过期策略很少，ICache
API供应商独立，可以替换缓存实现，更符合缓存，IMap好像ConcurrentHashMap，ICache类似于LoadingCache.

IMap+Near Cache

Replicated Map：anti-entropy update operations to all members in the cluster eventually consistent system with
read-your-writes and monotonic-reads consistency

Replicated Map：Mutli-Master IMap：Single Master

Akka的AP提供的是CRDT，HZ的AP提供的是数据结构。

AP数据结构，意味着线性一致性。意味着不一致就不可用。

分布式锁在CP意味着什么？AP意味着什么？这里的强一致性并不是数据。

HZ是PACELC种PA，EC完美案例。

(必读Daniel Abadi文章)Hazelcast和神话般的PA/EC系统：http://dbmsmusings.blogspot.com/2017/10/hazelcast-and-mythical-paec-system.html

PA/EC:系统的基本问题如下：尽管分区是一个罕见的事件，但它们并非不可能。任何建立在PA系统之上的应用都必须有相应的机制来处理这些分区事件中出 现的不一致。但是，一旦他们有了这些机制，为什么不在正常运行期间受益，并获得更好的延时呢？

https://en.wikipedia.org/wiki/PACELC_theorem

IAtomicLong的(incrementAndGet,compareAndSet )意味着分布式的compare-and-set。单机原子变量实现很复杂了。CAS操作。意味着共识。那意味着CAS可以实现非阻塞的锁。
那么为什么不能实现并发的强一致性MAP/LIST？参考juc思路。

AP数据结构并不依赖共识。

如何实现线性化的compareAndSet与全序关系广播等价于共识问题。

HZ的CP官方说是线性一致性。

HZ AP复制模型。primary-backup.primary挂了，怎么选举primary？leader选举不一定需要共识。

CP Subsystem：Unsafe mode，CP group，CP member，

Akka无主，实现了集群单例，主节点选举。

选举不一定需要共识，虽然表面看是对某些事情达成一致。

主节点选举，集群单例，分布式锁，分布式事务与共识关系。

分布式互斥与共识算法。共识和线性化有关系，但是分布式系统在不保证线性化时候，共识并不是必须的。

共识可以解决选主，原子提交，互斥。但是选主，原子提交，选主不一定是共识。

//Distributed Lock hzMap.lock("Peter"); 和 FenceLock区别？

### core class

node:Hazelcast member:HazelcastInstance

CPSubsystem,CPMember,CPGroup,CPSession RaftService 【each CP member can participate to more than one CP group】

hz的cp到底和raft区别在哪里？多了哪些？

HZ的分布性特性，除了CAP抉择外，还需要满足正确性，如单机线程安全(去哪里了？是否还存在？)，单机数据结构正确性(默认正确)
，分布式数据结构的正确性（保持疑问），比如Queue顺序，Set的唯一性，List下标，Topic的消息语义，数据一致。
数据结构的正确性，hashCode，equals，并发实现等等细节。理解部分简单，理解部分复杂，学习和理解都不难，但是难在证明是对的。你能想到很多问题，但是很难精确解答，因为你很难精确证明。为什么不需要证明系统还在运行？
因为经验主义。而不是科学主义。但是关键的点需要理解清楚：官方如文档提到的。需要收集各种信息来完善认识。了解越多越好是良好工程的基础。

分布式系统，节点变更对系统影响。很难说清楚，因为系统文档不全，相信但怀疑。

复制是如何保证不乱序的？

单机 List，Set，Map不线程安全时会发生什么？

顺序一致性。它太严格了，不适合做 Java 内存模型，因为它 禁止了标准的编译器和处理器优化。这一节将回顾下顺序一致性，然后展示另一个 模型，称作 happens-before 内存模型。

Hazelcast is a java library to create distributed applications

Java Memory Consistency with happens-before。

JMM可见性和ACID隔离性有点类似。

分布式系统和单机并行系统一致性表达同样的事物，只是操作或者适合级别不一样。先说单机一致性，再说分布式系统一致性。（和Replicate有关，但是不绝对，如共享存储） Java并发：A（原子性）V（可见性）O（顺序性）
指令重排，类似于命令重排。AVO是JMM在happen-before一致性模型下的特点。 数据库：ACID（隔离性-可见性） 分布式：CAP（一致性-可见性）

复制，一致性，共识关系是什么？ 一致性协议有哪些？Continuous，Primary-based，Remote-write protocols，Replicated-write protocols， memory consistency
and cache coherency.

先说单机并发的一致性，再说分布式系统的一致性。 如何让JUC变成分布式结构？HZ的原子变量/锁和JUC区别？
https://en.wikipedia.org/wiki/Consistency_model
https://en.wikipedia.org/wiki/MESI_protocol
https://en.wikipedia.org/wiki/Consistency_(database_systems) 【Consistency (or Correctness) 】
https://en.wikipedia.org/wiki/Linearizability
https://en.wikipedia.org/wiki/Sequential_consistency
https://en.wikipedia.org/wiki/Causal_consistency
https://en.wikipedia.org/wiki/Cache_coherence （缓存一致性）
https://en.wikipedia.org/wiki/Data_consistency
https://en.wikipedia.org/wiki/Consensus_(computer_science)
工程里面缓存一致性，是数据一致性。

Consistency and replication（多份数据的一致性）以及单一共享数据的一致性。

Expire(time:access or last write) and Evict(size：LRU,LFU),最近虽然是时间概念，但是淘汰的是size。 Caffenie:size-based eviction,time-based
expiration

缓存淘汰：eviction(LRU LFU，很多key淘汰哪些，选择淘汰哪些是不确定的，全局配置)
缓存过期：expiration(单个key，淘汰是确定的)

我们在应用层很少谈论一个并发Map的一致性，因为JMM做了假设，是happen-before原则。

IMap和ICache区别？

顺序性，一致性，原子性，可见性，

CAP是特性，而不是实现。 一致性是形容词，共识是动词。

一致性能干什么？分布式锁的一致性是线性的（HZ）还是顺序的（ZK）。保证了一致性有什么好处？如何实现一致性呢？共识和一致性如何产生关系的？

数据库的ACID有什么好处？数据库并发控制+事务。

JMM的一致性的没有实现顺序一致性，因为会禁止编译器对所有代码重排序，所以选择了一种弱一致性模型，叫happen-before，而满足happen-before的操作，一定会满足线性一致性，此时是阻塞方式实现线性一致性。但是juc里面aqs基于非阻塞算法，而非阻塞算法分为无等待，无锁，无障碍。juc
大部分是无锁实现，也就是无锁实现了线性一致性。 单机并发一致性和分布式一致性是一样的。只是分布式多了网络这个不确定因素。

原子变量：里面只有一个值。减少了状态的变化，基于原子变量可以设计非阻塞的数据结构。然后在理解hz的原子变量作用。 并发集合：有阻塞同步的，也有非阻塞同步的。 同步原语，阻塞同步，AQS框架。

单机锁和分布式锁均需要保证活跃性，安全性，性能。

leader选举和一致性没关系，但是强一致性更好实现leader选举，如zk 顺序一致性。

锁可以实现leader选举，leader选举也可以用锁或者别的方法来做。

分布式锁本质是分布式同步，单机锁和分布式锁区别在于对于网络分区，异常的处理。容错的分布式锁。

共识包括了选举，复制，分区等操作，这些操作会带来一致性问题。但是选举，复制，分区本身不包括共识。 

共识包括了一致性，但是一致性不包括共识。 

共识可以构建更高级的分布式同步原语，但是分布式同步原语可以不包括共识。

无论上面关系怎么变化，需要的是人为可感知的正确性。

分布式锁，共识，选举关系：共识包括选举，共识可以实现分布式原语，锁，锁也可以实现选举。这里选举含义是：是占有锁的人是leader，但是没有选举过程。

JMM具备AVO特性，导致单机锁具备了可见性和顺序性特点，分布式锁具有顺序性吗？或者可见性吗？分布式具备这些特性，需要满足一致性。如果分布式锁内容具有原子性，必须2PC了。但是2PC是弱的共识协议。

单机锁(LSP)：活性（blocking:AQS,synchronize,LockSupport,non-blocking: AtomicXXX, wait-free, lock-free, obstruction
free），安全性（），性能（）

分布式的活性是什么？不获取锁？还是阻塞住？还是退了客户端继续重试？ZooKeeper: Wait-free coordination for Internet-scale systems

Locks can then be used to implement leader election, group membership

锁是一种通用机制，而选举，成员管理是一种功能。

MySQL构成的锁，Redis单机不是容错的分布式锁。这里的锁更类似于”产生互斥“的效果，其本身并不是锁的语义。

原子性：java(原子变量)，acid，分布式事务，分布式系统（ZooKeeper Atomic Broadcast）

选主和分布式锁关系。实际该用选主的场景，选则了分布式锁。定时任务是什么场景？

定时任务本质一个节点执行，转换为leader执行，或者第一个获取锁的节点执行。本质是分布式互斥问题/分布式成员管理问题。

FencedLock的线性一致性如果服务端节点宕机或者客户端宕机，什么才叫线性一致性呢？

AP对于具体的数据结构含义不一样。

### CPSubsystem
leader election, distributed locking, synchronization, and metadata management

Each CP group elects its own Raft leader and runs the Raft consensus algorithm independently.

each CP member can participate to more than one CP group

5个节点，挂了两个，集群还是线性一致性，但是在挂一个，将会报错。也就是一致性优于可用性。如果是6个，还是6/2+1,还是容忍挂两个。浪费了一个节点。

CP data structures have quite low memory overheads。

CP Subsystem  member down之后，由于没有持久化raft状态，所以如果IP地址一样的话，将加入不了CPSubsystem,但是rancher里面每次重启ip变化了，所以不会有这个问题。

CP persistence requires Hazelcast Enterprise Edition

locks or semaphore：CPSession保证了liveliness。Sessions offer a trade-off between liveliness and safety。


#### 复制顺序保证

复制是分布式系统的起点，研究清楚复制过程是基础也是核心，如数据复制形式(pull or push,复制模式，语句还是状态，复制顺序保证等等)，服务复制(管理服务)。shard-everything也需要复制的。

共识保证复制顺序，一致性等等。但是反过来就不一定了。普通的复制如何保证顺序性呢？难道是保证不了？顺序性需要事件顺序，又回到了逻辑时间问题？究竟如何保证的？

副本更新顺序是怎么保证的？如果保证了，和一致性关系？mysql主从顺序保证了，但是一致性没保证。复制顺序问题。

With lazy replication, when the primary replica receives an update operation for a key, it executes the update locally 
propagates it to backup replicas. It marks each update with a logical timestamp so that backups apply them in the 
order and converge to the same state with the primary. 

MySQL复制是slave读取masterbinlog然后放在中继日志里面。

复制，分布式互斥，分布式数据结构，分布式选举，这些问题，可以单独解决，也可以先构建一个共识协议，来解决这些问题。基于共识解决是有限制的。比如redis分布式锁是基于redis去实现的，
本身和分布式共识没关系，但是可以基于共识去实现分布式锁。 这就是redis，zk，etcd，hz的分布式锁/barrier/countdownlatch的区别。但是用共识解决这些问题，
会导致一些限制，如写不能太多，数据不能太大，必须强一致性，不能性能瓶颈。 分布式数据结构里面的hz ap，以及redis reddsion存储能力大于zk的队列存储。需要一致性的，互斥的尽量是
共识解决，不需要的可以不借助共识实现。kafka的数据复制和zk分开的(分区管理,元信息等).zk的分布式数据存的是配置或者参数之类的，而不是一个数据存储系统。

akka，gossip
consul client(gossip)+server(raft)

##### kv（https://db-engines.com/en/ranking/key-value+store）

1.Riak, Redis and Voldermort
2.etcd/consul/zk/
3.leveldb/rocksdb/mapdb

AP是舍弃了线性一致性，获得了高可用，但是一致性模型，在jepsen中是什么呢？(Causal Consistency/RYW/Session/Monotonic Read/Write)

Quroumn策略：W+R<=N，属于weak/eventual consistency
W+R>N,强一致性，但是可用性下降，写入少于W，系统就不可用了。

kafka复制和kraft没关系。也不借助zk。一个系统用了raft看主要解决了什么问题？raft虽然有复制，但是系统数据一般不会用。


## Starter

https://docs.hazelcast.com/hazelcast/5.1/pipelines/spring-boot

# 参考

## Paper

[Phi Accrual Failure Detector](https://www.computer.org/csdl/proceedings-article/srds/2004/22390066/12OmNvT2phv)

[Group membership and view synchrony in partitionable asynchronous distributed systems: specifications](https://dl.acm.org/doi/pdf/10.1145/250007.250010)

## Repository

https://github.com/xiaozhiliaoo/hazelcast

https://github.com/xiaozhiliaoo/hazelcast-code-samples

https://github.com/xiaozhiliaoo/hazelcast-jet

https://github.com/xiaozhiliaoo/hazelcast-practice

## 链接

Redis和Hazelcast对比：https://hazelcast.com/compare-with-redis/

Jet和Spark对比：https://hazelcast.com/blog/how-hazelcast-jet-compares-to-apache-spark/

## 人物

Greg Luck Hz CTO ( *https://hazelcast.com/blog/author/gregluck/* ) jsr107作者  https://github.com/gregrluck

Greg Luck is a leading technology entrepreneur with more than 15 years of experience in high-performance in-memory
computing. He is the founder and inventor of Ehcache, a widely used open source Java distributed cache that was acquired
by Software AG (Terracotta) in 2009, where he served as CTO. Prior to that, Greg was the Chief Architect at Australian
start-up Wotif.com that went public on the Australian Stock Exchange (ASX:WTF) in 2006. Greg is a current member of the
Java Community Process (JCP) Executive Committee, and since 2007 has been the Specification Lead for JSR 107 (Java
Specification Requests) JCACHE. Greg has a master's degree in Information Technology from Queensland University of
Technology and a Bachelor of Commerce from the University of Queensland.



