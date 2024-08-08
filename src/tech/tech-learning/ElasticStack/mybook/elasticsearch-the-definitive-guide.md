# Elasticsearch权威指南

Elasticsearch: The Definitive Guide: A Distributed Real-Time Search and Analytics Engine 1st Edition

中文：https://www.elastic.co/guide/cn/elasticsearch/guide/current/index.html

英文：https://www.elastic.co/guide/en/elasticsearch/guide/current/index.html

## Progress

100%

https://www.elastic.co/guide/cn/elasticsearch/guide/current/_creating_an_index.html

## Notes

对文档进行索引、检索、排序和过滤，而不是对行列数据

query string轻量级搜索，bool查询+filter。

聚合的结果数据并非预先统计，而是根据匹配当前查询的文档即时生成的。

Elasticsearch 可以横向扩展至数百（甚至数千）的服务器节点，同时可以处理PB级数据

全文搜索：match查询，match_phrase查询
关键词搜索：term查询

Elasticsearch 默认按照相关性得分排序，即每个文档跟查询的匹配程度。

ES屏蔽了分布式系统复杂性，如下：
```text
分配文档到不同的分片中，文档可以储存在一个或多个节点中
按集群节点来均衡分配这些分片，从而对索引和搜索过程进行负载均衡
复制每个分片以支持数据冗余，从而防止硬件故障导致的数据丢失
将集群中任一节点的请求路由到存有相关数据的节点
集群扩容时无缝整合新节点，重新分配分片以便从离群节点恢复
```

分布式架构概念：集群，节点，分片，副本

```text
节点特性：
1.当有节点加入集群中或者从集群中移除节点时，集群将会重新平均分布所有的数据。
2.当一个节点被选举成为主节点时，它将负责管理集群范围内的所有变更，例如增加、删除索引，或者增加、删除节点等。 
而主节点并不需要涉及到文档级别的变更和搜索等操作，所以当集群只拥有一个主节点的情况下，即使流量的增加它也不会成为瓶颈。 
任何节点都可以成为主节点。
3.可以将请求发送到集群中的任何节点，包括主节点。每个节点都知道任意文档所处的位置，并且能够将请求直接转发到存储我们所需文档的节点。 
无论将请求发送到哪个节点，它都能负责从各个包含我们所需文档的节点收集回数据，并将最终结果返回給客户端。 
```

```text
集群健康：
Green：所有主副分片可运行。
Yellow：所有主分片运行，副本分片部分不可用。
Red：部分主分片不可用。
```

索引指向一个或者多个物理分片的逻辑命名空间。一个分片是一个底层的工作单元，它仅保存了全部数据中的一部分。一个分片是一个Lucene的实例，以及它本身就是一个完整的搜索引擎。

文档保存在分片内，分片又被分配到集群内的各个节点里。当集群规模扩大或者缩小时，ES会自动的在各节点中迁移分片，使得数据仍然均匀分布在集群里。

在索引建立的时候就已经确定了主分片数，但是副本分片数可以随时修改。 "number_of_shards" : 3, "number_of_replicas" : 1

分片是一个功能完整的搜索引擎。





CAP：CP系统一般用了共识协议，没用的一般AP。Cassandra 可调一致性调节到CP，用的是quorum策略。

TF-IDF:词频/逆向文档频率(term frequency inverse document frequency)

es两个阶段：索引和查询

stemmer:词干提取器,Hunspell 词干提取器（拼写检查）

synonyms：同义词

字典词干提取器，算法化词干提取器

实践中一个好的算法化词干提取器一般优于一个字典词干提取器。

保留停用词最大的缺点就影响搜索性能。

索引结构：Terms dictionary，Postings list，Term frequency，Positions，Offsets，Norms

common_grams 过滤器是针对短语查询能更高效的使用停用词而设计的。

Fuzzy matching 允许查询时匹配错误拼写的单词。原理是编辑距离

fuzzy 查询的工作原理是给定原始词项及构造一个 编辑距离自动机 — 像表示所有原始字符串指定编辑距离的字符串的一个大图表。

聚合=bucket+metrics bucket=group by metrics=count,sum,max...

<国家, 性别, 年龄> 组合的平均薪酬。所有的这些都在一个请求内完成并且只遍历一次数据.

直方图聚合：histogram，date_histogram

聚合是在查询范围内的，但有时要搜索它的子集，而聚合的对象却是所有数据：全局桶

聚合结果过滤：过滤桶

只过滤搜索结果，不过滤聚合结果：post_filter

Approximate Aggregations（近似聚合）：cardinality（HyperLogLog），percentiles（TDigest- https://github.com/tdunning/t-digest ）

max是精确聚合，count(DISTINCT)是近似聚合

大数据：精确性，实时性，延时的不可能三角

```text
精确+实时：数据可以存入单台机器的内存之中，我们可以随心所欲，使用任何想用的算法。结果会 100% 精确，响应会相对快速。 
大数据+精确：传统的Hadoop。可以处理PB级的数据并且提供精确的答案，但它可能需要几周的时间才能提供这个答案。 
大数据+实时：近似算法为提供准确但不精确的结果。
```

```text
聚合实现：DocValues
DocValues的存在是因为倒排索引只对某些操作是高效的。 
倒排索引的优势在于查找包含某个项的文档，而对于从另外一个方向的相反操作并不高效，即：确定哪些项是否存在单个文档里
搜索使用倒排索引查找文档，聚合操作收集和聚合DocValues里的数据。 
DocValues本质上是一个序列化的列式存储。列式存储 适用于聚合、排序、脚本等操作DocValues 不支持 analyzed 字符串字段。
聚合运行在 not_analyzed 字符串而不是analyzed 字符串，这样可以有效的利用DocValues。

聚合一个分析字符串：FieldData
```

terms 桶基于数据动态构建桶，它并不知道到底生成了多少桶。大多数时候对单个字段的聚合查询还是非常快的，但是当需要同时聚合多个字段时，就可能会产生大量的分组，最终结果就是占用 es 大量内存，从而导致 OOM 的情况发生。

聚合模式：DFS(默认)，BFS

BFS广度优先仅仅适用于每个组的聚合数量远远小于当前总组数的情况下，因为广度优先会在内存中缓存裁剪后的仅仅需要缓存的每个组的所有数据，以便于它的子聚合分组查询可以复用上级聚合的数据。

对单个文件的变更是ACID的，但包含多个文档的变更不支持。

每个字段的所有数据都是默认被索引的。

逻辑概念索引，物理概念分片。

搜索比查询复杂，包括了分词，意图猜测，近义词，纠错等等。查询是精确匹配的。

分析：分词和标准化。分词产出token，标准化提高可搜索性。ES通过分析器实现了功能，包括字符过滤器，分词器，Token过滤器。