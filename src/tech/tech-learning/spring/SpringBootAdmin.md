# Spring Boot Admin

https://codecentric.github.io/spring-boot-admin/

注册方式：Admin Client或者Discovery Client

服务通过Admin Cli ent注册到Admin Server上了。

Service引入Admin Client把自己ip注册到Admin Service，然后Admin Service读取Admin Client的actuator接口？

Admin Client注册的类：ApplicationRegistrator，注册到Admin Server的InstancesController#register方法了。

Admin Server提供了三个Controller来接受请求，InstancesController，ApplicationsController，InstancesProxyController

Admin Server通过InstanceWebClient调用Service. 从而对Service进行控制。

核心实体类：Application，Instance，InstanceEvent（注册，不注册，状态更新，），Registration，InstanceEventStore

注册信息存在了哪里？InstanceEventStore，默认注册在内存中了。

基于事件的注册，将事件注册到内存中。