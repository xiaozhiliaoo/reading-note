# ElasticSearch

## 学习进度

看到这里了：https://www.elastic.co/guide/cn/elasticsearch/guide/current/_preventing_combinatorial_explosions.html

## 概念

[es历史](https://www.elastic.co/about/history-of-elasticsearch)

[shay banon](https://www.elastic.co/blog/author/shay-banon)

Near Real Time

[节点类型](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-node.html)

打分机制：从TF-IDF改成BM25，也叫[similarity](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-modules-similarity.html) ，scoring，ranking

oversharding问题,如何创建分片数？

如何知道数据在集群中的哪个节点？

集群状态：红绿黄

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

```text
检索过程：query then fetch 先查后取
分片节点：from+size
协调节点：numberOfShard * (from+size)
```

scroll 查询禁用排序

搜索类型：query then fetch，dfs_query_then_fetch

深度分页的代价根源是结果集全局排序，如果去掉全局排序的特性的话查询结果的成本就会很低。

Data Replication:Primary-Backup

in-sync shard（可以被选中为primary的shard）

index配置最重要的是：number_of_shards(创建后更改不了)，number_of_replicas(创建后可以修改)

_id 和 _index 字段则既没有被索引也没有被存储，这意味着它们并不是真实存在的。

不能添加新的分析器或者对现有的字段做改动。 如果你那么做的话，结果就是那些已经被索引的数据就不正确， 搜索也不能正常工作。此时需要reindex。

修改索引类型：https://www.elastic.co/guide/cn/elasticsearch/guide/current/index-aliases.html

应用中使用索引别名，而不是索引真实名字。这样在修改索引时候，应用层不需要变化。

全文检索=全字段索引

```text
倒排索引被写入磁盘后是 不可改变 的
在保留不变性的前提下实现倒排索引的更新？答案是: 用更多的索引。
```

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


```text
全文搜索被称作是 召回率（Recall） 与 精确率（Precision） 的战场
召回率 ——返回所有的相关文档； 
精确率 ——不返回无关文档
```

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

Analyzed 域无法排序并不是因为使用了分析器，而是因为分析器将字符串拆分成了很多词汇单元，就像一个 词汇袋，所以 Elasticsearch 不知道使用那一个词汇单元排序。

analyzed name域用来搜索。not_analyzed name.raw 域用来排序。

International Components for Unicode (ICU) 

单词还原成词根。比如foxes还原成fox.

## 常见问题

1.数字什么时候建模成numeric类型，什么时候建模成keyword类型？
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/keyword.html)

2.映射非结构化数据，选择text还是keyword？
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/keyword.html#wildcard-field-type)

3.Object查询和Nested查询区别是什么？
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/nested.html)

4.FieldData是什么？
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/text.html#fielddata-mapping-param)

5.Mapping的参数有哪些？（Filed的配置有哪些？）
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-params.html)

6.什么是global-ordinals？

7.mapping-field-meta是否可以写字段备注？
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-field-meta.html)

8.为什么删除了mapping type字段？
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/removal-of-types.html#_why_are_mapping_types_being_removed)

9.Analyzer的三个过程是什么？
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/analyzer-anatomy.html)

10.ES聚合分析的内部原理？
聚合基于doc value正排索引实现的。用纯倒排索引实现性能很差。doc value也叫正排索引。搜索基于倒排索引实现。

11.doc value和filed data区别？

doc value是非分词字段的默认值，在index时候创建，所以可以支持聚合，
filed data是分词字段的聚合控制，是没有doc value的，默认不支持聚合操作，必须设置为true才可以，filed data在内存中，查询聚合时候才生成的加载到内存中。
https://www.elastic.co/guide/en/elasticsearch/reference/current/text.html#fielddata-mapping-param
https://www.elastic.co/guide/en/elasticsearch/reference/current/doc-values.html
实际很少对分词fileddata进行聚合，尽量对不分词的docvalue进行聚合。	

12.Terms聚合如何选择收集模式？DFS or BFS？ES默认是哪一个？
[参考](https://www.elastic.co/guide/cn/elasticsearch/guide/current/_preventing_combinatorial_explosions.html)

13.Es如何处理并发冲突？

[参考](https://www.elastic.co/guide/cn/elasticsearch/guide/current/version-control.html)

14.如何解决ES深度分页问题？

Scroll，Search After，From/Size

15.ES的相似度/分数是怎么计算的？（ES排序问题）
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/index-modules-similarity.html)

16.准确率和召回率是什么意思？如何优化这两个数值？

17.ES会发生一边搜索一边构建索引过程吗？

18.ES分割倒排索引是纵向分割文档还是水平分割单词？

19.MySQL全文检索和ES搜索区别？
[参考](https://dev.mysql.com/doc/refman/8.0/en/fulltext-search.html)

20.Vector Space Model(term vector model)是什么？
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/term-vector.html)

21.如何设计一个搜索引擎？
[参考](https://book.douban.com/subject/26681675/)

22.ES match phrase query的slop和 fuzzy query的max_expansions距离对比。
[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-fuzzy-query.html)

23.如何自己实现一个ES插件？

24.Text(文本)->Token(词汇单元)->Term(项)过程中，发生了什么？TokenFilter和Tokenizer区别是什么？Token有哪些属性？

25.ES词干提取算法有哪些？

[参考](https://www.elastic.co/guide/cn/elasticsearch/guide/current/algorithmic-stemmers.html)

26.分别举例：一个字段查多个词和一个词查多个字段可以用哪些Query？

```text
一个字段查一个词：term-query，match-query，match-phrase-query
一个字段查多个词：match-query，terms-query
一个词查多个字段：multi-match，bool-query
多个词查多个字段：bool-query，disjunction-max-query
```

27.Es Query编写：查找所有文档中”quick fox”接近”lazy dog”的或者”quick fox”接近”sleepy cat”的文档。
```text
参考：https://gist.github.com/xiaozhiliaoo/abc5c3d18c3ab52ea78a600641588dab
Doc	Content
1	the quick brown fox jumped over the lazy dog
2	the quick red fox jumps over the sleepy cat
28.Match phraseQuery和SpanQuery/SpanNearQuery区别?以及使用场景？
```

29.Url-search和query-string search区别？

[参考1](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-uri-request.html),
[参考2](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-query-string-query.html),
[参考3](https://www.elastic.co/guide/en/elasticsearch/reference/6.8/search-uri-request.html#_parameters_3)

30.Es mapping如下，查找指定订单ID的文档，用尽可能多的方式写出。
query string query，match query，term query，uri search

31.如何为任务选择合适的查询？

32.query string和simple query string区别？

33.Es query rewrite是什么意思？

[参考](https://www.elastic.co/guide/en/elasticsearch/reference/current/query-dsl-multi-term-rewrite.html)

34.多桶聚合的terms和composite聚合的区别？
精确度问题：
https://www.elastic.co/guide/en/elasticsearch/reference/5.3/search-aggregations-bucket-terms-aggregation.html#search-aggregations-bucket-terms-aggregation-approximate-counts

https://www.elastic.co/guide/en/elasticsearch/guide/master/_approximate_aggregations.html

https://www.elastic.co/guide/en/elasticsearch/reference/6.8/search-aggregations-bucket-terms-aggregation.html

35.深度分页问题？
https://www.elastic.co/guide/en/elasticsearch/guide/current/pagination.html


36.倒排索引的数据结构是什么？

## 原理

https://www.elastic.co/blog/found-elasticsearch-internals

https://www.elastic.co/blog/found-elasticsearch-networking

https://en.wikipedia.org/wiki/Finite-state_transducer

for压缩和rbm压缩：https://www.elastic.co/cn/blog/frame-of-reference-and-roaring-bitmaps

## EQL

```text
select * from course where title='how to make millions' and tag!='spam' or (tag = 'starred' and date >= '2014-01-01');
select * from emails where (folder='inbox' and reading = false) or (folder!='inbox' and important=true)
SELECT product FROM products WHERE (price = 20 OR productID = "XHDK-A-1293-#fJ3") AND (price != 30)
```

## 遇到问题

1.forbidden-12-index-read-only-allow-delete-api?

某个节点的磁盘满了，需要运维清理下磁盘



## 课程

https://github.com/xiaozhiliaoo/geektime-ELK

https://github.com/xiaozhiliaoo/search-practice

## Java API

ElasticsearchClient执行Action

核心抽象是Action

TransportClient(TCP)
RestHighLevelClient(HTTP)

prepareSearch和

TransportClient.prepareSearch
ActionRequestBuilder.get


SearchRequest （SearchRequestBuilder） -> TransportClient/RestHighLevelClient -> SearchResponse

SearchRequest（Query，Source，Scroll）

prepareXXX -> get

Action<Request, Response, RequestBuilder>

## 疑问

- SearchScroll和SearchAfter区别？

- 这**3**种写法的区别是什么？

  ```java
   SearchRequest request1 = new SearchRequest(INDEX)
                  .source(new SearchSourceBuilder().query(query))
                  .scroll(SCROLL_TIMEOUT);
          
  //prepareSearch里面调用SearchRequestBuilder
  SearchRequest request2 = transportClient.prepareSearch(INDEX)
      .setSource(new SearchSourceBuilder().query(query))
      .setScroll(SCROLL_TIMEOUT).request();
  
  //searchRequest里面调用new SearchRequest(INDEX)
  SearchRequest searchRequest3 = Requests.searchRequest(INDEX)
                  .source(new SearchSourceBuilder().query(query))
                  .scroll(SCROLL_TIMEOUT);
  
  ```

  

### 请求写法1 通过RestHighLevelClient的request search

```java
SearchRequest request = transportClient.prepareSearch(INDEX)
    .setSource(new SearchSourceBuilder().query(query))
    .setScroll(SCROLL_TIMEOUT).request();
    
SearchResponse searchResponse = RestHighLevelClient.search(request)
```



### 请求写法2 通过TransportClient的request builder get/execute

```java
 SearchRequestBuilder requestBuilder = transportClient.prepareSearch(INDEX)
     .setSource(new SearchSourceBuilder().query(query))
     .setScroll(SCROLL_TIMEOUT);

SearchResponse searchResponse = requestBuilder.get(SCROLL_TIMEOUT)
SearchResponse searchResponse2 = requestBuilder.execute().actionGet();    
```

## 使用

mysql与es进行同步

订单多字段检索，插件搜索：订单查询

订单模块加解密插件，单字分词插件

统计聚合：结算

新加字段：结算

修改字段类型：结算

嵌套聚合，嵌套分组：结算

嵌套搜索 结算：结算

es terms聚合和composite聚合区别，以及改进terms聚合。节点经常oom，聚合数据太多了，所以改成了composite聚合