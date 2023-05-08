# 问题

**场景：**对话机器人全链路压测，端到端请求通过websocket，发出问题得到回答。

**现有方案：**通过jmeter进行websocket压测，但是由于同样问题的一个答案，会发出很多websocket请求，所以无法精确知道答案在哪一个websocket里面出现，所以难以编写WebSocket Sampler进行采样从而统计问答延时和答案正确率。

**websocket图：**

![dialog.png](images/dialog.png)

**jmeter图：**

![jmeter.png](images/jmeter.png)

**问题：**如何通过修改jmeter进行ws压测或者 有没有更好的方案实现这种场景的压测？

