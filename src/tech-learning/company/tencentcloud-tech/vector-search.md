# 向量检索

## 最邻近算法

KNN(K最近邻)

ANN(近似最近邻)

LSH(位置敏感哈希)

评估最近邻搜索：速度，内存，准确性

向量数据库的核心在于相似性搜索

## faiss

https://github.com/facebookresearch/faiss

https://github.com/DataIntelligenceCrew/go-faiss

## openai

获取openai的Embedding: https://github.com/sashabaranov/go-openai/blob/master/embeddings.go

## vector database

https://guangzhengli.com/blog/zh/vector-database/

## 其他

Word Embedding即词向量

检索向量后，给模型，减少了无用的语义。

## 视频

### youtube

#### How to Choose a Vector Database in 2023：https://www.youtube.com/watch?v=aX_hdQEintc

IVF，HSNW



The Pinecone Vector Database System：https://www.youtube.com/watch?v=8LXotdzX_84

CMU MLDB：https://db.cs.cmu.edu/seminar2023/

### b站

#### 向量数据库技术鉴赏

https://www.bilibili.com/video/BV1BM4y177Dk

128维，每个维度32位浮点，一个向量 128*32=4096位=512字节，1kw向量*512字节=4.77GB

维度灾难问题

速度，质量，内存开销三个维度对近似最近邻很重要。内存是开发感知，质量和速度用户感知，牺牲内存的图结构算法：NSW算法和HNSW（Hierarchical Navigable Small Word）算法，导航小世界



#### OpenAI Embeddings和向量数据库速成课程

数据经过embeding模型，成了embeding

## LLMs and Prompt Engineering

## 云厂商

腾讯 OLAMA：https://cloud.tencent.com/document/product/1709/94948

## paper

Product quantization for nearest neighbor search：https://inria.hal.science/inria-00514462v2/document

Approximate nearest neighbor algorithm based on navigable small world graphs

Three and a half degrees of separation

Billion-scale similarity search with GPUs：faiss paper

## 向量检索算法一览与业界最新进展

https://km.woa.com/articles/show/595478

https://ann-benchmarks.com/index.html

## ES

keyword search vs semantic search：关键字搜索与语义搜索

https://www.elastic.co/what-is/  https://www.elastic.co/cn/what-is/

https://www.elastic.co/what-is/vector-search

https://www.elastic.co/what-is/semantic-search

https://dbdb.io/browse?tag=nearest-neighbor-search





