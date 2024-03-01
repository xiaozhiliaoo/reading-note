# Config

kafka日志清理策略，cleanup.policy：compact, delete。 "compact" policy will enable log compaction，"delete" policy will discard old segments when retention time or size limit has been reached。

log(roll,retention,flush,cleaner)

log.retention.(bytes,hours,minutes,ms

log.retention.hours

log.reteideantion.minutes

log.retention.ms

log.cleaner.enable

kafka日志清理完，之后logSize会不会往前移动，如果前移，那么offset呢？不会前移，代价太高。

retention mechanism： compaction done by log cleaner。recopy log segments，

min.insync.replicas

