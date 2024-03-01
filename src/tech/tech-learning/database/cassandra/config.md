# Config

## 建表核心配置

地址：[Data Definition](https://cassandra.apache.org/doc/latest/cassandra/cql/ddl.html)

bloom_filter_fp_chance

caching

compaction

compression

crc_check_chance

dclocal_read_repair_chance

default_time_to_live

gc_grace_seconds

max_index_interval

memtable_flush_period_in_ms

min_index_interval

read_repair_chance

speculative_retry

### 建表案例

```CQL
CREATE TABLE course_process.user_process (
    userid text,
    courseid text,
    lessonid text,
    all bigint,
    duration bigint,
    finish bigint,
    mark bigint,
    time bigint,
    PRIMARY KEY (userid, courseid, lessonid)
) WITH CLUSTERING ORDER BY (courseid ASC, lessonid ASC)
    AND bloom_filter_fp_chance = 0.01
    AND caching = {'keys': 'ALL', 'rows_per_partition': 'NONE'}
    AND comment = ''
    AND compaction = {'class': 'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy', 'max_threshold': '32', 'min_threshold': '4'}
    AND compression = {'chunk_length_in_kb': '64', 'class': 'org.apache.cassandra.io.compress.LZ4Compressor'}
    AND crc_check_chance = 1.0
    AND dclocal_read_repair_chance = 0.1
    AND default_time_to_live = 0
    AND gc_grace_seconds = 864000
    AND max_index_interval = 2048
    AND memtable_flush_period_in_ms = 0
    AND min_index_interval = 128
    AND read_repair_chance = 0.0
    AND speculative_retry = '99PERCENTILE';
CREATE INDEX lesson_index ON course_process.user_process (lessonid);
```

