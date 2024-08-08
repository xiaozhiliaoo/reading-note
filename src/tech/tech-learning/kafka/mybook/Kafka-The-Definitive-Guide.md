# Kafka权威指南-第二版


# 书名

作者：

分类：

相关书籍：

## 进度

阅读记录：开始时间：2024-08-08 ~ 结束时间：YYYY-MM-dd

阅读页数：


## 笔记

JBOD，RAID

kafka的可靠性是配置出来的。

Kafka对可靠性保证：
1. 分区内消息有序。
2. 消息被写入分区所有的**同步副本**时才被认为“已提交”。
3. 只要一个副本活动，已提交消息不会丢失。
4. 消费者只能读取已经提交的消息。

可靠性是：消息存储可靠性和一致性的重要程度与可用性，高吞吐，低延迟和硬件成本重要程度的一种权衡。

不同步副本：1.与zk断开连接 2.不在复制新消息 3.复制消息滞后了10s。

不同步副本和副本不可用是不同的。不同步副本不一定副本不可用，副本不可用，一定会不同步副本。

复制系数。

消费者提交偏移量+消费消息关系很重要。自动提交会导致重复消费。

```text
可靠性是配置出来的：

broker配置：
1. 复制系数：replication.factor
2. 不彻底的首领选举：unclean.leader.election.enable
3. 最少同步副本：min.insync.replicas 
4. 保持副本同步 zookeeper.session.timeout.ms（broker发送zk心跳间隔）和 replica.lag.time.max.ms(指定时间从leader复制数据)，
5. 磁盘持久化：flush.message flash.ms

producer配置：
1. 发送确认：acks
2. 重试与幂等：delivery.timeout.ms enable.idempotence retries

consumer配置：
1. group.id
2. auto.offset.reset
3. enable.auto.commit
4. auto.commit.interval.ms
```

消费者经常重平衡，就不是可靠的。

```text
自动提交偏移量：轮询结束时提交偏移量。轮询里提交。
手动提交偏移量：提交频率是性能与重复消息之间权衡。在正确时间点提交正确的偏移量，一定要在消息处理完之后提交偏移量。提交
已读取但未处理消息的偏移量导致消费者错过消息。消息错过比消息重复更严重。
```
kafka投递语义：至少一次，精确一次

消息丢失：1 生产者保证发出去（核心保证） 2 broker保证多副本+落磁盘 3 消费者保证不漏消息（消息还在，只是没有消费）
消息重复：1 生产者幂等 2 broker拒绝重复消息 3 消费者不重复消费（核心保证：处理消息+提交偏移量）
消息顺序：1 单分区消息有序（核心保证） 2 retries>0 && max.in.flight.requests.per.connection>1 && enable.idempotence=false，批次顺序可能会反，有重排序可能性。但是一个批次是有序的。retries>0 && max.in.flight.requests.per.connection=1也可以保证，但是可用性变低了。
enable.idempotence=true && max.in.flight.requests.per.connection<=5 && retries>0 可以保证有序+重试消息不重复。
 

消息写入成功指的是发送去确认acks=1，0，-1。和消息已经提交写入所有同步副本不是一个概念。acks=1写入leader，但是不一定提交了。
acks=-1，写入所有同步副本，但是没有重试，消息也会丢失。

不丢消息，重试，可能产生重复消息。

已提交消息（写入所有同步副本）和已提交偏移量（消费者发送kafka的偏移量，用于确认最后一条消息在分区位置）。

HW(HighWatermark),OSR(Out-Sync Relipcas),ISR(In-Sync Replicas),AR(Assigned Repllicas),LEO(LogEndOffset),LSO(LogStartOffset)，CO(ConsumerOffset-已提交偏移量)

Lag=HW-CO或LEO-CO

kafka事务消息保证流处理模型：消费-处理-生产，保证原子多分区写入。提交偏移量到_consumer_offsets主题，写入结果到输出主题。

kafka实现精确一次性语义：1 幂等生产者（避免重试机制导致的重复处理） 2 事务（Stream精确一次性语义基础） 

# 配置参数

## broker

broker.id

listeners

zookeeper.connect

log.dirs

num.recovery.threads.per.data.dir

auto.create.topics.enable

auto.leader.rebalance.enable

delete.topic.enable

### broker in os

vm.swappiness

vm.dirty_background_ratio

vm.overcommit_memory

net.core.wmem_default

net.core.rmem_default

net.ipv4.tcp_window_scaling

net.ipv4.tcp_max_syn_backlog

net.core.netdev_max_backlog

G1:MaxGCPauseMillis和InitiatingHeapOccupancyPercent

## topic

num.partitions=1

default.replication.factor=1

log.retention.ms

log.retention.bytes

log.segment.bytes

log.roll.ms

min.insync.replicas

message.max.bytes

## producer

bootstrap.server

key.serializer

value.serializer

client.id

acks

max.block.ms

delivery.timeout.ms

request.timeout.ms

retries

retry.backoff.ms

linger.ms

buffer.memory

compression.type

batch.size

max.in.flight.requests.per.connection

max.request.size

receive.buffer.bytes

send.buffer.bytes

enable.idempotence

## consumer

fetch.min.bytes

fetch.max.wait.ms

fetch.max.bytes

max.poll.records

max.partition.fetch.bytes

session.timeout.ms

heart.interval.ms

max.poll.interval.ms

default.api.timeout.ms

request.timeout.ms

auto.offset.reset

enable.auto.commit

partition.assignment.strategy

client.id

client.rack

group.instance.id

receive.buffer.bytes

send.buffer.bytes

offsets.retention.minutes











