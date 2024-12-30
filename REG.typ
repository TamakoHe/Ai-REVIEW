#set text(size: 15pt)
#import "@preview/cmarker:0.1.1"
= Regression analysis(回归分析)
Regression analysis is the process of estimating the relationship
between a dependent variable(因变量) and independent variables(自变量).\
通过回归分析可以实现Interpolation(内插入), Extrapolation(外推)
== 回归分析的类型(通过family-of-functions和loss function分类)
- Linear Regression(线性回归) 
- Polynomial Regression(多项式回归)
- Ridge Regression
- LASSO regression(套索回归)
- Bayesian Regression
- Logistic Regression(逻辑回归)
== 线性回归
- 最小化对所有数据点的均方误差
- 用gradient descent algorithm或者least squares method
== 多项式回归(Polynomial Regression)
polynomial of degree $m$:多项式的次数\
$m=1$的时候, 就是线性回归了, 要确定$m+1$给参数
== Ridge Regression
主要要是针对过拟合的
#figure(caption: [用普通多项式的回归会出现左边的结果, 右边是该方法的结果])[#image("2024-12-30-10-31-30.png")]
损失函数增加了正则化项(L2 norm(严格意义上这个不包括系数$lambda$)), 
$ L="RSS"+lambda sum_"j=1"^p beta_j^2 $,
就是加了这些多项式系数的平方和再乘以一个$lambda$
== LASSO Regression
#cmarker.render("以下是图片内容的详细解释：

---

### **LASSO 回归（LASSO Regression）**

LASSO 回归是一种线性回归的正则化变体，旨在通过引入 **L1 正则化项**（绝对值惩罚）来解决模型的过拟合问题，并能够实现**特征选择**。以下是图片中的主要内容解释：

1. **正则化的共同点（与 Ridge 回归）**：
   - **LASSO 和 Ridge 回归**都使用正则化（regularization）来防止模型在训练数据上过拟合。
   - 它们都通过惩罚系数的大小来限制模型的自由度，从而提升模型的泛化能力。

2. **LASSO 的独特之处：稀疏性（Sparsity）**：
   - LASSO 引入 **L1 正则化**，这一正则化方式的特性是会使某些回归系数收缩为 **0**。
   - 因此，LASSO 不仅能够正则化模型，还能够**自动选择特征**，保留重要特征，剔除不相关特征，从而得到一个**稀疏解**（Sparse Solution）。
   - **稀疏性特点**：大多数系数接近 0 或直接为 0。

3. **与 Ridge 回归的对比**：
   - **Ridge 回归（岭回归）**：通过 **L2 正则化**，使回归系数趋于较小的值，但很少直接变为 0。因此 Ridge 回归会保留所有特征，仅减少权重。
   - **LASSO 回归**：通过 **L1 正则化**，不仅让系数变小，还会使许多不重要的系数变为 **0**，从而实现特征选择。
   - 换句话说：
     - **Ridge**：缩小所有权重，保留所有特征。
     - **LASSO**：选择性删除特征，仅保留重要特征。

4. **稀疏矩阵的优点**：
   - LASSO 回归生成稀疏权重矩阵（Sparse Weight Matrix），比非稀疏权重矩阵更加高效。
   - 稀疏矩阵在计算和存储方面能耗更低，更适合大规模数据集的模型计算。
   - 同时，它仍能维持与非稀疏矩阵相似的拟合精度。

---

### **总结**
- **LASSO 回归的核心特性**是通过 L1 正则化实现系数的稀疏性，这使得它可以自动选择最重要的特征，同时减少不必要的特征的影响。
- 与 Ridge 回归相比，LASSO 更适合用于高维数据集（特征数量远大于样本数量）或需要特征选择的任务。
- **应用场景**：特征选择、高维数据建模、简化模型结构。

如果还需要更详细的讲解或具体案例，可以进一步讨论！")

LASSO使用了L1正则化, 用绝对值代替了平方:
$ L="RSS"+lambda sum_"j=1"^p |beta_j| $
= 贝叶斯分类器(Naïve Bayes Classifiers)
- Prior Probability(显眼概率):再数据收集之前一个事件(event)发生的概率
- 这是在进行实验之前基于现有知识对结果概率的最佳合理评估。
- Posterior Probability(后验概率):在事件B已经发生了之后的事件A的概率
   - 先验概率会因为新的数据出现而改变
== 贝叶斯算法
- Naïve: 保证每一个特征(事件)是独立与其他的
- Bayes: 使用了贝叶斯定理分类
== 贝叶斯规则
$ P(c|x)=(P(x|c)P(c))/P(x) $
$P(c|x)$:后验概率, 在已知$x$的情况下,类别c的概率\
$P(c)$:先验概率, 没有观察到后验信息的情况下$c$的概率\
$P(x|c)$:likelyhood, 在已知类别c的概率下, 观察到$x$的概率\
$P(x)$:观察到预测变量$x$的先验概率
- 优点:
   - 不复杂(Less complex)
   - Scales well:与逻辑回归相比，Naïve贝叶斯被认为是一种快速有效的分类器，当条件独立假设成立时，它相当准确。它的存储要求也很低。
   - 能够处理高维数据
- 缺点
   - 容易出现“零频率”问题(Subject to Zero frequency), 如果某个变量在训练集中不存在$P(x|c)=0$,那么整个概率就变成了0
      可以用Laplace Smoothing解决, 给所有可能特征分配一个不为0的值
   - 核心假设过于理想化(假设所有特征都是相互独立的太过于理想化)
