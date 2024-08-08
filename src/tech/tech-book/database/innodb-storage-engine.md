# MySQL技术内幕-InnoDB存储引擎

支持事务，行锁，外键，支持MVCC，提供一致性非锁定读。其它特性：insert buffer，double write，AHI，异步IO，刷新邻接页。

next-key-locking策略解决幻读。

一致性非锁定读

三种行锁算法：1 record lock 2 gap lock 3 next key lock

在rr级别下，用next key lock避免幻读问题。

幻读：同一事务下，连续两次相同SQL导致不同的结果，可能返回不存在行。

MySQL官方文档将不可重复读定义成幻读。

缓冲池，checkpoint，

WAL：事务提交时，先写redo log，在修改页。



