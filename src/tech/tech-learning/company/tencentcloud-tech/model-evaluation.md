# LLM模型评测

## 核心论文

**A Survey on Evaluation of Large Language Models**: [https://arxiv.org/pdf/2307.03109](https://arxiv.org/pdf/2307.03109)

**Prompt Engineering Guide** : [https://www.promptingguide.ai/zh](https://www.promptingguide.ai/zh)

## 评测目的

1. 了解模型好坏程度和优缺点。
2. 更好指导与人类交互优化，进行模型优化。

## 评测特点

1. 不能简单说对/错，只能说好/坏，需要设计指标度量对比。
2. LLM通用能力强，应用面广，单任务评测不适用，需要设计Prompt拆解多任务评测。

## 评测挑战

1. 快速接入模型，对比效果。
2. 客观量化，公平，对比模型性感差异。
3. 评估成本高，效率低。

## 评测场景

1. 通用评测。
2. 业务落地评测。
3. 多模态评测。

## 评测方式

建立一套可量化的指标，告诉哪个更好，以及好多少。

1 人工体验（体验模型效果，解决日常问题，单模型对话） 

2 人工对比体验(模型多多对比，多模型对比) 

3 客观自动化评估（NLP基准评测，学科考试基准评测） 

4 主观自动化评估（开放问答基准评测）

| 方法           | 评测方法                      | 适用场景                          | 优劣                                                         |
| -------------- | ----------------------------- | --------------------------------- | ------------------------------------------------------------ |
| 人工体验       | 单模型对话                    | 体验模型效果<br />解决日常问题    | 单模型打分，方便但缺乏统一评价标准                           |
| 人工对比体验   | 多模型对比                    | 模型两两对比                      | 通过对比容易发现差异，但不够全面                             |
| 客观自动化评测 | 传统算分（准确率/Bleu/Rouge） | NLP基准评测<br />学科考试基准评测 | 大规模评测，更客观准确和全面，但仅适合有标准答案的问题       |
| 主观自动化评测 | GPT4打分                      | 开放问答基准评测                  | 大规模评测，有统一且相对客观的评价标准，覆盖率较广，但是对复杂问题自动化打分存在BadCase。 |

## 评测标准

ROUGE（Recall-Oriented Understudy for Gisting Evaluation）：自动摘要评价指标

BLEU（Bilingual Evaluation Understudy）：机器翻译系统生成结果的质量的指标

准确率（Accuracy）：准确率 = (正确预测的样本数 / 总样本数) * 100%

精确率（precision）：TP/TP+FP

召回率（Recall）：TP/TP+FN

F-score

## 评测方案

Open AI Evals：fact，closedqa，battlw

PandaLM：https://github.com/WeOpenML/PandaLM

HELM（holistic evaluation of language models）： https://crfm.stanford.edu/helm/classic/latest/

## 系统评测

1. 评测集设计

客观（有正确答案或者参考答案）：选择题，特定任务（文本摘要，机器翻译，语法纠错），few shot，cot

主观（没有正确答案）：开放性问答，多轮对话【GPT4打分，主观】

2. 基础能力评测

NLU：阅读理解，自然语言推理，语义相似度，安全性测试，情感分析，文本分类，常识问答，命名实体识别【Accuracy】

NLG：文本摘要（Rouge-L），机器翻译（Bleu），多轮对话（Blue），句子完成（Accuracy），语法纠错（F1 Score）

中文和英文能力

3. 学科考试能力评测

MMLU：https://github.com/standardgalactic/mmlu

C-Eval：https://cevalbenchmark.com/index_zh.html

AGIEval：https://github.com/ruixiangcui/AGIEval

GAOKAO：https://gitee.com/hf-models/telechat-7B

4. 鲁棒性评测

鲁棒性评测主要看diff百分比，Diff=(最佳-最差)/最佳

抗干扰评测：添加干扰信息观察模型时候可以正确作答

5. FewShot学习能力评测
   
gpt4学习能力遥遥领先，chatgpt对比国内模型依然有明显优势；
   
例子数量K与Acc成正相关，但对于国内模型，K超过5之后Acc存在一定震荡。

强调学习能力，与知识储备无关。

Single-Turn-ICL/Multi-Turn-ICL(In-Context Learning)

6. 思维链COT评测（**思考分析推导+Prompt激活词**）

思维链COT推导能力评测，就是大模型涌现出来的思考分析推导的能力，一般在Prompt中加入一些激活词，比如一步步推导、逐步推理，就可以激活模型做思考链推导分析，
非推理类，加COT没有提升反而下降。
推理类的，没训练过，加COT后可能有提升。
推理类的，训练过的，加COT不一定有提升。

激活词：请一步步的推理分析解决以下问题/请逐步推理回答问题

7. 开放性问答评测

用GPT4打分+人工纠正

GPT4自动评分效果行业主流认可：1 聊天 2 主观问题 3 推理分析 4 其它 5 客观知识问题 6 创作生成

8. 多轮对话能力评测

第二问依赖第一问，第二问独立于第一问，第二问质疑第一问

缺乏配套的平台支撑工具、缺少闭源业务评测集、评测覆盖面不够细，OpenAI Evals主要还是做了NLP基础能力评测这块

9. 长文本评测

大海捞针评测

长文本FAQ问答评测

多文档阅读理解评测

10. 多模态评测

图生文、文生图

## 业内常用框架

OpenAI Evals，Chatbot Arena，MT-Bench，AlpacaEval等。

| 评测工具        | 地址                                       | 所属机构   | 开放能力                                           | 数据规模                  | 核心价值点                             |
| --------------- | ------------------------------------------ | ---------- | -------------------------------------------------- | ------------------------- | -------------------------------------- |
| OpenAI Evals    | https://github.com/openai/evals            | OpenAI     | 评测框架代码/数据集均开源                          | 585                       | 评测框架代码扩展性强，评测集丰富全面   |
| OpenCompass司南 | https://opencompass.org.cn/home            | OpenXLab   | 提供第三方评测服务，开源评测框架代码，数据集半公开 | 50+                       | 评测框架代码可用，评测集分类丰富可借鉴 |
| FlagEval天秤    | https://flageval.baai.ac.cn/#/home         | 智源       | 提供第三方评测                                     | 100+                      | 评测集分类方法可借鉴                   |
| CLEVA           | https://github.com/LaVi-Lab/CLEVA          | LaVi-Lab   | 开源中文评测数据集                                 | 66个中文评测集，59266道题 | 中文评测集可即借鉴                     |
| SuperCLUE       | https://github.com/CLUEbenchmark/SuperCLUE | CLEUE      | 提供第三方评测服务                                 | 1k+                       | 评测集分类方法可借鉴                   |
| AlpacaEval      | https://tatsu-lab.github.io/alpaca_eval/   | 斯坦福大学 | 开源英文指令遵循评测集                             | 5个评测集，805道题        | 提供基础验证集合                       |

## Prompt优化

### Claude Anthropic 

https://docs.anthropic.com/zh-CN/prompt-library/library

### CO-STAR框架

https://mp.weixin.qq.com/s/AWnQL3forAP-gB7e2ZEXdQ

C：context O：objective S：Style T：Tone  A：audience R：Response



## 其它笔记

平台的创新点：

1. 平台可视化对比：汇总对比、详情对比、图标分析工具：胜负对战分析，对战热力分析，模型鲁棒性分析，雷达图分析，LeaderBoard

2. 自助评测，自助自动化评测，
3.  覆盖面广（涵盖知识，理解，推理，考试，对话，代码，安全）

从对错道好坏，分数。

In-context learning fewshot

FewShot：给例子让模型学习   COT：给出推理让模型学习。

鲁棒性测试，抗干扰测试：模型多次输入答案是不是一样的。【阅读理解：多次选项不一样，是防止刷题作弊】

GPT4评分，设计prompt，告诉评分标准。

https://github.com/MLGroupJLU/LLM-eval-survey

LLM 在生产领域的一个巨大的痛点：如何高效地评估这些开源的本地模型，能否达到我需要的生产性能？

评价体系：Chatbot Athena、Open LLM、OpenAI Evals

为什么我反而会认为 OpenAI 的Evals 框架，才是真正有价值的 LLM 生产标尺？核心原因就是 LLM 在工业生产中真正被需要评估的特性是：指令跟随。

OpenAI Evals：Match：完全匹配，FuzzyMatch：模糊匹配，Includes：模型输出

https://github.com/openai/evals/blob/main/docs/eval-templates.md

https://github.com/athina-ai/athina-evals

https://github.com/bentoml/OpenLLM

准确率以外，Evals 还提供了标准差、精确度、召回率、F-Score 、平均 F-Score

正是因为 Evals 可以自定义评估任务、评估比较方法、评估指标、评估模型，我们在业务生产中就可以轻易地使用它来检测模型性能，接入生产的CI/CD 链路中。

https://github.com/WeOpenML/PandaLM/tree/main?tab=readme-ov-file

opencompass自动化评测平台：https://opencompass.org.cn/home https://github.com/open-compass/OpenCompass/

阿里云大模型自动化评测平台：https://help.aliyun.com/zh/model-studio/model-evaluation/

opencompass：https://github.com/open-compass/OpenCompass/

```text
COT（Chain Of Thought）：https://cloud.tencent.com/developer/article/2428185 比如数学推理，给出步骤，包括Few-shot CoT，Zero-shot CoT

模版：Question ChainOfThought Answer ｜ Test Question

Question Answer ｜ Test Question

Zero-Shot-CoT方法存在不稳定性，而Manual-CoT方法需要大量人工成本投入。作者提出了一种基于Auto-CoT的方法
```

ICL（In-Context Learning）：https://cloud.tencent.com/developer/article/2428186

一文总结提示工程框架，除了CoT还有ToT、GoT、AoT、SoT、PoT：https://blog.csdn.net/xixiaoyaoww/article/details/133101929

增强LLM推理：Chain-of-Thought，Chain-of-Thought-Self-Consistency，Tree-of-Thoughts，Graph-of-Thoughts，Algorithm-of-Thoughts，Skeleton-of-Thought，Program-of-Thoughts

```text
COT：与其直接输出答案，不如为语言模型提供中间推理示例来指导其响应。
COTC：构建多个思维链，对每个思维链进行评估，最终选择最有效、最连贯的思维链。
TOT：以树状形式展开思维链。允许回溯，探索从一个基本想法产生的多个推理分支。 https://arxiv.org/pdf/2305.10601
GOT：将树结构演化为直接非循环图，引入了自我循环。自我循环可以巩固一条特定的思路，也可以将多个想法聚合成一个连贯的思路。
AOT：维护单个不断发展的上下文链，消除了对思维树中冗余查询的需求。它探索了一条多变的推理之路。
SOT：首先生成一个答案蓝图，然后并行地充实细节，从而减少生成完整答案所需的时间。
PoT：将问答背后的推理过程公式化为一个可执行程序，将程序解释器输出作为最终答案的一部分。
```

大模型评测：https://wqw547243068.github.io/llm_eva

## Prompt Engineering Guide 学习笔记

LLM研究：Agent（记忆，规划，工具），RAG（输入，索引，检索，生成），推理，忠实度，上下文记忆，减少幻觉，