# AI大模型之美-徐文浩

https://cookbook.openai.com/

GPT-3、Stable Diffusion,Whisper,ChatGPT



分类、聚类、文本摘要、聊天机器人

https://github.com/xuwenhao/geektime-ai-course

https://colab.research.google.com/

AI 应用

## 工具

Midjourney,Dall-E 2


https://aituts.com/ai-generated-coloring-books/

https://poe.com/

彩云小译

https://chrome.google.com/webstore/detail/glarity-chatgpt-summary-t/cmnlolelipjlhfkhpohphpedmkfbobjc/related

scispace:

ChatPDF 

GitHub Copilot

notion.ai

机器翻译、文本生成、知识推理、命名实体识别

一个模型来解决所有的自然语言处理问题

Complete 可以让模型根据你的输入进行自动续写，Embedding 可以将你输入的文本转化成向量。

两个简单的 API 来解决传统的自然语言处理问题。

朴素贝叶斯算法

特征工程：2-Gram（Bigram 双字节词组）和 3-Gram（Trigram 三字节词组）

大语言模型：20 行代码的情感分析解决方案

零样本分类（Zero-Shot Classification）。

temperature:随机性

text-davinci-003 模型，允许最多有 4096 个 token。这个数量既包括你输入的提示语，也包括 AI 产出的回答

API：https://platform.openai.com/docs/api-reference/completions

Few-Shots Learning（少样本学习）

文本变成向量:Word2Vec、Bert,open-api Embedding

GPT-3预训练模型（Pre-trained Model）。GPT 的英文“生成式预训练 Transformer（Generative Pre-trained Transformer）

Facebook 的 Fasttext,Google 的 T5，Text-to-Text Transfer Trasnformer:文本到文本的迁移 Transformer.GPT-3 的 1750 亿参数。

 Fasttext、T5-small 和 T5-base 这三个预训练模型

情感分析分类器。好评和差评。

text-embedding-ada-002: Tiktoken+cl100k_base编码

模型评估：准确率，召回率 F1 Score = 2/ (1/Precision + 1/Recall)

Embedding+传统机器学习 LogisticRegression进行分类，而不是简单的向量相似性距离进行计算。

HuggingFace

ChatCompletion,gpt-3.5-turbo,role:assistant,user,system

HuggingFace+Gradio 的部署方式，特别方便我们演示给其他人看。

每次要把全部对话发给ChatGPT。

文本分类：embedding+k-means 然后 completion，可以产生有意义的分类。

利用文本摘要支持无限轮数的聊天。

使用提示语对文本进行总结。

Notion AI

同样含义的中文，目前消耗的 Token 数量是比英文多的。

模型：GPT-4 家族，GPT-3.5 家族，Ada、Babbage、Curie 以及 Davinci， text-embedding-ada-002、text-similarity-ada-001

维度：
embedding-ada:  1536
similarity-ada:  1024
babbage-similarity:  2048
search-babbage-query:  2048
curie-similarity:  4096
davinci-similarity:  12288

text-davinci-003支持文本插入功能；帮助色情、暴力等内容进行审核过滤的moderate接口

文本改写应用

控制输出的内容参数：presence_penalty(存在惩罚)，frequency_penalty(重复惩罚)，temperature，logit_bias(精确控制内容)

通过 Embedding 进行语义搜索

利用 Embedding 信息进行商品推荐的冷启动

通过 FAISS 加速搜索过程:Facebook AI Similarity Search，高维向量的相似性搜索。

Faiss 的原理，是通过 ANN 这样的近似最近邻的算法，快速实现相似性的搜索。

Faiss数据量受限于内存大小。数据量进一步增长，需要选用一些向量数据库来进行搜索。OpenAI推荐Pinecone和Weaviate，也有国人的Milvus（ https://milvus.io/docs ）。

llama-index框架：https://www.llamaindex.ai/

Llama Index阅读一本书，自己数据和llm联系起来

ChatGPT plugins：https://openai.com/blog/chatgpt-plugins

## Vector database options include:
Chroma, an open-source embeddings store：https://docs.trychroma.com/
Elasticsearch, a popular search/analytics engine and vector database：https://www.elastic.co/guide/en/elasticsearch/reference/current/knn-search.html
Milvus, a vector database built for scalable similarity search：https://milvus.io/docs/architecture_overview.md
Pinecone, a fully managed vector database：https://docs.pinecone.io/docs/overview
Qdrant, a vector search engine：https://qdrant.tech/documentation/
Redis as a vector database：https://redis.io/docs/interact/search-and-query/advanced-concepts/vectors/
Typesense, fast open source vector search
Weaviate, an open-source vector search engine
Zilliz, data infrastructure, powered by Milvus

A vector database is a type of database that indexes and stores vector embeddings for fast retrieval and similarity search

Semantic search：https://www.elastic.co/guide/en/elasticsearch/reference/current/semantic-search.html

Knn search：https://www.elastic.co/guide/en/elasticsearch/reference/current/knn-search.html

https://github.com/pgvector/pgvector

自己数据在大语言模型上实现两种方式：

1. 找数据利用OpenAI提供的“微调”（Fine-tune）接口，在原来的基础上训练一个新模型出来：https://platform.openai.com/docs/guides/fine-tuning
2. 先搜索，后提示（比如llama-index加载本地文件）

llama_index 对于文章进行小结：将文章进行拆分，llama-index最简单的索引结构：GPTListIndex

引入多模态，让 llamd-index 能够识别小票。

DataConnector:https://llamahub.ai/

llama-index是一种使用大语言模型的设计模式，为“第二大脑”模式。通过先将外部的资料库索引，然后每次提问的时候，先从资料库里通过搜索找到有相关性的材料，然后再通过 AI 的语义理解能力让 AI 基于搜索到的结果来回答问题。

Bing 的解法——先搜索，后提示。搜索到结果作为提示语给AI。

sentence-transformers 是目前效果最好的语义搜索类的模型。

ChatGLM：清华大学语言模型：https://github.com/THUDM/GLM-130B

单机的开源小模型：paraphrase-multilingual-mpnet-base-v2（128 token） 模型来计算 Embeddding 并进行语义搜索，然后通过 chatglm-6b-int4 的模型来进行问答的解决方案了。而且这两个模型，可以跑在一块家用级别的显卡上。

模型的推理能力。

ChatGPT让人震撼的原因效果还是要远远超出任何一个竞争对手和开源项目的。

ChatGPT现在极其擅长的是做一些不需要新知识更新的任务。比如生成贺词、生成Excel表格、生成经典代码等等。而对于需要新知识的任务，如对新的学术知识的查找，
总结，生成一份新机器的说明书，生成对当下新闻的报导，对新资讯的总结分析归类等等，ChatGPT就显得力不从心了，即使生成的文本看似流畅，但是内容却一定是错误的。

https://sharegpt.com/c/pGYAz2p

通过大语言模型写单元测试代码。

Unit test writing using a multi-step prompt (with the older API)

通过多个 Prompts 来完成单元测试

LangChain简化多步提示语

https://www.langchain.com/: Get your LLM application from prototype to production

Langchain 可以顺序地通过多个 Prompt 调用 OpenAI 的 GPT 模型.

大语言模型进行链式调用：LangChain 通过将多个 LLMChain 组合成一个 SequantialChain 并顺序执行，大大简化了这类任务的开发工作。

Stable Diffusion 是文本到图像的模型： https://zh.wikipedia.org/zh-cn/Stable_Diffusion

Wolfram

LLMChain 是一个很强大的武器，它可以把解决一个问题需要的多个步骤串联到一起。

LLMChain增强了 AI 的实用性，解决了几个之前大语言模型处理得不好的问题，包括数学计算能力、实时数据能力、和现有程序结合的能力，以及搜索属于自己的资料库
的能力。你完全可以定义自己需要的 LLMChain，通过程序来完成各种任务，然后合理地组合不同类型的 LLMChain 对象，来实现连 ChatGPT 都做不到的事情。

Langchain：BufferWindowMemory，SummaryMemory，BufferSummaryMemory，EntityMemory，KnowledgeGraphMemory

LangChain：BufferWindow，滑动窗口记忆

ConversationSummaryBufferMemory

命名实体识别的算法：nlu实现，NER算法

langchain rag模式（检索增强生成（Retrieval Augmented Generation, RAG）） rerank模式 rewrite模式。

rerank：rag：https://luxiangdong.com/2023/11/06/rerank/ 重排序

rewrite：rag：https://docs.dify.ai/v/zh-hans/learn-more/extended-reading/retrieval-augment/rerank

Prompt Engineering Guide：https://www.promptingguide.ai/

Retrieval-Augmented Generation Pipeline：大模型训练Pipeline

langchain agent：https://python.langchain.com/docs/modules/agents/ agent帮忙插订单号。

把回答不同类型问题的 LLMChain 封装成不同的 Tool，也可以直接让 Tool 去调用内部查询订单状态的功能。

电商客服功能的聊天机器人。

langchain：Agent、Memory、VectorStore、LLMChain

OpenAI 提供的模型微调（Fine-tune）

这个模型“微调”完成之后，就可以直接向模型提问了。而不用再像之前使用 llama-index 或者 LangChain 那样，
先通过 Embedding 来查询相关资料，然后把查找到的资料也一并提交给 OpenAI 来获得所需要的答案。

模型微调的成本考量：Ada、Babbage、Curie 和 Davinci  https://openai.com/pricing#language-models

流式生成：Completion接口stream=True

语音识别模型 Whisper的方法transcribe，语音转文字：https://platform.openai.com/docs/guides/speech-to-text

能够在音频内容的转录之前提供一段 Prompt，来引导模型更好地做语音识别，是Whisper模型的一大亮点。

音频分割：PyDub

Whisper：https://openai.com/research/whisper

语音合成（Text-To-Speech）

SSML 是 Speech Synthesis Markup Language，语音合成标记语言

语音合成：百度开源的 PaddleSpeech  https://github.com/PaddlePaddle/PaddleSpeech/blob/develop/demos/text_to_speech/README_cn.md

Azure AI 服务：https://azure.microsoft.com/zh-cn/products/ai-services

“数字人”

文本聊天机器人->语音输入->语音合成与播放

用 D-ID 给语音对口型

gradio

ChatGPT用ChatGLM来代替，语音识别我们可以使用本地的Whisper模型，语音合成也可以通过PaddleSpeech里的fastspeech2的开源模型来完成。D-ID可以通过开源模型PaddleBobo来合成这样的口播视频。

Diffuser 类型,GAN 生成影像

Huggingface 的火爆离不开Transformers库

小尺寸的 T5-base 和裁剪过的ChatGLM-6B-INT4，而不是FLAN-UL2或者ChatGLM-130B这样真正的大模型

Transformers Pipeline：https://huggingface.co/docs/transformers/main_classes/pipelines

Pipeline 是 Transformers 库里面的一个核心功能，它封装了所有托管在 HuggingFace 上的模型推理预测的入口。

https://huggingface.co/models

ChatGPT 的强大之处？上面这些自然语言处理任务，常常需要切换使用不同的专有模型。但是在 ChatGPT 里，只需要一个通用的模型，就能直接解决所有的问题。这也是很多人惊呼“通用人工智能”来了的原因。

HuggingFace：Inference API

如何部署自己的大模型? HuggingFace Inference Endpoint

HuggingFace 将部署一个开源模型到线上的成本基本降低到了 0。不过，目前它只支持海外的 AWS、Azure 以及 Google Cloud，并不支持阿里云或者腾讯云

So-Vits-SVC 算法实现的 AI 孙燕姿

AutoGPT 和 BabyAGI 这样的自主智能体（Autonomous Agent）

DoNotPay：AI 律师

Meta 开源：LLaMA

OpenAI：三维建模的生成式模型 Shap-E

AI应用网站：https://www.futurepedia.io/

深度学习：PyTorch/Tensorflow/Paddle/Mxnet

NLP课程：https://huggingface.co/learn/nlp-course/zh-CN/chapter1/1

Retrieval-Augmented Generation for Large Language Models: A Survey：https://arxiv.org/pdf/2312.10997.pdf

2017年Transformer架构：Attention Is All You Need https://arxiv.org/pdf/1706.03762.pdf

BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding：https://arxiv.org/pdf/1810.04805.pdf

深度学习百科及面试资源：https://paddlepedia.readthedocs.io/en/latest/index.html

腾讯云混元大模型：https://cloud.tencent.com/document/product/1729


