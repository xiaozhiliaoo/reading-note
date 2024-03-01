# jmx

spring对jmx的处理：

step1:在spring-framework里面封装jmx,MBeanExporter,AnnotationMBeanExporter

step2:在spring-autoconfigure中自动配置jmx,JmxAutoConfiguration

step3:在spring-boot-actuator中通过JmxEndpointExporter将endpoint暴露出去,endpoint本身可以通过http和jmx暴露。
spring-boot-actuator-autoconfigure中配置JmxEndpointAutoConfiguration

step4:在spring-boot-admin中通过jolokia暴露所有jmx(endpoint和其他jmx)


https://docs.oracle.com/javase/tutorial/jmx/overview/index.html

https://docs.spring.io/spring-framework/docs/current/reference/html/integration.html#jmx

https://docs.spring.io/spring-boot/docs/current/reference/html/actuator.html#actuator.jmx

https://codecentric.github.io/spring-boot-admin/2.5.1/#jmx-bean-management


# JDK自带的MBean

java.lang.management

BufferPoolMXBean
ClassLoadingMXBean
CompilationMXBean
GarbageCollectorMXBean
MemoryMXBean
OperatingSystemMXBean
RuntimeMXBean
ThreadMXBean
