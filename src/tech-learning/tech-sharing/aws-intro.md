# aws安全合规

PPT：https://d1x6panposcncl.cloudfront.net/202206/ppt.zip

技术

可用区，和可用域。

CDN服务：CloudFont

ECS/EKS

S3分层存储。

Global Accelerator GCP

Aurora

Aurora Golbal Database.

大规模数据量，需要分库分表考虑，kv，或者其他存储，貌似没有newsql解决方案？

Dymoand 全球写入，多节点写入，Dymoand CDC Stream。只有这个是多点写入。 是kv，毫秒查询。全球数据同步取决于具体业务和技术选型。

Cassanrda 大宽表，分库分表。

Timestream.

EMR 托管hadoop集群。

S3中间存储。

redshift，

kenisis 比kafka有安全机制。

Amazon S3数据湖。行业标准。

AWS CDK(Cloud Development Kit)

直播方案

安全合规

GDPR：General Data Protection Regulation

安全工程

GB/T35273

CIA 完整性 安全性

数据保护官 DPO

合规方案：数据湖保护个人信息，从设计开始考虑

数据加密：存储，传输，使用。

Amazon KMS

Amazon Audit manager

Amazon Security hub

欧盟GDPR入门