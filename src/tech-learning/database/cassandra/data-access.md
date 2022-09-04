# Data Access



## 存储层封装的演进

JDBC->commons-dbutils->Template->ORM(MyBatis)->Spring Data  每一次演进的本质区别是什么。

## 为什么要有common-cassandra

assandra datastax driver有三种模式：statement，mapper，accessor，spring data cassandra

开源的很好，但是很复杂，学习成本很高。开发只能记住最简单的使用。

## 功能

支持直接注入@Autowired Accessor(启动时候引入@Accessor)

加了些配置。和方便开发使用。”没有新加机制“。

新的机制。