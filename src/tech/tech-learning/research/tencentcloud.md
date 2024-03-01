# TencentCloud

模拟考试地址：https://tschool.kaoshixing.com/exam/before_answer_notice/867846


# 基础产品学堂

# COS

COS 作为IAAS层

对象存储的数据湖和原生存算一体数据湖。

基于对象存储的数据湖？

YottaStore--腾讯新一代云原生存储系统 COS存储引擎

数据加速器 GooseFS https://cloud.tencent.com/document/product/1424

# CVM

灵活计算能力。

无法单独购买一个CVM，是一个整体能力。

不同的机型价格不一样。

# CBM

裸金属

也就是物理机

虚拟机，物理机，所有公有云网络互联互通。

# CODING DevOps

研发管理工具

软件开发生命周期(SDLC)

# Ckafka

Ckafka在开源上的商业化能力：租户隔离，限流，鉴权

同城双活。

监控能力。

日志的能力给产品化能力出来。

Kafka产品化能力Ckakfa

跨区容灾，跨域灾备

ckafka一键诊断

# 容器服务

TKE和EKS

容器自动缩容如何做到？

容器属于基础Paas服务。

数据库在容器化用处不大。

# 异构计算

通用计算 VS 异构计算

qGPU，TKS

CPU和GPU区别

# 云硬盘

CBS（Cloud Block Storage），CVM里面的硬盘

# 云CFS

Cloud File Storage

结构化数据和非结构化数据

1ZB=109TB

云上存储：CBS，CFS，COS

# CFS

高性能

腾讯云，华为云，阿里云 对表

Lustre 是用于高性能计算 (HPC) 群集和环境的开源并行分布式文件系统。Lustre 名称是Linux 和集群的portmanteau。

并行文件存储。

对比阿里云做规避。引导客户XXX。

阿里云GPFS

CFS的Turbo系列，POSIX接口。和本地文件一样访问

# TBDS大数据套件

端到端解决方案。

工具链wedata

构建工具wemodel

分析型数仓 MPP

竞品：CDH平台

# RayData可视化

数据实时渲染技术

Plus（CS）

Web（网页）

数字孪生

# 企点客服

单轮 多轮 任务型（满足特定任务，从客户系统回答）

通路能力。


# 学习笔记

数据中心是非常复杂系统。

TCO  TVO

uptimeinstitute 对数据中心分类：https://uptimeinstitute.com/tiers

两地三中心。双活。

可靠性越高，成本越大。


互联网数据中心（IDC--Internet Data Center）
企业数据中心 （EDC--Enterprise Data Center）
外包数据中心 （ODC--Outsourcing data center）
主数据中心（DC--Data Center）


National Institute of Standards and Technology (NIST)   美国国家标准与技术研究院


按需服务维度：资源，时间   

资源池化：虚拟化，资源池，传统的资源隔离。

TVO价值明显：服务可度量，投入产出比分析，成本控制。


操作系统虚拟化。

多云互通：阿里云，腾讯云互通。

计算虚拟化。为什么存储不能虚拟化？

VCPU，虚拟cpu

CPU特权级别：ring0，ring1，ring2，ring3

Binary translation (BT) is the process of converting executable binary from one instruction set architecture (ISA) to another.

CPU纯软件半虚拟化技术：https://www.cnblogs.com/echo1937/p/7227385.html  Hypercall技术

dom0

三个虚拟化平台对比。

分布式存储 serverSAN

网络虚拟化 SDN

应用虚拟化：容器技术。

大数据4V。

技术能力到服务输出。


产业互联网：连接，交互，计算

云计算对组织影响。

Grary Sort：排序100TB花费多久？

Minute Sort：60秒排序多少数据？

腾讯云音视频技术，游戏领域很强。

最核心：云服务器。计算最基础东西。

可用区是物理隔离的。

CVM云服务器。（Cloud Virtual Machine）

实例类型：IO，计算，存储，

VPS主机。

管理服务器：API，CLI，控制台

动态扩缩：镜像。

CDH：CVM Deciated Host

升配和降配

不同网络地址掩码是 固定的。

用的CIDR

子网ip只能在子网内，不能互通子网，通过路由表的网关实现。

网关地址实现跨子网通信地址。

ENI：弹性网卡，A实例绑定ENI1，A挂了，可以把ENI1绑定到B实例

网络的核心是实现连接。

虚拟私有云（VPC）

网络连接：连接公网，连接私网，连接另一个vpc

NAT：私有IP转为公网IP。

不支持安全组绑定，不受安全组限制。

NAT要比公网官网更强。

VPN不是物理链接，而是虚拟连接。

NAT：少量公网对应大量私网IP。

企业对网络要求高，用专线接入，对网络要求不高，可以VPN连接。

云联网 CCN

负载均衡：CLB

流量分发算法：WRRS，WLCS，IP-Hash

负载均衡使用场景：业务访问分离，流量分发，出入流量分离，混合云

横向扩展更容易扩容。

公网IP有限，防止不用。

同地域对等连接 走腾讯云内部，所以免费的。

引入CDN节点变多了，但是性能提高了。

CDN是规模经济，规模越大，价格越低。

SLA得到保障。

Akamai（阿卡迈）在1998年发明CDN技术架构之后组建公司

https://www.akamai.com/zh/company/company-history

GSLB 智能调度

DNS里面的一个功能是GSLB。

HTTP协议不是安全的，HTTPS是安全的。

SSL种类：域名型，增强型，

监控 Http Refer 防盗链

DDos攻击和CC(Challenge Collapsar）攻击

海外加速 GCD

动态加速网络：DSA

全球应用加速：GAAP

CDN边缘计算：CDN Edge。如马路上的监控不需要数据传输到云数据中心。

智能CDN：x-p2p

网络绕行

https://www.lustre.org

CDN计费方式：带宽和流量

SQL和NoSQL最大区别：查询。（查询，聚合等等）NoSQL查询能力不行，因为数据模型简单。

数据库一体机。infiband

数据传输服务 DTS，数据库一体机 TData

云MySQL弹性扩容

SQLServer用于windows，基于镜像机制实现高可用。

TDSQL是MariaDB分布式版本。

强同步MAR：Multi-thread Asynchronous Replication  异步多线程同步复制方案

MariaDB_TDSQL  高并发，实时交易，物联网，金融级别

CynosDB  设计基于云，云原生数据库

日志即数据库。

SPDK和RDMA零拷贝技术。

云数据库 MongoDB：游戏开发

两个版本：Redis，CKV（基于社区Redis进行优化，多线程，数据备份不用额外内存）

时序数据库  CTSDB（带时间标签的）（IOT和业务监控分析）

数据库一体机：TData  软件 硬件的融合。IB（Infiniband）：计算层和存储层的数据交换效率

金融行业：高可靠，高可用：两地三中心（主库，同城备库，异地备库）

DTS：数据传输服务，监听binlog

Redis，Memcacvhe计算只计算内存不计算磁盘，MongoDB计算内存+磁盘

SLA，Service Level Agreement

COS存储引擎  YottaStore

人脸识别 是 PaaS


人脸识别 能力 Paas 人脸识别 服务 Saas

最便宜的是公有云

公有云和私有云：使用权和所有权。

数据放在自己机房未必安全。不一定放在腾讯云不安全。取决于是否有了安全策略。本地有充分安全策略。

你的电脑不是时刻利用完资源。

虚拟化：解决资源利用率问题。

Cos不是某一个存储柜（机柜），而是上传时候，系统是分布式，切成很多块。

云供应商买的硬盘不是高性能的，一堆非常不可靠，性能不可靠的机器上实现的非常可靠的，高可用的。每一块硬盘DataNode非常差。分拆的非常小。

腾讯云的用的不是openstack。基于vstation

分布式存储，用的ssd，实际上不是ssd。


服务化到各行各业都在使用，就是产业化。

云计算不用满足，未来几年。因为云替你考虑了。

题库。

不同地域之间不互通。负载均衡不在地域间。






















