# Elasticsearch权威指南

## Progress

100%


## Notes

Elasticsearch: The Definitive Guide: A Distributed Real-Time Search and Analytics Engine 1st Edition

TF-IDF:词频/逆向文档频率

es两个阶段：索引和查询

stemmer:词干提取器

synonyms：同义词

字典词干提取器，算法化词干提取器

实践中一个好的算法化词干提取器一般优于一个字典词干提取器。

Hunspell 词干提取器（拼写检查）

保留停用词最大的缺点就影响搜索性能。

索引结构：Terms dictionary，Postings list，Term frequency，Positions，Offsets，Norms

common_grams 过滤器是针对短语查询能更高效的使用停用词而设计的。

Fuzzy matching 允许查询时匹配错误拼写的单词。原理是编辑距离

fuzzy 查询的工作原理是给定原始词项及构造一个 编辑自动机— 像表示所有原始字符串指定编辑距离的字符串的一个大图表。

聚合=bucket+metrics
bucket=group by metrics=count,sum,max...

 <国家, 性别, 年龄> 组合的平均薪酬。所有的这些都在一个请求内完成并且只遍历一次数据.

直方图聚合：histogram，date_histogram


例子基础数据
POST /cars/transactions/_bulk
{ "index": {}}
{ "price" : 10000, "color" : "red", "make" : "honda", "sold" : "2014-10-28" }
{ "index": {}}
{ "price" : 20000, "color" : "red", "make" : "honda", "sold" : "2014-11-05" }
{ "index": {}}
{ "price" : 30000, "color" : "green", "make" : "ford", "sold" : "2014-05-18" }
{ "index": {}}
{ "price" : 15000, "color" : "blue", "make" : "toyota", "sold" : "2014-07-02" }
{ "index": {}}
{ "price" : 12000, "color" : "green", "make" : "toyota", "sold" : "2014-08-19" }
{ "index": {}}
{ "price" : 20000, "color" : "red", "make" : "honda", "sold" : "2014-11-05" }
{ "index": {}}
{ "price" : 80000, "color" : "red", "make" : "bmw", "sold" : "2014-01-01" }



聚合是在查询范围内的，但有时我们也想要搜索它的子集，而聚合的对象却是所有数据：全局桶

聚合结果过滤：过滤桶

只过滤搜索结果，不过滤聚合结果：post_filter

Approximate Aggregations（近似聚合）：cardinality（HyperLogLog），percentiles（TDigest-https://github.com/tdunning/t-digest） 

max是精确聚合，count(DISTINCT)是近似聚合

big data, exactness, and real-time latency.

精确+实时：数据可以存入单台机器的内存之中，我们可以随心所欲，使用任何想用的算法。结果会 100% 精确，响应会相对快速。
大数据+精确：传统的 Hadoop。可以处理 PB 级的数据并且为我们提供精确的答案，但它可能需要几周的时间才能为我们提供这个答案。
大数据+实时：近似算法为我们提供准确但不精确的结果。

聚合实现：DocValues

Doc values 的存在是因为倒排索引只对某些操作是高效的。 倒排索引的优势在于查找包含某个项的文档，而对于从另外一个方向的相反操作并不高效，即：确定哪些项是否存在单个文档里
搜索使用倒排索引查找文档，聚合操作收集和聚合 doc values 里的数据。
Doc Values 本质上是一个序列化的列式存储。列式存储 适用于聚合、排序、脚本等操作
Doc values 不支持 analyzed 字符串字段。聚合运行在 not_analyzed 字符串而不是 analyzed 字符串，这样可以有效的利用 doc values 

聚合一个分析字符串：fielddata 

terms 桶基于我们的数据动态构建桶；它并不知道到底生成了多少桶。 大多数时候对单个字段的聚合查询还是非常快的， 但是当需要同时聚合多个字段时，就可能会
产生大量的分组，最终结果就是占用 es 大量内存，从而导致 OOM 的情况发生。

聚合模式：DFS(默认)，BFS

广度优先仅仅适用于每个组的聚合数量远远小于当前总组数的情况下，因为广度优先会在内存中缓存裁剪后的仅仅需要缓存的每个组的所有数据，
以便于它的子聚合分组查询可以复用上级聚合的数据。

对单个文件的变更是ACID的，但包含多个文档的变更不支持。


