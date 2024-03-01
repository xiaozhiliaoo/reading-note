# System

ES相似度Similarity Search：https://www.elastic.co/guide/en/elasticsearch/reference/current/index-modules-similarity.html

## ES向量化搜索

https://www.elastic.co/blog/text-similarity-search-with-vectors-in-elasticsearch

https://juejin.cn/post/7086775047091666952

https://lucene.apache.org/core/8_0_0/core/org/apache/lucene/search/similarities/Similarity.html

https://github.com/adrg/strutil

召回率

ES Term的Fuzzy查询基于： Levenshtein edit distance（es string distance）

ES Match的查询基于：TF/IDF或者BM2.5

ES的Suggest基于string_distance(字符串距离算法): https://www.elastic.co/guide/en/elasticsearch/reference/8.8/search-suggesters.html#_other_term_suggest_options

internal: The default based on damerau_levenshtein but highly optimized for comparing string distance for terms inside the index.

damerau_levenshtein: String distance algorithm based on Damerau-Levenshtein algorithm.

levenshtein: String distance algorithm based on Levenshtein edit distance algorithm.

jaro_winkler: String distance algorithm based on Jaro-Winkler algorithm.

ngram: String distance algorithm based on character n-grams.

golang字符串距离：https://github.com/adrg/strutil

