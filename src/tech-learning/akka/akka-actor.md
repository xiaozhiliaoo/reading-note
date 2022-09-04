# Akka Actor

## Progress




## Notes

tell,do not ask!

发消息方法：
tell(fire and forget)
ask(get response)
pub/sub

acotr单线程模型，并发安全

become 通过行为改变状态

当actor中出现futrue时候，可以使用pipeline，否则会打破单线程模式

akka，riak,cassandra

ActorRef,ActorPath,Actor Selection

Replace Actor stack behavior vid become/unbecome/FSM

Actor如果是计数器，那么需要持久化。Stateful Actor

Sender -> Command -> Actor -> Event -> DB

线上推荐akka cluster，而不是remote

Send messages：Tell:fire-forget,Ask:Send-And-Receive-Future

Forward message: useful when writing actors that work as routers, load-balancers, replicators etc.



## Reference

https://doc.akka.io/docs/akka/current/actors.html#actor-lifecycle