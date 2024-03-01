# 异构任务并行化

## CompletableFuture研究

CS:CompletionStage（链式调用） CF:CompletableFuture

thenCombine 两个CompletionStage结果汇总。

thenCompose 一个CompletionStage结果是另外一个CS的输入。

apply是Function,accept是Consumer.either是任意异构，compose前一个输入作为当前参数，combine组合两个，async是fj或tpe.

### 提交任务 

runAsync, supplyAsync

### 转换

thenRun(不进不出Runnable), thenAccept(只进不出Consumer),thenApply(有进有出Function)

### 组合

thenCompose, thenCombine, allOf, anyOf,either

### 完成

whenComplete,handle

### 异常

exception