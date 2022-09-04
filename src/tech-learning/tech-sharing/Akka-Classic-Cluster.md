# Akka Classic Cluster

## 介绍

时间: 2022年4月13日

## PPT

做完上传到Google Doc

## 内容简介

## 内容列表

### 集群基本概念(概念本身和AKKA特有的概念，成员状态，集群演示)

Cluster API Extension:Joining and Leaving a Cluster,Cluster Subscriptions,Cluster State Cluster Membership API:
Joining,Leaving,Downing Node Roles:
Failure Detector:
Test Configuration:
Higher level Cluster tools:Cluster Singleton,Cluster Sharding,Distributed Data,Distributed Publish Subscribe,Cluster
aware routers ,Cluster across multiple data centers,Reliable Delivery

### 集群功能与模块（带演示集群状态变更和脑裂/集群案例）

ShardRegion ShardCoordinator

Cluster Sharding:ShardCoordinator,Message,ShardRegion,Shard,Entity

Distributed Publish Subscribe:

### 集群设计与实现

Akka Cluster provides a fault-tolerant decentralized peer-to-peer based Cluster Membership Service with no single point
of failure or single point of bottleneck. It does this using gossip protocols and an automatic failure detector.

### 集群使用场景-教务案例

### 源码速览

akka-cluster：remote，coordination，

akka-cluster-sharding：cluster，distributedData，persistence，clusterTools

akka-cluster-tools：cluster，coordination

akka-distributed-data：cluster

akka-coordination：actor

### 集群其它技术

和分布式的区别（stateless vs stateful）

和服务注册发现区别

去中心化和中心化区别是什么？通信协议(gossip)，节点职责？

membership change:raft是配置,akka cluster是节点。

membership（每个人知道全部节点）

availability：membership,distributed data,PubSub，Multi-DC consistency: singletons,sharding,lease

### Classic Cluster和Typed Cluster的区别

Reliable delivery

### Akka与应用架构

反应式架构

Fast Data Architectures for Streaming Applications

LAMP VS SMACK

Akka Play Lagom

### 参考

https://doc.akka.io/docs/akka/current/project/examples.html

akka sbr(Akka Split Brain
Resolver):https://www.lightbend.com/blog/lightbend-to-contribute-commercial-features-to-akka-open-source

### 实验

脑裂:
sh akka cluster start

sh akka node stop 9

sh akka node down 8
