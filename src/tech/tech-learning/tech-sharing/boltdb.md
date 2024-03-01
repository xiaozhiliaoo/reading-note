# boltdb

```text
KV领域基本被GO占据了。JAVA缺很少。
竞品：https://github.com/xujiajun/nutsdb
https://github.com/tidwall/buntdb
https://github.com/dgraph-io/badger
LMDB: Lightning Memory-Mapped Database Manager (LMDB)
研究  write和mmap
boltdb PK levelDB
理论结合实践详解 B+ 树存储引擎（InnoDB、BoltDB、BuntDB）
https://mp.weixin.qq.com/s/aSNdEkNdeCAC7O6b3coo-A
理论结合实践详解 lsm 树存储引擎（bitcask、moss、leveldb 等
https://github.com/couchbase/moss
https://github.com/cockroachdb/pebble
https://github.com/roseduan/rosedb
https://mp.weixin.qq.com/s/QxTtNdtkrJxRhaxUEKTqSg
B站非常好的学习视频：https://www.bilibili.com/video/BV1Zv411G7ty
```

```text
怎么跑起来单元测试的呢？添加mod了吗？
etcd的wal用了boltdb
read/write两次传输，一次文件和内核高速缓冲，一次高速缓冲区和用户空间缓冲区。
页对齐，大文件，读多写少场景。
缺页，会导致性能很差。
内存映射优势在大型文件中执行重复随机访问性能最好。读多于写适合。
如果顺序得访问一个文件，并假设执行IO时缓冲区足够大以至于避免大量IO 系统掉调用，此时和read，write相比，mmap优势有限或者根本没有优势。提升有限是因为整个文件在磁盘和内存只传一次，效率提高在于减少用户空间和内核空间的一次数据传输，并且与磁盘IO时间相比，内存使用量降低基本可以忽略。
嵌套是为了实现关联关系，比如es的嵌套结构。
数据库关联的实现是什么？
如何支持range查询？
mapdb.........
madvise：预读。
system-call：flock，mmap，madvise，fcntl，munmap，fdatasync，FreeList，
读：mmap(share, PROT_READ,MAP_SHARE)
写：fdatasync
https://en.wikipedia.org/wiki/Free_list

缺页中断。https://zh.wikipedia.org/wiki/%E9%A1%B5%E7%BC%BA%E5%A4%B1
  https://en.wikipedia.org/wiki/Page_fault
https://liam.page/2017/09/01/page-fault/
https://stackoverflow.com/questions/66828363/why-does-malloc-cause-minor-page-fault
```

