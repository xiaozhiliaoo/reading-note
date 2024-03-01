# Spring Cloud Common

https://docs.spring.io/spring-cloud-commons/docs/current/reference/html/

## Core Class
SpringApplication
SpringApplicationBuilder 
BootstrapConfiguration

DiscoveryClient 
ServiceRegistry 
LoadBalancerClient



## Notes

Cloud核心包：
Spring Cloud Context and Spring Cloud Commons and Spring Cloud Load Balancer and Circuit breaker 

child contexts inherit property sources and profiles from their parent

common patterns: service discovery, load balancing, and circuit breakers


springcloud common loadbalance and spring cloud loadbalance 区别是什么？

common里面提供的接口，并没有提供实现，而spring cloud loadbalance提供了实现。
service discovery/register 实现：consul,zk,eureka
load balancing 实现：spring cloud loadbalance
circuit breaker实现：Resilience4J，Sentinel，Spring Retry(Spring Cloud Circuit Breaker)

一些新的endpoint,引入了spring-boot-actuator，refresh，restart，pause，env

Refresh入口类是：RefreshEndpoint，RefreshScope实现了GenericScope，GenericScope实现了Scope类，
也就是@RefreshScope是@Scope("refresh")

