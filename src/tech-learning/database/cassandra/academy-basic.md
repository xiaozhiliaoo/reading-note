# DataStax Academy DS201


## DS201.01 Course Introduction | Foundations of Apache Cassandra

### Basic

partition key data haah to ring group by consistent hash

copy命令，外界导入cassandra数据。

PRIMARY KEY: unique record, control order

PRIMARY KEY:paration key, cluster column(查询必须先确认分区，然后才能查询)

分布式特性：读写路径。

如何改变默认顺序。cluster column。

主键插入不会报错，但是会覆盖数据。

顺序在磁盘，二分搜索会有有效。

ALLOW FILTERING：https://www.datastax.com/blog/allow-filtering-explained

一个节点2-4T。

### Partitioner

hash partition key to get prtition token


### Node.

数据存在distributed hash table

6000-12000 transaction/second/core  2-4TB

Nodetool

### Ring

-2^63 ~ 2^63 -1

CLuster叫Ring.每个节点管理一段范围数据，叫token range. 协调节点知道token range. token range 是partitioner分配的。

不停机。种子节点，对等节点。driver is aware of which token range belong to which node, which replica.
TokenAwarePolicy:避免协调节点，驱动知道数据在哪一个节点。
RoundRobinAwarePolicy：随机选择ring中的节点。
DCAwreRoundRobinPolicy：指定数据中心。


### Peer 2 Peer

Leader-Follower。选举期间不可用。

P2P 不用选举，但是有协调节点。处理网络分区是怎么处理的？keep always online。

### VNode

如果新加入节点，会导致数据迁移压力全在一个节点，VNode会从不同节点拉取数据。keep cluster balance。

add/remove node with vnode help keep cluster balanced. each node has 128 vnode. vnode automate token range assignment. 配置参数 num_tokens.

### Gossip

数据复制是通过gossip吗？不是，传递的是metadata。

seed nodes就是开始节点。

gossip：node/cluster metadata，not client data

Endpoint State：https://github.com/facebookarchive/cassandra/blob/master/src/org/apache/cassandra/gms/Gossiper.java

uses the Gossip protocol to distribute nodes' status amongst its peers.

### Snitch

which node belong where

cassandra.yml:endpoint_snitch:SimpleSnitch

cloud base snitch

dynamic snitch

改变这个需要重启集群。


### Replication

ring replicate data

replication factor: 1 
RF:2  each node store two copies. neighbors store neighbors data store.

一般是 RF=3. 3台机器宕机情况很少。



### Consistency

RF+CL（Consitency Level）

replication factor


RF=3（数据存三份）
CL=one（一个replica回复即可）
CL=QUROUM（2个，不能容忍分区容错得）
CL=ALL（3个必须回复）

强一致性：读到最新写的。

WRITE CL:ALL READ CL:ONE

CL ONE: 写入很快，（IOT，时序数据，log data） always online。 

写入很快，读取较慢。W(1)+R(2)>N(3).

如果W=2，意味着两个节点写入了吗？还是响应？

consistency 和 latency 取舍。(PACELC)

consistency默认是one.

### Hint Handoff

rf=3，4个node，协调节点写入一个node失败，协调节点会存储。等节点成功，再次传递。默认3小时。

RF=3，4个node，1个node宕机，CL=one，two。协调节点会返回成功，three，协调节点会返回错误。

CL=any的话，生产环境不建议，协调节点会存储所有hint suffices，CL=one，至少会写入一个成功。如果超过hint hand off 时间窗口，协调节点会删除数据。如果协调节点宕机，会失去所有数据。
CL=one，至少一个replicate node会存储成功。

Availability can affect data consistency. Hinted-handoff helps Apache Cassandra(TM) maintain
consistency even when a node is down.

### Read Repair

Node=4，RF=3，CL=ALL，Node1 Data，Node 2，3 摘要(checksum) Node4 协调。

checksum不一样，说明数据不一致。

CL=ALL，一致性越少，越读不到最新数据。

nodetool full repair sync all data in cluster.

read_repair_chance: Sets the probability which Cassandra will perform a read repair with a consistency level less than ALL.

Read repair is always occurs when consistency level is ALL.

### Node Sync

node sync vs full repair

full repair对集群性能影响较大。

CREATE TABLE nodesync = true，在表级别，默认关闭。

### Write Path

HDD:commit log， SSTable 

RAM:MemTable

commit log总是写入顺序，memtable 不是写入顺序。

SSTable和MemTable 保证clustering column有序，commit log保证写入有序。


### Read Path

如何在SStable读取，如何在Memtable读取数据？

Bloom Filter：space和精确性权衡。

disk：SSTable(不可变的)，partition index


### Compaction

合并SSTable：先合并partition数据，然后合并partition。合并完之后删除旧的SSTable。

三种策略：SizeTiered，Leveled，TimeWindows。

gc_grace_second 10天。864000 seconds (10 days).

### Performance

