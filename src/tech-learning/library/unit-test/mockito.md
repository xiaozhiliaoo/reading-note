# mockito


## Mockito
Mockito

when...thenXXX(not void) ... invoke
when...thenAnswer ... ... invoke


doXXX...when (void)... invoke
doAnswer...when(void)... invoke

doAnswer使用场景是什么？测试有参数无返回值，无参数无返回值.

## BDDMockito
BDDMockito

given...willReturn




verify

Argument matchers
ArgumentCaptor




@Mock
@Spy
@Captor
@InjectMocks

SpringBoot:
@MockBean
@SpyBean

@Mock和@MockBean区别是什么？
@Mock和@InjectMocks区别是什么？
doAnswer.when和when thenReturn和when thenAnswer和doReturn when区别区别？
doAnswer.when返回空，就是void方法。


组合：
@Mock和@InjectMock
@MockBean和@Autowired

Use doAnswer() when you want to stub a void method with generic Answer.
