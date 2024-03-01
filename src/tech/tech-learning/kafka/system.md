# Kafka简介

Apache Kafka is an open-source distributed event streaming platform used by thousands of companies for high-performance
data pipelines, streaming analytics, data integration, and mission-critical applications.

Confluent: Set Your Data in Motion

Confluent is creating the foundational platform for data-in-motion

## 进度

Event Streaming Patterns：https://developer.confluent.io/patterns/event/event/

inside-ksqldb：https://developer.confluent.io/learn-kafka/inside-ksqldb/streaming-architecture/

## 笔记

提供的新架构，解决方案：事件流处理平台，事件处理

### Kafka

Events+Topics+RealTime+TalkToEachOther，4件事，不是kafka是什么，而是这种观点，分布式日志，

消费者：https://kafka.apache.org/30/javadoc/org/apache/kafka/clients/consumer/KafkaConsumer.html

生产者：https://kafka.apache.org/30/javadoc/org/apache/kafka/clients/producer/KafkaProducer.html

消费者逻辑比生产者复杂。

Kafka是事件处理平台，提供了事件存储能力Kafka的Log，事件计算KSQLDB，Kafka Stream。

Kafka Ecosystem: Kafka,Kafka Stream,Kafka Connect,KSQLDB.

事件处理中出现了问题，那么Materialize可以是发邮件，也可以是存到存储系统中。

kafka发送消息是k，v类型的。没发送一个消息，offset+1

https://developer.confluent.io/learn-kafka/event-sourcing/event-driven-vs-state-based/

```text
软件设计方法：
state-based（databases+ synchronous network call）
event-based（data at rest + data in motion + event sourcing + CQRS + event streaming）
CRUD：Databases
CR：Event Sourcing
```

```text
Topic：Event,Key,Partition,Schema
Table：Row,Primary Key,Shard,Schema
Index：Document,_id,Shard,Mapping
Collection：Document,DocumentId,Shard,Schema
```

Kafka Queue is Log:Append Only and Durable,Reading Message never delete. Other Message is Queue. Message is Bounded
Buffer can be deleted. Topic is Log. Not Queue. Topic(DLT) is Queue(DLQ).

same key -> same partition -> in order ,key is null -> round robin ,key is nonull -> hash function

rewind,reprocess,replayable,reblance,

consumer group protocol(join+leave)

kafka日志清理两种策略，一种是删除，一种是压缩，删除的话就直接删除消息了，压缩才是保留最新的，

### Kafka Connector

Consumer+Materialize = Kafka Connect ,Consumer+Stateful = Kafka Stream ,Consumer+Stateless = Kafka Consumer

数据是流动的处理平台(Kafka)和数据是静止的处理平台(MySQL)

DLQ:Dead Letter Queue

### Kafka Stream

KTable:Last Updated Value

Kafka Core: Log+Event

Kafka Stream = KStream,KTable,Serialization,Joins,Stateful Operations,Windowing,Times,Processor,

Joins:Stream-Stream(Windows),Stream-Table,Table-Table

Stateless:filter,map, Stateful(use pre event):group by key,reduce,aggregation(sum,count,avg,max,min),join

Time Windows: https://kafka.apache.org/30/javadoc/org/apache/kafka/streams/kstream/TimeWindows.html

Session Windows: https://kafka.apache.org/30/javadoc/org/apache/kafka/streams/kstream/SessionWindows.html

SlidingWindows: https://kafka.apache.org/30/javadoc/org/apache/kafka/streams/kstream/SlidingWindows.html

### ksqlDB

ksqlDB:distributed compute layer kafka:distributed storage layer

Streams：unbounded series of event. Table: the current state of event

Stateful Aggregations (Materialized Views)

ksqlDB can build a materialized view of state

Kafka is a database turned inside out

### Data Mesh

software architecture vs data architecture

service mesh vs data mesh

### broker配置

default.replication.factor

unclean.leader.election.enable

min.insync.replicas

### producer配置

acks(0,1,all)

[retries](https://kafka.apache.org/documentation/#producerconfigs_retries)

## Confluent Course

### APACHE KAFKA® INTERNAL ARCHITECTURE

Event Record RecordBatch

ISR/High Watermark/Leader Epoch

Leader Select: ISR and propagated through control plane

FetchRequest/FetchResponse

Reconciliation（协调） Logic

Data plane handles data replication

Consumer Group Protocol: Group Coordinator(Broker中), Group Leader(Consumer Group中)

Rebalance Protocol： distribute resources， stop-the-world rebalancing

Eager Rebalancing VS Incremental Cooperative
Rebalancing（https://www.confluent.io/blog/incremental-cooperative-rebalancing-in-kafka/）

Partition Assignment Strategy

__consumer_offsets

Consumer Group Rebalance Notification

Stop-the-World Rebalance Avoid Needless State Rebuild with StickyAssignor Avoid Pause with CooperativeStickyAssignor
Avoid Rebalance with Static Group Membership

Incremental Cooperative Rebalancing

```text
一个topic，可以被多个消费组消费，但是每个消费组内的消费组，只能消费一次。

消费组
一个pod对应一个消费者，一个消费者对应一个分区，查看消费速度，如果部署了三个pod，那么只会并行有三个分区的消息被消费，
疑问：一秒消费多少条消息？
三个消费者五个分区，这时候消息模型是什么呢？来回切换？


./kafka-console-consumer.sh --bootstrap-server ns014:9092 --from-beginning --topic manhattan_message_refund

本地机器(本质是起了一个消费者)
./kafka-console-consumer.bat --bootstrap-server ns014:9092 --from-beginning --topic manhattan_message_refund

./kafka-console-producer.bat --topic manhattan_message_refund --broker-list 127.0.0.1:9092
【在2.5.0版本之前只支--broker-list  在2.5.0版本之后支持--bootstrap-server】
1 offset清除时间是什么？
2 长时间消费者没收到消息，会rebalance，
```

```text
验证MQ有没有问题：
$ bin/kafka-topics.sh --create --topic quickstart-events --bootstrap-server localhost:9092
$ bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092
$ bin/kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092
$ bin/kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092
```

## 设计

https://docs.confluent.io/platform/current/kafka/design.html

## 实现

## FAQ

https://developer.confluent.io/learn/apache-kafka-faqs/

## 其他

[Kafka vs. Pulsar vs. RabbitMQ](https://www.confluent.io/kafka-vs-pulsar/)

[Kafka Stream vs Flink](https://www.confluent.io/blog/apache-flink-apache-kafka-streams-comparison-guideline-users/)

The Streams API in Kafka and Flink are used in both capacities. The main distinction lies in where these applications
live — as jobs in a central cluster (Flink), or inside microservices (Streams API).

The Streams API makes stream processing accessible as an application programming model, that applications built as
microservices can avail from, and benefits from Kafka’s core competency —performance, scalability, security, reliability
and soon, end-to-end exactly-once — due to its tight integration with core abstractions in Kafka. Flink, on the other
hand, is a great fit for applications that are deployed in existing clusters and benefit from throughput, latency, event
time semantics, savepoints and operational features, exactly-once guarantees for application state, end-to-end
exactly-once guarantees (except when used with Kafka as a sink today), and batch processing.

### 疑问

kafka一个topic多个消费组情况下，broker是怎么管理log的offset的呢，是每一个消费组提交自己的呢，还是共同提交？

## 类的API文档

https://docs.confluent.io/platform/current/clients/javadocs/javadoc/index.html

https://kafka.apache.org/30/javadoc/org/apache/kafka/clients/consumer/StickyAssignor.html

https://kafka.apache.org/30/javadoc/org/apache/kafka/clients/consumer/ConsumerPartitionAssignor.RebalanceProtocol.html

StickyAssignor
CooperativeStickyAssignor

## 遇到问题

[记一次kafka线上问题-消费者不消费消息了](https://blog.51cto.com/thinklili/5075367)

balance问题

自动创建topic问题