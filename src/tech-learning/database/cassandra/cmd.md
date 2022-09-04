# Cassandra常用命令

## Admin

cqlsh node

nodetool -h host -p port describecluster

## 应用表

查看所有命令: HELP;

查看集群信息(没选keyspace)：DESCRIBE CLUSTER ;

查看集群信息(选了keyspace)：DESCRIBE CLUSTER ;

查看cassandra版本：SHOW VERSION ;

所有keyspace: DESCRIBE KEYSPACES;

某个keyspace: USE xxx; DESCRIBE KEYSPACE; 或 DESCRIBE KEYSPACE xxx;

某个keyspace所有表：USE xxx; DESCRIBE TABLES;

某个keyspace某个表： USE xxx; DESCRIBE TABLE tableName;

一致性级别：CONSISTENCY;

清理表数据：TRANCATE tableName;

清除表结构：DROP TABLE tableName;

查询时间：select userId,writetime(answer) from user_answer ;

新加列：ALTER TABLE tableName ADD columnName text;

删除列：ALTER TABLE tableName DROP columnName;

创建二级索引：CREATE INDEX indexName ON tableName(columnName);

删除二级索引：DROP INDEX indexName;

插入：INSERT INTO tableName(columnName1,columnName2) VALUES ('value1','value2');

更新：UPDATE tableName SET columnName='value1' WHERE columnName2='xxx';

删除某个列的值：DELETE columnName FROM tableName WHERE columnName2='xxx';

删除行：DELETE FROM tableName WHERE columnName2='';

总数：select count(*) from tableName;

## 系统表

select broadcast_address from system.local;

select peer,rack,rpc_address from system.peers;

select keyspace_name,columnfamily,generation from system.sstable_activity;

查找repair记录：select keyspace_name,columnfamily_name,exception_message from system_distributed.repair_history ;

查找二级索引：select keyspace_name,table_name,index_name from system_schema.indexes ;

system_schema包括：aggregates，dropped_columns，indexes，tables，types，columns，functions，keyspaces，triggers，views

## 其它

打开trace , TRACING ON, 然后select数据，发现每一步耗时。查看trace命令，select * from system_traces.sessions ;查看trace的事件，select * from
system_traces.events 



