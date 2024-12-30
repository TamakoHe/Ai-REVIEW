#set text(size: 15pt)
= 优化基础(Optimization)
优化问题的组成:
+ 目标函数 Object (Cost) functon
+ 决定变量(目标函数的自变量) Decision variables
+ $Omega$ 搜索域(Search space,目标函数的定义域)
+ constraint(限制条件)
目标函数是多个的情况叫做Multi-objective optimization, 这些优化目标可能是相对立相矛盾的.\
Domination(占主导地位), 以最小目标优化为例, 对于两个解x, y
$ f(x)<=f(y) forall x,y in Omega  $
$ exists x "that" f(x)<f(y) $
那么f(x)占主导地位\
有三种情况
- x主导
- y主导
- x, y cannot be compared with each other. 
== Pareto front
用于描述在权衡多个目标的时候无法进一步改进一个目标而不恶化另外一个目标的解集,是多目标优化问题的最优解的集合.
一个解$bold(x)$为帕累托最优解,如果不存在另一个解$bold(x)$使得一个目标
$f_i(bold(x))$改进,同时不使得其他目标$f_j(x) (j!=i)$恶化.
- 帕累托最优解 是不可被其他解支配的解
- Pareto Set 这些最优解的集合
- Pareto-Optimal Front 在这些最优解的条件下,目标函数的值(带入最优解)
#figure(caption: [对于$f_1$,$f_2$两个目标的不同形状])[#image("2024-12-24-17-48-14.png")]
== 最优解的类型
- Global optimal solution(全局最优解)
- Local optimal solution: a point that is not worse than any other points in its neighborhood(这个近邻点是可以有不同的定义的), 全局最优解一定是局部最优解
== 目标的类型
- Unimodal 只有一个峰
#image("2024-12-22-19-28-47.png")
- Multimodal 多峰, 多个局部最优解
#image("2024-12-22-19-28-56.png")
