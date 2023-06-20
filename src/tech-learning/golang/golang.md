# Golang

## go spec

地址：https://go.dev/ref/spec


## go blog

Russ Cox，Rob Pike

| 主题                        | 有视频 | 完成时间 | 地址                                          | 核心  |
|---------------------------|-----|------|---------------------------------------------|-----|
| goprotobuf                | N   |      | https://go.dev/blog/protobuf                |     |
| JSON-RPC                  | N   |      | https://go.dev/blog/json-rpc                |     |
| 斯坦福Rob Pike talk          | Y   |      | https://go.dev/blog/new-talk-and-tutorials  |     |
| Google IO大会               | Y   |      | https://go.dev/blog/io2010                  |     |
| 声明格式                      | N   |      | https://go.dev/blog/declaration-syntax      |     |
| 并发模型                      | N   |      | https://go.dev/blog/codelab-share           |     |
| Defer, Panic, and Recover | N   |      | https://go.dev/blog/defer-panic-and-recover |     |
| 并发模式：超时                   | N   |      | https://go.dev/blog/concurrency-timeouts    |     |
| 项目实战：SmartTwitter         | N   |      | https://go.dev/blog/smarttwitter            |     |
| Debug                     | N   |      | https://go.dev/blog/debug-status            |     |
|                           |     |      |                                             |     |
|                           |     |      |                                             |     |
|                           |     |      |                                             |     |

## go std

**标准库 https://pkg.go.dev/std**

1. 操作字符串重要的包：bytes，strings，strconv，unicode
2. 比较字节slice：bytes.Equals
3. strings.Map 对每个字符使用函数
4. 格式化 fmt
5. 操作系统 os
6. 缓冲io：bufio
7. io工具类：ioutil
8. 数学：math
9. 随机数：math/rand
10. 图片：image
11. http：net/http
12. 时间：time
13. 同步：sync
14. 命令行：flag
15. json：encoding/json
16. 大数：math/big
17. sha265摘要：crypto/sha256
18. 排序 sort
19. 模板 text/template html/template
20. 日志：log
21. 正则：regexp
22. 运行时：runtime 转储栈：Stack
23. rpc：net/rpc jsonrpc net/rpc/jsonrpc
24. 序列化 encode/gob

**扩展库 https://pkg.go.dev/golang.org/x**

1. exp：slices，maps

2. sync：errgroup，semaphore，syncmap，singleflight

## go talks

Go at Google: Language Design in the Service of Software Engineering
https://go.dev/talks/2012/splash.article

GopherCon 2016: Francesc Campoy - Understanding nil
https://www.youtube.com/watch?v=ynoY2xz-F8s

Another Go at Language Design
https://www.youtube.com/watch?v=7VcArS4Wpqk

Null References The Billion Dollar Mistake
https://www.youtube.com/watch?v=YYkOWzrO3xg

Errors are values
https://go.dev/blog/errors-are-values


## effective go

go语言源码：https://go.dev/src/

talks：https://go.dev/talks/

格式化：gofmt

注释：块注释，行注释  https://go.dev/doc/comment

名字：包名，Getter，接口名字

分号：

控制结构：for，swtich，if，break，contine，select

方法：函数和指针

Embedding（嵌入）

接口转换，类型声明

下划线标识符

Do not communicate by sharing memory; instead, share memory by communicating. CSP Linux Pipeline

function literals are closures

channel用来同步的，信号结束的。

带缓冲的channel可以用作信号量。

Go是一个并发语言，而不是一个并行语言，不是所有并行问题都适用于Go模型。详见讨论：Concurrency is not
parallelism  https://go.dev/blog/waza-talk

泄露的Buffer

type switch

真实库函数应该避免panic。

recover always returns nil unless called directly from a deferred function

recover is only useful inside deferred function

re-panic idiom changes the panic value if an actual error occurs

Go is powerful enough to make a lot happen in a few lines

### 扩展

Concurrency is not parallelism
https://go.dev/talks/2010/io/balance.go

https://go.dev/talks/2012/waza.slide#1

Communicating sequential processes C. A. R. Hoare 1978

channel没有locking

关键想法：数据结构使用channel和goroutines去构建并发， 结果是扩展性，简单，正确，并且没有锁。这种架构的好处。

Concurrency is about dealing with lots of things at once. Parallelism is about doing lots of things at once.

Don't communicate by sharing memory, Share memory by communicate.

Go Concurrency Patterns
https://go.dev/talks/2012/concurrency.slide#1

channel是同步工具，同步拆解为 send receive

并发模式：

Generator：Function return a channel

Channel as a handler on a service

Multiplexing

Restoring sequencing

select

timeout using select

timeout for whole conversation using select

receive on quit channel

Daisy chain：菊花链

Advanced Go Concurrency Patterns https://go.dev/talks/2013/advconc.slide#1

go run -race main.go Race Detector(Sync Issues)

for{

select {

}

}

select:no lock , no condtion

## 代码规范

Google Go 规范：https://google.github.io/styleguide/go/

pb最佳实践：https://protobuf.dev/programming-guides/dos-donts/

api最佳实践：https://protobuf.dev/programming-guides/api/

## Go在线书籍

https://go-kratos.dev/  go微服务框架

Go语言高级编程：https://chai2010.cn/advanced-go-programming-book/index.html

Go 语言编程之旅：https://golang2.eddycjy.com/

Go语言各种文档： https://learnku.com/go/docs

Go语言原本 ：https://golang.design/under-the-hood/