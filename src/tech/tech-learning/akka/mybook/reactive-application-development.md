# 反应式应用开发

## Progress


## Notes

Akka的actor模型中，并没有提供因果一致性，因此落在了开发人员，需要通过Process Manager模式完成Become/Unbecome实现因果一致性。

反应式架构默认是分布式的。

Akka分片：跨集群中多个节点自动分布具有标识符的actor.



## Question

消息，命令，事件区别？