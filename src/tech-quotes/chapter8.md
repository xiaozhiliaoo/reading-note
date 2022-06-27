* 800 JDK源码必须作为个人学习Java技术的最重要基础，就像JDK是你的作品一样热爱。

---

* 801 面试候选人，同等水平下，会算法的优先考虑。

---

* 802 Effevtive Java：JDK源码指南。

---

* 803 Spring核心：给POJO提供声明式服务。

---

* 804 Java最值得投资学习的是集合和并发包。

------

* 805 Google，Amazon等论文更像是工程经验，并不学术论文。Google如何做系统？真正的系统设计是什么样的？为什么构建一个分布式系统会这么复杂？

---

* 806 技术学习：首先技术本身，其次技术生态（公司其他产品，关联上下游，定位等），最后技术商业。

---

* 807 算法，论文是科学主义，算法要证明正确，而不是跑通就行。论文要严谨，有数据有结论。工程是经验主义和实用主义，每个知识点很多，但是每一个都不复杂。也不会全部用到，能跑就行。

---

* 808 思维密度排行：数学>算法>工程，算法是对一个人思维活跃度，以及严谨程序，代码速度的考察。学好数学不应该局限于学好知识点，而是数学思维。

------

* 809 一个知识背后代表了一种思维模型。分布式系统思维模型，经常和一致性，共识性，复制。而数据系统，经常和事务，数据模型，存储模型，读写模型有关系。一个事物，有多种角度(模型)去理解。
  模型可以用来：推理，解释，设计，沟通，行动，预测，探索。

---

* 810 工程技术要学全面，但是不一定很深入。全：某个技术的知识体系。

---

* 811 技术深度因人而异，因事而异。深度应该关于思考，而不是知识本身。

---

* 812 技术考察维度：深度，广度，全面，质量，通达。

---

* 813 分布式系统的问题会在协议层，中间件(存储)层，应用框架层出现。越往上越对开发不透明。虽然都会在某种程度减少复杂度，但是最上层需要。

---

* 814 分布式系统关键一问：节点变化(新加，删除，宕机，超时，网络延迟)时，系统会发生了(一致性，可用性，正确性，复制)什么？

---

* 815 思维的强度以及复杂度：CS教材和算法。体系化培养的是思考问题能力和深度。

---

* 816 我们有时候过早陷入细节，而对设计问题闭口不谈。

---

* 817 AQS是基于状态的同步框架。实现类需要思考，状态是什么？

---

* 818 同步可以通过阻塞和非阻塞实现。

* | 类                         | 阻塞同步 | 非阻塞同步 |
            | -------------------------- | -------- | ---------- |
  | 原子变量                   |          | √          |
  | synchronize                | √        |            |
  | AbstractQueuedSynchronizer | √        |            |
  | LockSupport                | √        |            |
  | ReentrantLock              | √        |            |
  | ReentrantReadWriteLock     | √        |            |
  | StampedLock                | √        |            |
  | ArrayBlockingQueue         | √        |            |
  | ConcurrentHashMap          |          |            |
  | ConcurrentLinkedQueue      |          | √          |
  | ConcurrentSkipListMap      |          | √          |

---

* 819 多进程：多个进(线)程为你干活。分布式：多个机器为你干活。

---

* 820 一些系统的模板：
    * **AVO**(Atomic, Visible, Ordering)。
    * **ACID**(atomicity, consistency, isolation, durability)。
    * **C-LSP**(Correctness：Liveness, Safety, Performance)。
    * **APCNSCRFS**(Architectures, Process, Communication, Naming, Synchronization, Consistency and Replication,
      Faluttolerance, Security)。
    * **RCM**(Reliablity，Scalablity，Maintainable)。
    * **CAP**(Consistency, Availability, Partition tolerance)。
    * **RUM**(Read Update Memory)。
    * **MSERPTCC**(Model, Storage, Encoding, Replication, Partitioning, Transaction, Consistency and Consensus)。
    * **PACELC**（Partition tolerance，Availability，Consistency， Else， Latency， Consistency）。

---

* 821 分布式系统先研究功能，后研究分布式特性(如泛型和MSERPTCC)。从分布式特性看功能特性，如同提供kv服务的redis，consul，etcd功能类似，但是分布式特性截然不同。对于工程技术选型来说，最重要的是复制和一致性特性。

---

* 822 技术选型： 同样的功能**不同类型**，**同类型**的系统或中间件实现，最本质的区别是：系统设计以及架构权衡。

---