# DataStax Academy DS220

Model For Query

GroupBy-partation key OrderBy= cluster key

集合类型：List,Set,Map

UDT,UDF,UDA

Partition Per Query和Partition + Per Query 正确的模式。 Table Scan和Multi Table Scan 反模式。

表的目的是为了查询。而不是存储数据。

Data duplication can scale, joins cannot

优化表是优化分区。

surrogate key

改变数据模型，需要迁移数据。

Anti-Pattern（协调节点压力会变大）


