# Apache ShardingSphere实战

## 进度

开始时间：2022-07-03

## 笔记

### 产品概念

定位：关系型数据库中间件，数据库中间件

解决方案：1 数据分片 2 读写分离 3 分布式事务 4 数据脱敏 5 编排管理

分库分表带来问题：1 多数据库治理， 2 跨节点关联查询 3 跨节点分页和排序，4 全局唯一id，5 事务一致性，6 数据如何迁移？

微内核架构=内核系统+插件，为了提高扩展性。API面向业务开发人员，SPI面向框架开发人员。Java中的ServiceLoader

### 数据分片

数据分片5大核心概念（最核心概念）：绑定表和广播表，分片策略和分片算法，强制路由和hint机制，分布式主键，连接模式，分片引擎

分片引擎包括：解析引擎，路由引擎，改写引擎，执行引擎，归并引擎。

归并类型：遍历，排序，分组，分页，聚合。归并实现：流式，内存，装饰者归并

绑定表：多个表按照同一个字段分片。 广播表：所有分片都存在的表。

唯一ID：雪花，美团Leaf，UUID，UidGenerator。SnowflakeShardingKeyGenerator

分片策略=分片算法+分片键（标准分片策略是单分片key，然后提供了=，in，>，<，between and） ShardingStrategy=ShardingAlgorithm+key

ShardingStrategy：ShardingAlgorithm = 1：n，StandardShardingStrateg包含了PreciseShardingAlgorithm和RangeShardingAlgorithm

Hint机制对主库强制路由，或者Hint机制强制路由访问目标库。Hint内容在HintManager里面。

### 读写分离

读写分离不支持多主库情况。

主库写入，从库负载均衡（Random，RoundRobin），MasterSlaveLoadBalanceAlgorithm

强制路由机制。

### 分布式事务

Saga：柔性事务

XA里面重要的是事务管理器(TM)：atomikos,narayana,bitronix，RM，AP都是现有的。

TransactionType：Local，XA，BASE。

SeataAT是柔性事务。

强一致性事务XA，最终一致性事务BASE

