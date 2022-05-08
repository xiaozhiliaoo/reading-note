# 基于Apache Flink的流处理:流式应用基础、实现及操作

# 进度

## 次数
1

## 已读

Ch1  √

Ch2 √

Ch3 √

Ch4 √

Ch5 √

Ch6

Ch7

Ch8 √

Ch9

Ch10

Ch11 √



## 未读

# 笔记

有状态：处理时间需要依赖已经处理过事件。

事件时间：水位线，触发器，窗口等机制保证了结果准确性。产生可重现且一致性的结果。 处理时间：机器时间，低延迟，但是结果具有不确定性。

水位线：允许应用控制结果完整性和延迟。

中间件复杂度：1 redis 单API 2 mq 两API 3 stream 三API source,process,sink

一致性：应用状态的一致性和保证输出一致性不同。

Flink是一个用于状态化并行流处理的分布式系统。

组件：JobManager，ResourceManager，TaskManager, Dispatcher

https://github.com/lw-lin/streaming-readings

paper:DataFlow+ABS

检查点基于Chandy-Lamport实现

Flink故障恢复算法基于状态的检查点实现。

检查点和保存点。

end-to-end consistency (这里的一致性和ACID的一致性一样,端到端的一致性如何保证？) 和 端到端精确一次处理语义？

Sink的事务性保证：1 WAL 2 2PC

数据库事务特性ACID和Kafka事务（隔离性/原子性）的特性？

Kafka事务隔离性对于消费者来说的，提交对生产者说的。

Flink数据源连接器可重放输出情况下才能为应用提供一致性保证，应用端到端一致性保证取决于sink 连接器的数学。需要具备幂等或者事务支持。

WAL：Cassandra GenericWriteAheadSink  2PC：Kafka TwoPhaseCommitSinkFunction

class FlinkKafkaProducer<IN> extends TwoPhaseCommitSinkFunction

从访问外部丰富数据流：AsyncFunction，处理过程中读取外部存储。 https://nightlies.apache.org/flink/flink-docs-release-1.15/docs/dev/datastream/operators/asyncio/

DataStream/DataSet/Table/CEP/Gelly

FlinkSQL 基于 Calcite


# 参考

https://flink.apache.org/features/2018/03/01/end-to-end-exactly-once-apache-flink.html

https://bahir.apache.org/ 