# 深入理解Elasticsearch(原书第三版)

## 进度

阅读完成

## Notes

prefix-query不会被分析，match query会被分析

es1.0多播发现机制，2.0单播默认发现机制。zen discovery

ingest等价于java版logstash节点

shrink api 索引收缩

查询数据：查询，过滤器

normalization 归一化

BM25和TF-IDF

es当作NOSQL，无分析查询会更好。也即精确查询。

基本查询：match,multi_match,common,fuzzy_like_this,fuzzy_like_this_field,geoshape,ids,match_all,query_string,simple_query_string
range,prefix,regex,span_term,term,terms,wildcard

组合查询：bool,boosting,constant_score,dis_max,filtered,function_score,has_child,has_parent,indices,nested,span_first,span_multi,
span_near,span_not,span_or,span_term,top_children

无分析查询：term，terms,common,ids,prefix,span_term,wildcard

全文检索：match,multi_match,query_string,simple_query_string

模式匹配：prefix,regexp,wildcard

相似度查询: fuzzy,fuzzy_like_this,fuzzy_like_this_filed,more_like_this,more_like_this_field

支持修改分数查询：boosting,constant_score,function_score,indices

位置敏感：match_pjrase,span_first,span_multi,span_near,span_not,span_or,span_term

结构敏感：nested,has_child,has_parent,top_children

查询改写：prefix，rewrite参数

es使用mustache实现查询模板

multi_match匹配类型：best_fields,most_fields,cross_fields,phrase,phrase_prefix

es管理关系型提供了：嵌套，父子文档结构

处理人类语言。

文档通过路由知道放在哪一个分片上面了。

集群主节点任务：节点间分配分片。

分片是一个lucence索引。

相似度模型（similarity）：TF-IDF，BM25，DFR，DFI，IB，LM Dirichlet,LM JelinekMercer

store模块：lucene和io子系统的抽象：niofs,simplefs,mmapfs,fs

Searcher重新打开的过程：refresh，默认1s

flush：将事务日志同步到lucene index，同时清空事务日志。默认5s

实时读取：从事务日志中读取。

段合并耗费性能的操作。

并发合并调度器：ConcurrentMergeScheduler

NRT:近实时

发现模块：选主，发现新节点，形成和发现新节点过程叫发现。
Zen发现模块单播(unicast)发现集群中其他节点。

微服务发现是发现别人，但是自己发现不了。

es恢复过程：加载通过网关模块存储的数据以使得es正常工作。每当集群整体启动时候，恢复过程就会启动，加载所有数据：元数据，映射和全部索引。
网关模块存储es正常运行的全部数据。

es可以备份到s3，hdfs，gcs，azure

ingest处理器，内置23个等。append，convert，grok，fail等等。。。grok自带了120多种grok模式。

联盟搜索：跨集群搜索，通过部落节点

部落节点从所有连接的集群中获取集群状态，合并成一个集群状态。

percolation（过滤），suggester（联想，建议器）

查询验证 validate api

查询分析器：profile api

dfs query then fetch

发现集群变慢，阻塞等情况时候，可以看到热点线程api，看哪些线程耗费cpu，io等信息 hot_threads 

当数据量够大，查询够复杂时候，就会碰到内存问题，此时增加更多内存也无济于事。

增加主分片：内存溢出，分片查询时间过长，内存交换，高IO等待等问题
增加副本分片：流量过高节点无法处理的时候，增加查询能力。

集群缺少部分节点数据，比完全不响应查询要好。

防止分片和副本部署在同一个节点，此时失去了高可用能力了。使用awareness能力。

集群部署：两个聚合节点，n个数据节点，三个候选主节点，冗余3个。设置minimum_master_nodes:2，可以避免脑裂发生。

索引刷新频率：文档需要多久才能出现在搜索结果里面。默认1s，意味着每1s索引查询器重新打开一次。

查询：总应该思考最优的查询结构，过滤器使用等。

不使用路由情况下，es会查询所有分片。如果知道文档在哪一个路由里面，将会提高效率。

索引只在一个分片上面，查询性能较差，增加副本分片对性能提高无用，需要将索引分为多个分片。把数据平均负载。

聚合查询：size:最后聚合结果返回多少组数据，shard_size：每个分片返回多少组数据。 降低size和shard_size会让聚合结果不那么准确，但是网络开销小，内存使用低。

过多的副本会导致索引速度下降。

es 预写日志WAL，tranlog，get请求获取最新的数据，确保数据持久化，优化lucene index的写入。

SSD优于HDD

基于时间的索引管理：shrink和rollover
shrink api 减少主分片，生成新的索引。只有只读才能收缩。