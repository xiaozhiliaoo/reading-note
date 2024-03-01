# Spring Core

container:configuration model + dependency injection

Lightweight and minimally invasive development with POJOs
Loose coupling through DI and interface orientation
Declarative programming through aspects and common conventions
Eliminating boilerplate code with aspects and templates

Spring一个包里面的support都是接口的便利实现。

## 核心对象
BeanWrapper,PropertiesEditor

BeanFactory,XmlBeanFactory,ListableBeanFactory,DefaultListableBeanFactory 

BeanDefinition

ApplicationContext,WebApplicationContext,XmlWebApplicationContext

ContextLoader/ContextLoaderListener/ContextLoaderServlet

ApplicationContext:ClassPathXmlApplicationContext,FileSystemXmlApplicationContext,GenericGroovyApplicationContext
最灵活的方式：GenericApplicationContext 

metadata -> bean definition -> bean factory -> applcation context

xxxTemplate(JDBC,JMS)

Resource,AbstractResource,ResourceLoader

BeanDefinitionRegistry,BeanDefinition,

异常处理：受检成运行，捕获能处理

Spring源码先看Interface，在看Interface继承关系，在看AbstractInterface

AbstractInterface里面的protected方法和属性需要注意。没有protected属性，说明不是为了继承而设计的。

spring aop的实现？

spring ioc的实现？

spring 事务的实现？



## IOC

instantiating, configuring, and assembling the beans

configuration metadata:XML, Java annotations, or Java code

bean definition:Class,Name,Scope,Constructor arguments,Properties,Autowiring mode,Lazy initialization mode,Initialization method
,Destruction method

autowiring collaborators

FactoryBean 自定义Bean创建
ProxyFactoryBean 代理包装Bean
TransactionProxyFactoryBean 事务包装代理

dependencies are on interfaces or abstract base classes, which allow for stub or mock implementations to be used in unit tests

uml里面有association和dependency. 而dependency和ioc dependency不一样，ioc dependency是所有有关联的对象，而不在乎对象来自哪里。
结合起来看，就是依赖注入(IOC)成关联(UML)。

public class A {
    
}

public class B {
    
}

public class C {
  //此时没有办法注入A，B
  public void doTask(A a,B b){}
}

main() {
    C c = new C();
    c.doTask(new A(), new B());
}

这个依赖放在了方法上面了，



## AOP

Aspect：跨多个类的模块化横切点
Join point：程序执行的地点。
Advice：程序执行的地方发生的操作。
Pointcut：满足程序执行地点的条件。
Introduction：代表类型声明其他方法或字段
Target object: 被多个Aspect Advice的对象
AOP proxy:
Weaving:

join points matched by pointcuts is the key to AOP

auto-proxying

aop is proxy-based frameworks

动态代理失效： AspectJ does not have this self-invocation issue because it is not a proxy-based AOP framework.

Pointcut以及实现.

创建代理方式：
Dependency on Spring IoC：ProxyFactoryBean是Spring创建代理的Bean，ProxyFactoryBean通过
Dependency on Programmatically: ProxyFactory
Dependency on Auto-proxy:BeanNameAutoProxyCreator，DefaultAdvisorAutoProxyCreator

java代理发展：静态，动态。spring aop框架(可单独使用)
java依赖管理：手动，spring ioc容器(可单独使用)

TransactionProxyFactoryBean




## Data Access

JDBC,DAO(二级抽象),ORM(JPA,Hibernate),Spring-Data-JDBC,spring-boot-starter-data-jdbc
一级(低级别抽象)：一个控制JDBC工作流程和错误处理的框架。 org.springframework.jdbc.core 核心JdbcTemplate
二级(高级别抽象)：RDBMS操作建模Java对象操作 - org.springframework.jdbc.object 核心RdbmsOperation
ORM:org.springframework.orm

mybatis,spring-mybatis,spring-mybatis-starter

AOP:Advisor=Advice+PointCut

## AOP

JavaBean+ProxyFactory=Proxy JavaBean

JavaBean+ProxyFactory+TransactionInterceptor=Proxy Transaction JavaBean

JavaBean+TransactionProxyFactoryBean=Proxy Transaction JavaBean

## 其他感悟

Spring从来不用别人接口，都是自己定义接口。

Spring源码先读接口和实现类，此垂直为类之职责。在读关联，此水平为类之交互。




