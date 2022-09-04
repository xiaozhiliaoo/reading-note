# ElasticSearch



## 学习进度

看到这里了：https://www.elastic.co/guide/cn/elasticsearch/guide/current/_preventing_combinatorial_explosions.html


## 笔记

[es历史](https://www.elastic.co/about/history-of-elasticsearch)


[shay banon](https://www.elastic.co/blog/author/shay-banon)

Near Real Time

[节点类型](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html)

打分机制：从TF-IDF改成BM25，也叫[similarity](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-modules-similarity.html) ，scoring，ranking

oversharding问题,如何创建分片数？

如何知道数据在集群中的哪个节点？

es和mysql数据模型区别？

结构化搜索和全文搜索

全文搜索：传统数据库确实很难搞定的任务，传统数据库要么匹配，要么不匹配，es有相关性打分。

PB级别，数百台服务器

一个分片是一个 Lucene 的实例，以及它本身就是一个完整的搜索引擎

每个字段的所有数据都是默认被索引的

index是逻辑概念，面向用户，shard是物理概念，面向机器，应用程序关心索引，而不是分片

Elasticsearch中文档是不可改变的，不能修改它们，在内部，Elasticsearch 已将旧文档标记为已删除，并增加一个全新的文档，并且会重新进行索引。

更新文档：标记删除，创建文档，重新索引，检索-修改-重建索引

文档中的每个字段都将被索引并且可以被查询

在分布式系统中深度分页:在分布式系统中，对结果排序的成本随分页的深度成指数上升

filed:精确值，全文值

很少对全文类型的域做精确匹配

Doc Values:排序，聚合，脚本计算
Invert Index:检索

文档的唯一性：index，type，routing value

检索过程：query then fetch 先查后取
分片节点：from+size
协调节点：numberOfShard * (from+size)

scroll 查询禁用排序

搜索类型：query then fetch，dfs_query_then_fetch

深度分页的代价根源是结果集全局排序，如果去掉全局排序的特性的话查询结果的成本就会很低。

Data Replication:Primary-Backup

in-sync shard（可以被选中为primary的shard）

index配置最重要的是：number_of_shards(创建后更改不了)，number_of_replicas(创建后可以修改)

_id 和 _index 字段则既没有被索引也没有被存储，这意味着它们并不是真实存在的。

不能添加新的分析器或者对现有的字段做改动。 如果你那么做的话，结果就是那些已经被索引的数据就不正确， 搜索也不能正常工作。reindex

修改索引类型：https://www.elastic.co/guide/cn/elasticsearch/guide/current/index-aliases.html

应用中使用索引别名，而不是索引真实名字。这样在修改索引时候，应用层不需要变化。

全文检索=全字段索引

倒排索引被写入磁盘后是 不可改变 的
在保留不变性的前提下实现倒排索引的更新？答案是: 用更多的索引。

一个 Lucene 索引包含一个提交点和三个段

一个 Lucene 索引 我们在 Elasticsearch 称作 分片 。 一个 Elasticsearch 索引 是分片的集合

段是不可改变的

内存索引缓冲区

按段搜索

写入和打开一个新段的轻量的过程叫做 refresh，每1s refresh下

Elasticsearch是近实时搜索: 文档的变化并不是立即对搜索可见，但会在一秒之内变为可见

Flush：执行一个提交并且截断 translog 的行为在 Elasticsearch 被称作一次 flush，30分钟一次。
Flush之后段被全量提交，并且事务日志被清空

减少段的数量（通常减少到一个），来提升搜索性能。

结构化搜索：要么在，要么不在，和打分机制无关系。也就是和相似度无关。

精确值查找时候，需要用filter，不会被打分，会被缓存。

尽可能多的使用过滤式查询。

constant_score(常量评分查询) 将 term 查询转化成为过滤器。

term查询转成constant_score查询。（非评分查询）

非评分计算是首先执行的，这将有助于写出高效又快速的搜索请求。

bool过滤器，也叫复合过滤器。

查看索引别名：GET /finance_netease_settle_order/_alias

布尔过滤器可以用来作为构造复杂逻辑条件的基本构建模块。

term 和 terms 是 包含（contains） 操作，而非 等值（equals）

查询优化：普通查询 -> bool filter -> constant_score filter

exists(!=null),missing(==null)查询

filter query 实现bitset的roraing bitmap

bool match查询

多数字符串字段都是 not_analyzed 精确值字段

dfs_query_then_fetch： dfs是指分布式频率搜索（Distributed Frequency Search） ， 它告诉 Elasticsearch ，
先分别获得每个分片本地的 IDF ，然后根据结果再计算整个索引的全局 IDF 。

多字段搜索：bool match查询

dis_max：分离最大化查询（Disjunction Max Query)

全文搜索被称作是 召回率（Recall） 与 精确率（Precision） 的战场
召回率 ——返回所有的相关文档； 
精确率 ——不返回无关文档

TF/IDF

字段中心式（term-centric）查询：best_fields 和 most_fields
词中心式（term-centric）的查询：cross_fields

自定义单字段查询是否能够优于多字段查询，取决于在多字段查询与单字段自定义 _all 之间代价的权衡，
即哪种解决方案会带来更大的性能优化就选择哪一种。

multi_match 查询中避免使用 not_analyzed 字段。

短语匹配(match_phrase查询)

http://people.apache.org/~mikemccand/lucenebench/

unigrams ,bigrams(shingles)，trigrams，

shingles 不仅比短语查询更灵活，而且性能也更好。 shingles 查询跟一个简单的 match 查询一样高效，而不用每次搜索花费短语查询的代价。

prefix 查询不做相关度评分计算，它只是将所有匹配的文档返回，并为每条结果赋予评分值 1 。它的行为更像是过滤器而不是查询。

search-as-you-type：match_phrase_prefix

Boolean Model:只是在查询中使用 AND 、 OR 和 NOT

Lucene 使用 布尔模型（Boolean model） 、 TF/IDF 以及 向量空间模型（vector space model） ，然后将它们组合到单个高效的包里以收集匹配文档并进行评分计算。

bool 查询实现了布尔模型

查询时的权重提升 是可以用来影响相关度的主要工具

constant_score 和 function_score区别？

一致随机评分（consistently random scoring） 

similarity算法：BM25，TF-IDF

全文搜索是一场 查准率 与 查全率 之间的较量—查准率即尽量返回较少的无关文档，而查全率则尽量返回较多的相关文档。

es多字段，可对字段建立两次索引。文本做两次索引

stem 词干 stemmer  词干提取器

多语言设计：index-per-language， field-per-language 

Elasticsearch 为什么不能在 analyzed （分析过）的字符串字段上排序，并演示了如何为同一个域创建 复数域索引 ，
其中analyzed域用来搜索，not_analyzed域用来排序。

Analyzed 域无法排序并不是因为使用了分析器，而是因为分析器将字符串拆分成了很多词汇单元，就像一个 词汇袋 ，
所以 Elasticsearch 不知道使用那一个词汇单元排序。

analyzed name域用来搜索。
not_analyzed name.raw 域用来排序。

International Components for Unicode (ICU) 

单词还原成词根。比如foxes还原成fox.










## Internals

https://www.elastic.co/blog/found-elasticsearch-internals
https://www.elastic.co/blog/found-elasticsearch-networking




## 遇到问题

1.forbidden-12-index-read-only-allow-delete-api?

某个节点的磁盘满了，需要运维清理下磁盘



## Course

https://github.com/xiaozhiliaoo/geektime-ELK

https://github.com/xiaozhiliaoo/search-practice

