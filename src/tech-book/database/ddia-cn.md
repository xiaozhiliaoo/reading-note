# 数据密集型应用系统设计

## 进度

## 笔记

线性化会显著降低性能和可用性。

2PC是一种共识算法，虽然不是多优秀。

共识意味着某一项提议，所有节点做出一致的决定，而且决定不可撤销。

Youtube分享：https://www.youtube.com/watch?v=PdtlXdse7pw&list=PL4KdJM8LzAMecwInbBK5GJ3Anz-ts75RQ&index=1

B站分享：https://www.bilibili.com/video/BV1bY411L7HA?spm_id_from=333.337.search-card.all.click&vd_source=e9a79cd231e954c6a5d4a0fcacaea86a

## 人物

[Pat Helland](https://dblp.org/pid/h/PatHelland.html)

[Douglas Terry](https://scholar.google.com/citations?user=4ZYEiVEAAAAJ&hl=zh-CN)

## 笔记

分布式文件系统：GlusterFS，Quantcast File System, HDFS

对象存储:S3, Azure Blob, OpenStack Swift

Hadoop工作流调度：Oozie，Azkaban，Luigi，AirFlow，Pinball

Hadoop高级工具：Pig，Hive，Cascading，Crunch，FlumeJava

广播HashJoin：Pig(Replicated Join) Hive(Map Join)

分区HashJoin：Hive(bucketed map join)

数据集分区元数据：HCatalog，Hive(metastore)

批处理输出键值：Voldemort, Terrapin, ElephantDB, HBase批量加载

HDFS上面计算模型：MR，SQL，HBase，Impala(MPP)

集群调度：YARN，CapacityScheduler,Mesos,K8S

基于MR上创建的高级编程模式：Pig，Hive，Cascading，Crunch

数据流引擎：Spark，Tez，Flink，Beam，Hazelcast Jet

Dryad，Nephele

Spark RDD 弹性分布式数据集

图处理模型：Pregel，BSP模型，Apache Giraph，Spark GraphX，Flink Gelly

apache hawq mpp

流批一体：Bean，Flink，Google Cloud DataFlow

数据流语言：Oz，Juttle 功能性反应式编程语言：Elm 逻辑编程语言：Bloom

## 产品

## 网站

https://github.com/ept/ddia-references

https://cwiki.apache.org/confluence/display/CASSANDRA2/ArchitectureInternals

https://dataintensive.net/

## 思考

mysql和redis同步是双写好，还是异步事件日志kafka好呢？mysql和redis都是shared-disk架构 如果是同步双写，那么写入顺序是什么呢？1 先写DB，后写Redis，DB等价于WAL。 2
不需要写DB，计算结果缓存，直接写Redis。 同步双写本质是分布式事务XA或者2PC层面问题。同步双写的ACID保证。 MySQL写不同的库是XA保证的。

mysql和redis同步策略。1 同步双写 2 异步全序广播（kafka or cdc），后者方案更好，因为同步双写你没办法保证，mysql和redis同时成功或者同时失败，
此时需要xa，2pc类似的机制，或者最终一致性处理，还要保证写入顺序以及读取顺序，有并发以及覆盖更新问题 2 kafka广播，or cdc，最终一定会成功。

redis(mysql)和内存之间同步？shared-disk和shred-noting架构同步

