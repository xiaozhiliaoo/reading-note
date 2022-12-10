# Doris

领导不会看猛犸，会看有数。

Doris On ES，两个ES实现Join。

ES和MySQL进行Join。在Doris上注册。

跨库查询和联邦查询区别？

FLink写TiDB，Source Kafka写Doris。

starrocks

同时写入TiDB和Doris？场景。

rollup和物化视图区别？

定时调度，定时crud，猛犸，Azkaban。写入Doris。

FE（Java，交互，MySQL协议）和BE（C++），物理机部署，十台左右，FE三台左右。

写入LSM Tree。确定？前缀索引，稀疏索引。写入快，查询慢？Compact操作：merge on read，copy on write。

写入模型，多点还是单点。

LSM Tree和列产生关系？

向量化存储引擎。什么是向量化？https://doris.apache.org/zh-CN/docs/advanced/vectorized-execution-engine/?_highlight=%E9%87%8F%E5%8C%96

索引种类不行，多租户，资源隔离不好。贵在SSD，都是物理机。

Doris即席分析，其他架构：Hive To Doris。 有道：Doris To Hive。

数仓：

Doris还是TiDB？查询性能，不一定。

看板需求，Doris做存储末端，Kafka->Hive。

Doris Manager. 普罗米修斯监控。

TiCDC4.0有了，子航集群，没有TiCDC。

Doris建立索引，

online，offline 资源隔离，租户。

Arctic:Hive T+1取代。因为比较慢。

Hive元数据。执行引擎Hive不考虑，Spark on hive，Persteo on hive。

BE:存算结合 FE:调度节点。

SelectDB：云数仓。Doris的云数仓。

湖仓一体。

TiDB 是TiCDC。TiDB当MySQL的从。

https://selectdb.com/。

SelectDB Cloud

数据集成工具：https://github.com/alibaba/DataX：阿里云开源离线同步工具   和canal不一样。

Ceph Vs 网易开源Curve

网易数帆实时数据湖 Arctic 的探索和实践：https://www.infoq.cn/article/wgjrwk7bhrsjbh8uddhg

Doris
Compaction机制解析：https://mp.weixin.qq.com/s?__biz=Mzg5MDEyODc1OA==&mid=2247485136&idx=1&sn=a10850a61f2cb6af42484ba8250566b5&chksm=cfe016c9f8979fdf100776d9103a7960a524e5f16b9ddc6220c0f2efa84661aaa95a9958acff&scene=21#wechat_redirect

Apache Iceberg

Apache DolphinScheduler

Apache SeaTunnel

你问我DataX是谁？对不起，我活在Apache SeaTunnel的时代！：https://jishuin.proginn.com/p/763bfbd707f5

Comparison of Data Lake Table Formats (Apache Iceberg, Apache Hudi and Delta Lake)
：https://www.dremio.com/subsurface/comparison-of-data-lake-table-formats-iceberg-hudi-and-delta-lake/#toc_item_Delta%20Lake

箱子博客：https://blog.boluotou.tech/post/20220807-offline-data-warehouse/
https://github.com/gcnyin/hive-metastore-image/blob/master/build-hive-metastore.sh

深度对比 Delta、Iceberg 和 Hudi 三大开源数据湖方案

https://www.infoq.cn/article/fjebconxd2sz9wloykfo