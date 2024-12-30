#set text(size: 15pt)
= 机器学习的类型:
- Supervised Learning (监督学习)
- Unsupervised Learning(无监督学习)
- Reinforcement Learning(强化学习)
= 常见监督学习算法
- 回归 (Regression)  
- 朴素贝叶斯 (Naïve Bayes)  
- K-近邻 (K-Nearest Neighbors, KNN)  
- 支持向量机 (Support Vector Machines, SVM)  
- 决策树 (Decision Tree)  
- 神经网络 (Neural Networks, NN)  
= 监督学习的难点
- 需要一定程度的专业知识
- 可能非常耗时
- 数据集可能更容易出现人为错误，导致算法学习出错
- 监督学习无法自主聚类或分类数据
= 无监督学习
由于没有标签，无监督学习方法通常用于构建数据的简明表示，因此我们可以从中获得富有想象力的内容。
== 任务
- clustering(聚类):找到一组相似的样本
    - k-means
    - Gaussian Mixture Models( )
- 确定数据在输入空间内的分布，称为密度估计(ensity estimation)
- 将数据从高维空间投影到二维或三维空间以实现可视化
    - Principal Component Analysis
== 其他常用算法
- Association rules(关联规则挖掘):Apriori algorithms
- Singular Value Decomposition(奇异值分解)
- Autoencoders(自编码器)
== 无监督学习的难点
- 计算复杂性
- 可能更长的计算时间
- 结果不准确的风险更高
- 需要人工干预来验证输出变量
- 对数据聚类依据的透明性不足
#image("2024-12-29-21-41-51.png")
= 强化学习
模型会通过试错(反馈)来学习, 反馈可以是正向(reward)或者反向(punishment)\
目标是最大化reward function\
强化学习从错误中学习，并提供尽可能接近自然智能的人工智能\
== 与有监督学习的关系
就学习方法而言，强化学习与监督学习的相似之处在于它使用输入和输出之间的映射，但这是它们唯一的共同点, 在监督学习中，反馈包含了供智能体（agent）遵循的一组正确的操作。而在强化学习中，则不存在这样的答案集,智能体（agent） 自主决定应该如何执行任务，以正确地完成任务（perform the task correctly）。
== 与无监督学习的目标不同
#image("2024-12-29-21-53-39.png")
#figure(caption: [强化学习的行为-反馈机制])[#image("2024-12-29-21-54-21.png")]
== 常见算法
Q-learnin; Deep Q Network; Markov Decision Process; Deep Deterministic
Policy Gradient\
分类:
+ 使用策略或确定性策略来最大化累积奖励(Policy-based)
+ 尝试最大化某个任意的价值函数(Value-based)
+ 创建一个特定环境的虚拟模型，代理在这些约束条件下学习如何表现(Model-based)
= 监督学习细节
== 如何处理缺失的数据(missing data)
- 删除缺失值(但是会导致信息的丢失)
- 更具其他值来填充缺失的数据(这也会导致信息的丢失，不管你的计算方法有多复杂。即使您构建了一个输入模型，您也只是在强化其他特性已经提供的模式。)
== 数据变换(data transformation/data wrangling)
四种基本数据变换模式:
- constructive
- destructive
- aesthetic
- structural
主要方案
- Revising(修正)
- Manipulation(包括添加新数据,和结构化数据)
- Separating(分离, 用于颗粒化分析(granular analysis))
- Combining/ Integrating (把数据结合起来)
- Data Smoothing(平整化,消除噪声)
- Data Aggregation(用求平均,求方差之类的统计函数对数据进行综合)
== Feature Selection
只选择出相关的特征并且剔除噪声, 特征选择的作用:\
- 缓解过拟合(overfitting), 防止噪声影响模型的判断
- 增加准确性
- 减少训练时间
特征选择方案:
- 无监督
- 有监督
= Feature Engineering
一种利用数据来创建不在训练集中的新变量的技术, 可以为有监督和无监督学习
创造数据, 目的是简化和加速数据转换，同时提高模型的准确性. 要提取有效特征, 
转换数据, 正确的特征工程能够增强数据集, 优化目标检测模型的性能.\
常用方案:\
- 处理异常值 (Handling Outliers)
    - 移除 (Removal)
    - 替换 (Replacing values)
    - 截尾 (Capping) :使用一个任意值或变量分布中的某个值来替换数据的最大值和最小值
    - 离散化 (Discretization) :将连续变量、模型和函数转换为离散值的过程
- Log Transform(缓解偏斜分布(数据分布不均))
    $ "data"=log("data") $
- Scaling
    - Normalization(归一化)
    - Standardization(z-score normalisation):考虑标准偏差的同时对值进行缩放的过程
= 输入变量过多所导致的问题
在特征空间中拥有大量维度可能意味着该空间的体积非常大，反过来，我们在该空间中拥有的点（数据行）通常代表一个小且不具代表性的样本。-- 维度灾难(curse of dimensionality.)\
如何减少维度?
- 保留重要的维度
- Find a combination of new features
= PCA (Principal Component Analysis, 主成分分析)
#figure(caption: [PCA能把一组相关(correlated)的变量转换为更小的不相关的(uncorrelated)])[#image("2024-12-30-09-45-18.png")]
= LDA(Linear Discriminant Analysi, 线性判别分析)
#figure(caption: [LDA is typically used for
multi-class classification. It
can also be used as a
dimensionality reduction
technique.])[#image("2024-12-30-09-46-52.png")]

通过类别将训练数据实例进行最佳分离或判别\
PCA 图展示了主成分的选择是为了捕捉数据中的最大方差，但可能无法很好地分离类别。\
LDA 图则专注于寻找一个方向（主轴），以便让不同类别之间的分布尽可能分开，从而实现更好的分类效果。
