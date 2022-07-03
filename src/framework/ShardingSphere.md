# Apache ShardingSphere实战


## 进度

开始时间：2022-02-01

## 笔记

带来问题：多数据库治理，跨节点关联查询，跨节点分页和排序，全局唯一id，事务一致性，数据如何迁移？

Saga：柔性事务

定位：关系型数据库中间件

XA里面重要的是事务管理器(TM)：atomikos,narayana,bitronix，RM，AP都是现有的。

微内核架构=内核系统+插件，为了提高扩展性。API面向业务开发人员，SPI面向框架开发人员。Java中的ServiceLoader

SnowflakeShardingKeyGenerator



