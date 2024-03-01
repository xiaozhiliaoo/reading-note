# Operation

## 常见错误

1. Fielddata is disabled on text fields by default. Set fielddata=true on [id] in order to load fielddata 
in memory by uninverting the inverted index. Note that this can however use significant memory. 
Alternatively use a keyword field instead.

在text字段上面进行排序操作。

2. Cannot search on field [lastName] since it is not indexed.

mapping中lastName设置位index:false，es字段不索引，查不出来。