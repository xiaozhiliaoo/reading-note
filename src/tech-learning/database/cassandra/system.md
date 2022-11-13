# System

# 进度

# 笔记

## 基础知识

### CQL

不支持join,like,非主键查询，支持需要allowing filter，二级索引，或者SASI，物化视图。

SASI：LIKE，SPARSE INDEX。 memory mapped B+ trees，不支持集合索引，普通二级索引支持。

函数：ttl，writetime，token

### 配置

### 基本知识

ER图是概念建模，关系型和非关系是逻辑建模。具体到数据库是物理建模。

Clustered Index and Secondary Indexes：聚簇索引只有一个，优先primary key 没有就是unique
key，两个都没有，innodb自动生成。看来唯一索引也是非聚簇的，唯一索引也能建多个，是非聚簇的，也能为空，能多个都是空，但是不能重复。
https://dev.mysql.com/doc/refman/5.7/en/innodb-index-types.html

数据建模：Chebotko method，query driven，primary key=partation key + clustering
key，把表想象成一个分区表。【https://cassandra.apache.org/doc/latest/cassandra/data_modeling/index.html】

write-once immutable ordered data model

Release
Note: https://gitbox.apache.org/repos/asf?p=cassandra.git;a=blob_plain;f=CHANGES.txt;hb=refs/tags/cassandra-4.0.0

cassandra是宽列行存储引擎。数据模型是列存（[Wide Column Stores](https://en.wikipedia.org/wiki/Wide-column_store)
），但是磁盘是行存。hbase和bigtable也是。[面向列](https://en.wikipedia.org/wiki/Column-oriented_DBMS)
的磁盘存储一般在数仓较多，如clickhouse，druid，greenplum，还有关系型分为行存和列存。

https://en.wikipedia.org/wiki/List_of_column-oriented_DBMSes

Apache Parquet is an open source, column-oriented data file format designed for efficient data storage and retrieval

TiDB（行存） TiFlash（列存）

OLTP（行存） OLAP（列存）

先读bigtable(2006)，dynamo(2007)，cassandra(2009)的paper.

范式：one table serve many queries 反范式：one table serve one query

数据建模cassandra风格: 数据查询在一起，存储应该在一起，保持分区和结果集小，使用高基数的key,表是为了查询而建的，没有全表扫描

https://en.wikipedia.org/wiki/Apache_Cassandra

read path和write path发生了什么？

compaction类型minor，major，user defined，scrub 和策略：STCS，LCS，TWCS

多维hashmap

读取很快，简单的查询模型，数据在一起查询那么应该存在一起，使用高基数的key，

数据时间 ttl

cassandra datastax driver三种模式：statement，mapper，accessor + spring data cassandra

column families 也叫 tables

副本修复方式：read repair,hinted handoff

计数器可以有多个counter，但是不能出现非主键key。

Cassandra uses a Last-Write-Wins Element-Set conflict-free replicated data type for each CQL row。

SSTable Attached Secondary Index (SASI): LIKE

CODD 12条原则，5大范式。

除了主键外的每一列都有时间戳，那么设置更新时间就没有意义了，关系型每一个是一个完整的时间。

## 运维

### compaction

gc_grace_seconds=10d

### hints

max_hint_windowin_ms=3h

## 百科

### workshop

https://github.com/DataStax-Academy/cassandra-workshop-series

### person

[Avinash Lakshman]

[Prashant Malik]

[Eben Hewitt](https://www.oreilly.com/pub/au/3352)

[Jeffrey Carpenter](https://github.com/jeffreyscarpenter/)
[Jeffrey Carpenter](https://www.oreilly.com/pub/au/6537)

### Site

https://www.intel.com/content/www/us/en/silicon-innovations/intel-tick-tock-model-general.html

https://cwiki.apache.org/confluence/display/cassandra

## 常见错误

### 查询错误

1. [Invalid query] message="ORDER BY is only supported when the partition key is restricted by an EQ or an IN."。

   **order by 操作必须在分区key是 == 或者 in的时候下才可以使用。不能排序分区键，因为需要遍历所有分片。**


2. [Invalid query] message="Order by currently only support the ordering of columns following their declared order inthe PRIMARY KEY"。
   
   **orderby必须是主键指定的顺序。**
   
3. InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot rename non PRIMARY KEY part createtime"。
   **不能重命名非PRIMARY KEY**。

4. InvalidRequest: Error from server: code=2200 [Invalid query] message="Invalid operation (studytimechange =studytimechange + 1000) for non counter column studytimechange"
   **累加操作必须在counter类型字段上面。**
   
5. InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot mix counter and non counter columns in the same table"。
   **计数器列可以多个，但是必须非主键之外所有键。**
   
6. InvalidRequest: Error from server: code=2200 [Invalid query] message="Order by currently only support the ordering of columns following their declared order in the PRIMARY KEY"
   **排序字段只能是PRIMARY KEY定义的顺序。**
   
7. InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot execute this query as it might involve data filtering and thus may have unpredictable performance. If you want to execute this query despite the performance unpredictability, use ALLOW FILTERING"。
   **原来查询：select * from answers_by_user where courseid=1;**
   **现有查询：select * from answers_by_user where courseid=1 allow filtering;**
   **其他方法：change your data model add an index, use another table use ALLOW FILTERING**
   
8. InvalidRequest: Error from server: code=2200 [Invalid query] message="User-defined functions are disabled in cassandra.yaml - set enable_user_defined_functions=true to enable"
   **UDF没有打开。UDF没有打开，那么UDA也用不了。因为UDA借助两个UDF**。
   
9. InvalidRequest: Error from server: code=2200 [Invalid query] message="Invalid non-frozen user-defined type for PRIMARY KEY component address"。
   **非冻结的UDT不能作为主键的一部分，而冻结的UDT可以作为主键的一部分。**
   
9. InvalidRequest: Error from server: code=2200 [Invalid query] message="Unsupported order by relation"。
   **orderby必须是集群键指定的顺序，不可以相交。 建表默认是a asc，b asc，order by b asc,c desc;   order by b desc,c asc; 均会失败，order by a asc，b asc 或 a desc，b desc均会成功。**
   
10. InvalidRequest: Error from server: code=2200 [Invalid query] message="INSERT statements are not allowed on counter tables, use UPDATE instead"
   **counter类型不能直接插入，需要直接UPDATE**。
    
11. InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot directly modify a materialized view"
   **不能insert，delete物化视图，物化视图修改只能由基础表来派生**。
    
12. InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot TRUNCATE materialized view directly; must truncate base table instead"
   **不能TRUNCATE物化视图**。
   

# 开源项目的代码案例研究

## cassandra-workshop-series

1. https://github.com/DataStax-Academy/cassandra-workshop-series

## killrvideo-java

2. https://github.com/KillrVideo/killrvideo-java

主要是core和mapping，GRPC，大量CF，

## workshop-spring-data-cassandra

3. https://github.com/datastaxdevs/workshop-spring-data-cassandra

## workshop-ecommerce-app

4. https://github.com/datastaxdevs/workshop-ecommerce-app

基于SpringDataCassandra写的。

## DataStax-Examples

5. https://github.com/DataStax-Examples/

## cassandra-guide

https://github.com/jeffreyscarpenter/cassandra-guide

基于core写的。没有mapper。

# 参考

dbdb.io: https://dbdb.io/db/cassandra

https://github.com/xiaozhiliaoo/cassandra-practice

java客户端：https://docs.datastax.com/en/developer/java-driver/4.13/

spring-data-cassandra: https://docs.spring.io/spring-data/cassandra/docs/current/reference/html/#preface

scylladb:C++写的cassandra.  https://www.scylladb.com/resources/introduction-to-apache-cassandra/

术语：https://docs.datastax.com/en/glossary/doc/glossary/glossaryTOC.html

https://cwiki.apache.org/confluence/display/CASSANDRA2/Home

https://cwiki.apache.org/confluence/display/CASSANDRA/Home

Merkle tree：http://people.eecs.berkeley.edu/~raluca/cs261-f15/Merkle.html

https://en.wikipedia.org/wiki/Ralph_Merkle  https://ralphmerkle.com/

静态列的值所有行都一样，最新的会覆盖其他列的。

## paper

Backup and Recovery Mechanisms of Cassandra Database: A Review

Gossip : http://awinterman.github.io/simple-scuttle/

Facebook’s Cassandra paper, annotated and compared to Apache Cassandra
2.0 : https://docs.datastax.com/en/articles/cassandra/cassandrathenandnow.html

## source code

### C* Summit 2013: Cassandra Internals

https://www.youtube.com/watch?v=W6e8_IcgJM4

API Layer/Dynamo Layer/Database Layer


## Data Access



### 存储层封装的演进

JDBC->commons-dbutils->Template->ORM(MyBatis)->Spring Data  每一次演进的本质区别是什么。

### 为什么要有common-cassandra

assandra datastax driver有三种模式：statement，mapper，accessor，spring data cassandra

开源的很好，但是很复杂，学习成本很高。开发只能记住最简单的使用。

### 功能

支持直接注入@Autowired Accessor(启动时候引入@Accessor)

加了些配置。和方便开发使用。”没有新加机制“。

新的机制。