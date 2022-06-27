# Java并发编程实战

作者：Brian Goetz Tim Peierls Joshua Bloch Joseph Bowbeer David Holmes Doug Lea

出版时间：2006年5月19日

## 进度

开始时间：2022-06-18






## 笔记

线程安全性：当多个线程访问某个类时候，这个类始终表现正确的行为。

线程安全性：当多个线程之间操作无论采用什么执行时序或者交替方式，都能保证不变形条件不被破坏。

由于ConcurrentHashMap不能被加锁来执行独占访问，因此无法通过客户端加锁来构建新的原子操作。ConcurrentMap方法都是原子，复合操作，put+get本身不是线程安全的。

Semaphore可以把任何容器变成有界阻塞容器。

## 书中加粗的内容

1. 框架通过在框架线程中调用应用程序代码将并发性引入到程序中，在代码中将不可避免访问应用程序状态，因此所有访问这些状态的代码路径必须是线程安全的。
2. 要保持状态的一致性，就需要在单个原子操作中，更新所有的状态变量。
3. 对于可能被多个线程同时访问的可变状态变量，在访问它时都需要持有同一把锁，此时状态变量是由这个锁保护的。
4. 每个共享的和可变的变量都应该只由一个锁保护，从而使得维护人员知道是哪一个锁。
5. 对于每个包含多个变量的不变性条件，涉及的所有变量都需要同一个锁来保护。
6. 加锁的含义不仅仅局限于互斥行为，还包括内存可见性。为了确保所有线程都能看到共享变量的最新值，所有执行读操作或者写操作的线程都必须在同一个锁上同步。
7. 加锁技能保证可见性和原子性，而volatile还能保证可见性。
8. 