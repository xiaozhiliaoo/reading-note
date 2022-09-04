# Cassandra

# 进度

# 笔记

cassandra是宽列行存储引擎。数据模型是列存（[Wide Column Stores](https://en.wikipedia.org/wiki/Wide-column_store) ），但是磁盘是行存。hbase和bigtable也是。[面向列](https://en.wikipedia.org/wiki/Column-oriented_DBMS) 的磁盘存储一般在数仓较多，如clickhouse，druid，greenplum，还有关系型分为行存和列存。

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

## 运维

### compaction

gc_grace_seconds=10d

### hints

max_hint_windowin_ms=3h

## 常见错误

1. [Invalid query] message="ORDER BY is only supported when the partition key is restricted by an EQ or an IN."。

   **order by 操作必须在分区key是 == 或者 in的时候下才可以使用。不能排序分区键，因为需要遍历所有分片。**


2. [Invalid query] message="Order by currently only support the ordering of columns following their declared order in the PRIMARY KEY"。
   
   **orderby必须是主键指定的顺序。**
   
3. InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot rename non PRIMARY KEY part createtime"。
   **不能重命名非PRIMARY KEY**。

4. InvalidRequest: Error from server: code=2200 [Invalid query] message="Invalid operation (studytimechange = studytimechange + 1000) for non counter column studytimechange"
   **累加操作必须在counter类型字段上面。**

5. InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot mix counter and non counter columns in the same table"。
   **计数器列可以多个，但是必须非主键之外所有键。**

6. InvalidRequest: Error from server: code=2200 [Invalid query] message="Order by currently only support the ordering of columns following their declared order in the PRIMARY KEY"
   **排序字段只能是PRIMARY KEY定义的顺序。**
   
7. InvalidRequest: Error from server: code=2200 [Invalid query] message="Cannot execute this query as it might involve data filtering and thus may have unpredictable performance. If you want to execute this query despite the performance unpredictability, use ALLOW FILTERING"。
   **原来查询：select * from answers_by_user where courseid=1;**
   **现有查询：select * from answers_by_user where courseid=1 allow filtering;**
   **其他方法：change your data model  add an index, use another table  use ALLOW FILTERING**
   
8. InvalidRequest: Error from server: code=2200 [Invalid query] message="User-defined functions are disabled in cassandra.yaml - set enable_user_defined_functions=true to enable"
   **UDF没有打开。**

9. 


# 代码案例研究
1. https://github.com/DataStax-Academy/cassandra-workshop-series

2. https://github.com/KillrVideo/killrvideo-java

3. https://github.com/datastaxdevs/workshop-spring-data-cassandra

4. https://github.com/datastaxdevs/workshop-ecommerce-app

5. https://github.com/DataStax-Examples/




# 参考

dbdb.io: https://dbdb.io/db/cassandra

https://github.com/xiaozhiliaoo/cassandra-practice

java客户端：https://docs.datastax.com/en/developer/java-driver/4.13/

spring-data-cassandra: https://docs.spring.io/spring-data/cassandra/docs/current/reference/html/#preface

scylladb:C++写的cassandra.  https://www.scylladb.com/resources/introduction-to-apache-cassandra/

术语：https://docs.datastax.com/en/glossary/doc/glossary/glossaryTOC.html

## paper

Backup and Recovery Mechanisms of Cassandra Database: A Review

