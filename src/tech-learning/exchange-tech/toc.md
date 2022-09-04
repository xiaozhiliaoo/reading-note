# 区块链交易所技术


我在区块链交易所工作时候的技术栈。


## 技术学习笔记

| 后端                                                         | 类别        |
| :----------------------------------------------------------- | ----------- |
| AWS: EKS，EC2，ELB，Aurora，Rancher<br />阿里云：Logtail，SLS<br />K8S，isito等 | 云厂商/运维 |
| Redis Cluster，RocketMQ/RabbitMQ，MySQL master-slave，[Sharding-JDBC](https://shardingsphere.apache.org/) | 中间件      |
| 服务化：Spring Cloud Alibaba 2.1.0.RELEASE、Spring Boot 2.1.5.RELEASE，Spring Cloud Gateway 2.1.0.RELEASE<br />注册中心：Eureka -> Nacos 1.1.0 -> k8s service+ coreDNS<br />配置中心：Nacos->ConfigMap<br />限流，降级：Guava RateLimter -> Sentinel 1.6.3 熔断： [resilience4j](https://resilience4j.readme.io/)<br />链路追踪：[Sleuth](https://spring.io/projects/spring-cloud-sleuth)<br />RPC：[OpenFeign](https://spring.io/projects/spring-cloud-openfeign) | 微服务      |
| 单元测试：[junit5](https://junit.org/junit5/docs/current/user-guide/)+[assertj](https://assertj.github.io/doc/)+[Mockito](https://site.mockito.org/)+[JSONAssert](https://jsonassert.skyscreamer.org/) 性能测试：[JMH](https://github.com/openjdk/jmh) <br />代码审查：[Alibaba P3C](https://github.com/alibaba/p3c), [NCSS](https://javancss.github.io/)，[PMD](https://pmd.github.io/)，[SpotBugs](https://spotbugs.github.io/)，[jdepend](https://github.com/clarkware/jdepend) <br />数据库审计平台：[Yearning](https://dubbo.apache.org/zh/) | 持续集成    |
| [Disruptor](https://lmax-exchange.github.io/disruptor/),[disruptor-spring-manager](https://github.com/anair-it/disruptor-spring-manager)，[dragonboat](https://github.com/lni/dragonboat/) , [SOFAJRaft](https://www.sofastack.tech/projects/sofa-jraft/overview/)，[RoaringBitmap](https://github.com/RoaringBitmap/RoaringBitmap)，[Arthas](https://arthas.aliyun.com/doc/)，唯一ID生成：[uid-generator](https://spring.io/projects/spring-cloud-openfeign) | 其他        |
| Gin Web Framework，Redigo，gomail，logrus，go-sql-driver，go.uuid | Golang      |



