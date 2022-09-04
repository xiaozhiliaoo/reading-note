# Spring Boot

https://docs.spring.io/spring-boot/docs/current/reference/html/index.html

看到这里了：https://docs.spring.io/spring-boot/docs/current/reference/html/features.html#features.testing.spring-boot-applications.spring-mvc-tests


## Notes





## Core

Convention_over_configuration

embed，starter，autoconfigure，production-ready features，no code generation


## Project Structure

spring-boot-starter-xxx

spring-boot-xxx-autoconfigure

spring-boot-xxx

springboot的结构
spring-boot-starter
spring-boot-autoconfigure
spring-boot

springboot-test结构
spring-boot-starter-test(spring-boot-starter)
spring-boot-test-autoconfigure
spring-boot-test

springboot-actuator结构
spring-boot-starter-actuator(spring-boot-starter)
spring-boot-actuator-autoconfigure
spring-boot-actuator

## Configuration Metadata

配置


## Features

Liveness State
Readiness StateL

Spring’s Environment abstraction

Database版本化管理：MyBatis Migrations，liquibase，flyway

https://metrics.ryantenney.com/  Spring integration for Dropwizard Metrics



## Actuator(运维能力)

文档：https://docs.spring.io/spring-boot/docs/current/reference/html/actuator.html

数据通过http/jmx接口暴露

spring-boot-actuator

spring-boot-starter-actuator

spring-boot-actuator-autoconfigure

Health:HealthContributor,HealthIndicator

Information:InfoContributor

Endpoint：和应用检测和交互的点。提供了很多内置的Endpoint.

Actuator Web API:https://docs.spring.io/spring-boot/docs/2.6.4/actuator-api/htmlsingle/#overview

BeansEndpoint,BeansEndpointAutoConfiguration

Endpoint可以通过Http或者JMX暴露出去，这个是怎么实现的呢？

dropwizard，micrometer(Spring Boot 2: Migrating From Dropwizard Metrics to Micrometer)

## Auto Configuration
spring-boot-autoconfigure


## 疑问：

starter里面的autoconfigure是怎么配置第三方库的呢？

mybatis-spring-boot-starter
mybatis-spring-boot-autoconfigure
mybatis-spring
mybatis

spring的autoconfigure的配置类不在原来库代码里面，这是怎么做到的呢？而common-xxx配置类在库实现里面。
以上例子是经典例子，
mybatis-spring配置了mybatis，从而在FactoryBean(Spring)获取SqlSessionFactory(MyBatis),是真实的创建了MyBatis的对象的，
但是mybatis-spring-boot-autoconfigure配置了mybatis，也创建对象。这就是自动装配。这一步是通过spring.factories文件实现的。

Spring的配置Bean概念，Configuration（配置的Bean），ConfigurationProperties（配置Bean的属性），autoconfigure指的是自动装配Bean.而在自动
装配过程中，用到了Properties

Spring Boot的设计是加载应用级配置，随后再考虑自动配置类。

单元测试专注于单一组件或组件中的一个方法，此处并不一定要使用Spring。Spring提供了
一些优势和技术——松耦合、依赖注入和接口驱动设计。这些都简化了单元测试的编写。但Spring
不用直接涉足单元测试,集成测试会涉及众多组件，这时就需要Spring帮忙了。

Spring Boot和Grails

HttpTrace默认的类，InMemoryHttpTraceRepository，100条，持久化实现需要继承HttpTraceRepository类

深入Spring Boot应用程序的内部细节：Actuator

ConfigurationProperties和Environment区别？

程序的配置，传入到