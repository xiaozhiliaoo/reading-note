# Akka Cluster


## 学习进度

https://doc.akka.io/docs/akka/current/typed/cluster.html#


## 笔记


application membership(heartbeat, gossip)

CAP:

available(pick up consistency):membership,distributed data,pubsub,multi-dc support
consistency:singleton,sharding,leases


stateful applications

集群单例生成唯一用户ID

Akka Persistent + Akka Singleton 生成唯一用户ID

计算集群总请求数。

发现资源不够，会自动扩展actor来处理任务，资源充足，会减少actor来处理任务

全局状态：集群单例actor实现

actor中有阻塞操作该怎么办？

如果一个分片挂了，那么akka cluster shard是如何处理任务的？

集群路由感知器比集群单例更通用的构造。一个actor可以将任务推给多个worker.


Classic Cluster Aware Router:https://doc.akka.io/docs/akka/current/cluster-routing.html


