# Akka Distributed Data

多点写入冲突解决：
具有中央节点的数据修改，也涉及CRDT，因为时间有先后，但是最终选哪一个也是问题。多节点更新，然后节点同步达到一致性时候，会有冲突。

除非所有写入本身就存储在一个中央节点，


akka生态至少把akka项目看完，lightbend生态


## core

convergent(收敛)

集群中节点间复制简单的会话信息。ORSet Observer Remove Set


## Related

https://github.com/lmdbjava/lmdbjava/wiki

paper: [Delta State Replicated Data Types](https://arxiv.org/abs/1603.01529)
