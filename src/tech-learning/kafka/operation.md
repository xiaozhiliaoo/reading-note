# Operations


## 消费者操作

### 打印指定偏移量的消费者的消息

./kafka-console-consumer.sh --bootstrap-server brokerIP:brokerPort --topic  yourTopic  --partition 0 --offset 19831988 --property print.key=true --max-messages 1

其他属性有：
print.timestamp Set to true to display the timestamp of each message (if available).
print.key Set to true to display the message key in addition to the value.
print.offset Set to true to display the message offset in addition to the value.
print.partition Set to true to display the topic partition a message is consumed from.
key.separator Specify the delimiter character to use between the message key and message value when
printing.
line.separator Specify the delimiter character to use between messages.
key.deserializer Provide a class name that is used to deserialize the message key before printing.
value.deserializer Provide a class name that is used to deserialize the message value before printing.


## 消费组操作

### 查看消费组

./kafka-consumer-groups.sh --bootstrap-server brokerIP:brokerPort   --describe --group yourGroup

### 重置消费者偏移量

./kafka-consumer-groups.sh --bootstrap-server brokerIP:brokerPort  --group yourGroup  --topic yourTopic --reset-offsets --to-offset yourOffset --execute

./kafka-consumer-groups.sh --bootstrap-server brokerIP:brokerPort  --group yourGroup  --topic yourTopic --reset-offsets -to-latest --execute

