# mongodb权威指南第二版

MongoDB:the definitive guide, second edition

# 进度

P201

# 笔记
ObjectId

mongorc.js

mongo shell 是js程序

padding factor

"$where"查询比常规的查询慢很多。

limit,skip,sort

mongodb explain命令

建立索引 ensureIndex

mongodb每个集合只能有64个索引，复合索引也有顺序

'_id'索引是典型的右平衡索引。右平衡索引树。

只有需要多个查询条件进行排序时候，索引方向才是重要的。

覆盖索引：covered index

数组字段做索引，永远无法覆盖。

索引基数。一个字段基数越高，建立索引越有用。

explain不使用索引：BasicCursor，使用索引：BtreeCursor

查询优化器：并行执行，返回最快的100个就是胜者。

索引需要两次查找，全表扫描只需要一次。

文档会在磁盘移动。

GirdFS是MongoDB中存储大文件的标准方式，使用了复合唯一索引。

稀疏索引：spares index

特殊集合：固定集合，TTL索引，全文本索引，地理空间索引（2dsphere，GEOJSON），GridFS。

GridFS：将大文件分割为多个比较大的块，将每一个块作为独立的文档进行存储。不常改变但是经常需要连续访问的大文件，适合GridFS.

聚合：聚合框架，Map-Reduce，Cmd(count,group,distinct)

mongodb没有join.查询只能在一个集合内。范式化提高写入速度，反范式化提高读取速度。

数据变化频繁，范式化较好，不频繁，反范式化较好。

副本集：只有达到大多数才能选举或者维持主节点，为了避免出现多个主节点。
支持单一主节点。

mongodb复制功能基于oplog实现的，oplog按顺序保存所有执行过的写操作，每个成员维护着一份自己的oplog，每个成员的oplog应该和主节点的oplog完全一致。

# 参考