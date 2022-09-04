# common-design

需要给业务层提供通用类库，该以怎么样的方式提供？通常有以下几种方式：

1.类似于apache common这种模式，应用层调用库。

2.类似于Spring boot stater+auto-configuration这种模式。

3.类似于IOC/框架模式/模板(XXXTemplate)/策略(回调)模式，框架调用应用层代码。典型的如JDBCTemplate.

4.类似于普通Spring模式，提供库，并且暴露配置且提供默认配置，由应用层自定义设置。
