# 模型评测

LLM评测:1 人工体验（单模型对话） 2 人工对比体验(多模型对比) 3 客观自动化评估 4 主观自动化评估

A Survey on Evaluation of Large Language Models: https://arxiv.org/pdf/2307.03109

Prompt Engineering Guide : https://www.promptingguide.ai/

https://www.promptingguide.ai/zh

1.通用评测
2.业务落地评测
3.多模态评测

In-context learning FewShot

思维链COT推导能力评测，就是大模型涌现出来的思考分析推导的能力，一般在Prompt中加入一些激活词，比如一步步推导、逐步推理，就可以激活模型做思考链推导分析，
非推理类，加cot没有提升反而下降。
推理类的，没训练过，加cot后可能有提升。
推理类的，训练过的，加cot不一定有提升。

GPT4评分，设计prompt，告诉评分标准。

用户反馈分类。

评测基准工具：数据规模
OpenAI Evals
OpenCompass

https://github.com/MLGroupJLU/LLM-eval-survey

LLM 在生产领域的一个巨大的痛点：如何高效地评估这些开源的本地模型，能否达到我需要的生产性能？

评价体系：Chatbot Athena、Open LLM、OpenAI Evals 

为什么我反而会认为 OpenAI 的Evals 框架，才是真正有价值的 LLM 生产标尺？核心原因就是 LLM 在工业生产中真正被需要评估的特性是 「指令跟随」。

OpenAI Evals：Match：完全匹配，FuzzyMatch：模糊匹配，Includes：模型输出

https://github.com/openai/evals/blob/main/docs/eval-templates.md

https://github.com/athina-ai/athina-evals

https://github.com/bentoml/OpenLLM

准确率以外，Evals 还提供了标准差、精确度、召回率、F-Score 、平均 F-Score 

正是因为 Evals 可以自定义评估任务、评估比较方法、评估指标、评估模型，我们在业务生产中就可以轻易地使用它来检测模型性能，接入生产的 CI/CD 链路中。

https://github.com/WeOpenML/PandaLM/tree/main?tab=readme-ov-file

opencompass自动化评测平台：https://opencompass.org.cn/home https://github.com/open-compass/OpenCompass/

阿里云大模型自动化评测平台：https://help.aliyun.com/zh/model-studio/model-evaluation/



