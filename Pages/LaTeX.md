# 在 Markdown 中使用 LaTex 插入数学公式

行内公式（内联公式）：使用 `$` 包裹

行间公式：使用 `$$` 包裹，将居中显示

#### 希腊字母

| 字母名称 | 大写 |  命令   | 小写 |    命令     |
| :------: | :--: | :-----: | :--: | :---------: |
|  alpha   |  A   |    A    |  α   |   \alpha    |
|   beta   |  B   |    B    |  β   |    \beta    |
|  gamma   |  Γ   | \Gamma  |  γ   |   \gamma    |
|  delta   |  Δ   | \Delta  |  δ   |   \delta    |
| epsilon  |  E   |    E    |  ϵ   |  \epsilon   |
|          |      |         |  ε   | \varepsilon |
|   eta    |  E   |    E    |  η   |    \eta     |
|  theta   |  Θ   | \Theta  |  θ   |   \theta    |
|  lambda  |  Λ   | \Lambda |  λ   |   \lambda   |
|    Mu    |  M   |    M    |  μ   |     \mu     |
|    nu    |  N   |    N    |  ν   |     \nu     |
|    xi    |  Ξ   |   \Xi   |  ξ   |     \xi     |
| omicron  |  O   |    O    |  ο   |  \omicron   |
|  omega   |  Ω   | \Omega  |  ω   |   \omega    |
|    pi    |  Π   |   \Pi   |  π   |     \pi     |
|   rho    |  P   |    P    |  ρ   |    \rho     |
|  sigma   |  Σ   | \Sigma  |  σ   |   \sigma    |
|   tau    |  T   |    T    |  τ   |    \tau     |
|   phi    |  Φ   |  \Phi   |  ϕ   |    \phi     |
|          |      |         |  φ   |   \varphi   |
|   chi    |  X   |    X    |  χ   |    \chi     |
|   psi    |  Ψ   |  \Psi   |  ψ   |    \psi     |

1. 若要大写希腊字母，将命令首字母大写即可。
2. 若要希腊字母的变体形式，在名字前加上 `var` 前缀即可，如 $\varepsilon$。
3. 若要直立希腊字母，在名字前加上 `up` 前缀即可，如 $\upmu {\rm m}$，$\upbeta$ 粒子。

#### 空格

|   空格   | 命令        |
| :------: | ----------- |
| 8 格空格 | $x\qquad y$ |
| 4 格空格 | $x\quad y$  |
|  大空格  | $x\ y$      |
| 中等空格 | $x\;y$      |
|  小空格  | $x\,y$      |

### 高等数学

两函数之间应该加一个小空格 `\,`

#### 分式 (Fraction)

$\frac xy$ $x\over y$

> `\over` 命令的分式只有一层

使用 `\left(` 和 `\right)` 标记使括号匹配其中内容的大小：

$\left(\dfrac{x}{y}\right)$

也可以使用 `\bigl(` 和 `\bigr)` 手动调节括号大小：

$\biggl(\sum\limits_{i=1}^n a_i\biggr)$

`\bigl` < `\Bigl` < `\biggl` < `\Biggl`

如果是单边符号，则在没有的那边使用 `.` 代替：

$\left.\dfrac{\partial z}{\partial x}\right|_{y=1}$

连分式：

$x = a_0 +\cfrac{1^2}{a_1+\cfrac{2^2}{a_2\cfrac{3^2}{a_3+\cfrac{4^2}{a_4+\cdots}}}}$

> - c 代表 continued
> - d 代表 display
> - t 代表 text

1. 普通大分式建议使用 `\dfrac`
2. 连分式建议使用 `\cfrac`

#### 绝对值

$\|x\|\ \lvert x\rvert$

#### 根号

$\sqrt{x}\ \sqrt[n]{x}$

#### 大于等于，小于等于

$\geqslant\ \geq$

$\leqslant\ \leq$

$\gg\ \ll$

#### 无穷

$\infty$

#### 换行

`\\`

#### 上下标

上标：$x^2$

下标：$y_0$

1. 使用花括号 `{}` 将多个项目组合为一个整体：$y_{Czi}$
2. 上、下标可以前置：$^2x$

#### 积分号 (Integral Operator)

$\int\!x\,{\rm d}x\ \int_a^b\!f(x)\,{\rm d}x\ \oint\!f(x)\,{\rm d}x\ \iint\limits_{D}\!f(x,y)\,{\rm d}x{\rm d}y$

1. 微分算子 d、二项式系数 C、等于号上的 def、自然常数 e、虚数单位 i 等都应该通过 `{\rm d}` 或 `\mathrm{d}` 命令以正体显示。
2. 微分算子 d 左边应使用 `\,` 来增加间距。
3. 积分号与积分函数距离过远，使用 `\!` 来缩短间距。

#### 求和运算符 (Sum Operator)

$\sum m\ \sum_{i=1}^n\ \sum\limits_{i=1}^n$

$$
\sum_{i=1}^n\\
\sum\nolimits_{i=1}^n
$$

> 在 LaTeX 中，通常会自动将行内公式写成文本格式，而在行间公式里使用标准格式。可通过在 `\sum` 命令后加 `\limits` 来指定使用标准格式或 `\nolimits` 来指定使用文本格式

#### 乘积运算符 (Product Operator)

$\prod M\ \prod\limits_{i=1}^n x_i$

#### 取极限

$\lim\limits_{x\to\infty}\dfrac{1}{x}=0$

二重极限，下标可用 `{\substack{}}` 扩起来，用 `\\` 换行。

$\lim\limits_{\substack{x\to\infty\\y\to\infty}}\dfrac{1}{x}=0$

#### 导数

$y\prime\ y'\ \dot y\ \ddot y$

#### 偏导

$\partial$

#### 星

$\ast\ \star$

#### 矢量

$\vec v\ \overrightarrow{AB}\ \boldsymbol E\ \bm r$

#### 点乘，叉乘

$\cdot\ \times$

#### 点除

$\div$

#### 省略号

$\cdots\ \ldots\ \vdots\ \ddots$

省略号的位置取决于其两端操作符的位置。例如：

$1+2+\cdots+n$

$1,2,\ldots,n$

#### 正负号

$\pm$

#### 角度

$\angle45\degree\ \measuredangle90\degree\ 36.9^\circ$

#### 全微分算子（梯度）

$\nabla$

#### 垂直 (Perpendicular)

$\perp$

#### 正比

$\propto$

#### 投影

$\Pr$

#### 不等

$\neq\ \not=$

> `\not` 是在下一个符号上画斜杠

#### 约等

$\approx$

#### 恒等

$\equiv$

#### 趋近于

$\to\ \rightarrow$

#### 因为，所以

$\because\ \therefore$

#### 分节符 §

$\S$

### 概率论

#### 概率分布

$\hat y\ \widehat {abc}$

#### 服从

$\sim$

#### 平均值

$\bar x\ \overline {xy}$

#### 取整

⌊向下取整⌋ $\lfloor x\rfloor$

⌈向上取整⌉ $\lceil x\rceil$

### 离散数学

集合用普通大写字母表示 $A$

#### 且和或

$\land\ \lor$

#### 非

$\lnot$

#### 存在，任意

$\forall\ \exists$

#### 花括号

$\{a,b,c,d\}\ \left\{\cfrac xy\right\}$

#### 集合中的 |

$\mid\ \bigm|$

> 用描述法表示的集合，在括号前后加上 `\,` 会更好看。

#### 交集，并集

$\cap\ \cup$

$\bigcup\limits_{i=1}^nR$

#### 常用集合

$\mathbb{R}\ \N\ \emptyset\ \varnothing$

#### 补集

$\complement_UA$

#### 属于，不属于

$\in\ \notin$

#### 包含，真包含

$\subset\ \subseteq\ \subsetneqq$

$\supset$

$\not\subset$

#### 合成运算符

$\circ$

#### 推出

$\implies\ \Rightarrow\ \Longrightarrow\ \nRightarrow$

#### 等价

$\iff\ \Leftrightarrow\ \nLeftrightarrow$

> `\iff` 会在箭头两侧加上空格

#### 同或，异或

$\odot\ \oplus$

#### 序偶

$\langle x,y\rangle$

#### 偏序

劣于 $\prec\ \preccurlyeq$

优于 $\succ\ \succcurlyeq$

#### 阿列夫

$\aleph\ \aleph_0$

### 线性代数

#### 矩阵

${\bm A}_{m\times n}=(a_{ij})_{M\times N}$

$\begin{pmatrix}
a & b\\
c & d
\end{pmatrix}$

$\begin{bmatrix}
a & b\\c & d
\end{bmatrix}$

$\left[\begin{array}{cc|c}
a_{11} & a_{12} & b_1\\
a_{21} & a_{22} & b_2
\end{array}\right]$

$\begin{Vmatrix}
a & b\\
c & d
\end{Vmatrix}$

#### 行列式

$\begin{vmatrix}
a & b\\
c & d
\end{vmatrix}$

#### 求模符号

$\|x\|$

#### 矩阵转置

${\bm A}^{\rm T}$

### 其它

#### 埃

$\overset{\circ}{\rm A}$

#### 约化普朗克常数

$\hbar$

#### 变体 l

$\ell$

#### 对勾

$\checkmark\ \surd$

#### 下括号

$\begin{matrix}
\underbrace{x_1+x_2+\cdots+x_k}\\k
\end{matrix}$

#### 将普通符号转换成运算符

$\mathop{x}\limits_a^b$

#### 上位符号

$\stackrel{\rm def}{=}$

#### 波浪线

$\tilde S$

#### 箭头

$\rightleftharpoons\ \circlearrowleft\ \looparrowleft\ \Lsh
$

[CSDN：LaTex 各种箭头符号总结](https://blog.csdn.net/Artoria_QZH/article/details/103310704)

#### 表格

$\begin{array}{c|cccc}
   & 00 & 01 & 11 & 10\\
\hline
0 & m_0 & m_1 & m_3 & m_2\\
1 & m_4 & m_5 & m_7 & m_6 
\end{array}$

> array 和 matrix 的区别在于 array 有一个列对齐参数

#### 公式组合

$$
f(x)=
\begin{cases}
2x, & x>0\\
3x, & x\le0
\end{cases}
$$

#### 对齐

$$
\begin{aligned} % 也可以使用 align*
(2+1)\times(3+6)&=3\times9\\
&=27
\end{aligned}
$$

> 1. 如果使用 align，则会自动添加公式编号。
> 2. aligned 比 matrix 间距更大。
> 3. cases 会适当缩小其包裹的公式，而 aligned 不会。

#### 显示模式

`{\textstyle}` 文本模式

`{\displaystyle}` 显示模式

`{\scriptstyle}` 小号模式

#### 字体

$\mathrm{mathrm}\ {\rm rm}\\
\boldsymbol{boldsymbol}\\
{\bm bm}\\
\mathbf{mathbf}\\
{\bf bf}\\
\mathbb{mathbb}$

$\mathrm{ABCDE\ abcde\ 12345}\\
\mathit{ABCDE\ abcde\ 12345}\\
\mathnormal{ABCDE\ abcde\ 12345}\\
\mathcal{ABCDE\ abcde\ 12345}\\
\mathscr{ABCDE\ abcde\ 12345}\\
\mathfrak{ABCDE\ abcde\ 12345}\\
\mathbb{ABCDE\ abcde\ 12345}\\$

#### 显示模式

${\displaystyle \int_a^b\!f(x){\rm d}x}\\
{\textstyle  \int_a^b\!f(x){\rm d}x}\\
{\scriptstyle  \int_a^b\!f(x){\rm d}x}\\
{\scriptscriptstyle  \int_a^b\!f(x){\rm d}x}$

#### 字号

${\Huge  \int_a^b\!f(x){\rm d}x}\\
{\huge  \int_a^b\!f(x){\rm d}x}\\
{\LARGE  \int_a^b\!f(x){\rm d}x}\\
{\Large  \int_a^b\!f(x){\rm d}x}\\
{\large  \int_a^b\!f(x){\rm d}x}\\
{\normalsize  \int_a^b\!f(x){\rm d}x}\\
{\small  \int_a^b\!f(x){\rm d}x}\\
{\footnotesize  \int_a^b\!f(x){\rm d}x}\\
{\scriptsize  \int_a^b\!f(x){\rm d}x}\\
{\tiny  \int_a^b\!f(x){\rm d}x}$

#### 颜色

${\color{red}给你点颜色看看}$

$\colorbox{red}{给你点颜色看看}$

#### 注释

$\text{comment}$

#### 代码注释

$$
abc\\
% 注释
abc
$$

#### 其它符号

$\P\ \copyright\ \bigstar\ \clubsuit\ \diamondsuit\ \heartsuit\ \spadesuit$

#### 插入函数名称

![图片](https://pic2.zhimg.com/80/v2-dac2ba8d57e2d047d4d067ad0bf9589d_1440w.jpg)

> 参考资料
>
> [一篇文章教会你如何在 Markdown 文档中插入数学公式](https://zhuanlan.zhihu.com/p/158156773)
>
> [在 Markdown 中输入数学公式(MathJax)](https://www.jianshu.com/p/a0aa94ef8ab2)
>
> [常用 LaTex 公式与手写公式转换器](https://www.cnblogs.com/wxyww/p/latex.html)
>
> [LaTex 符号大全（图片）](https://blog.csdn.net/yen_csdn/article/details/79966985)
>
> [LaTeX 公式篇 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/110756681)
>
> [常用 LaTex 字符与公式速查](https://help.zhixi.com/guide/5591.html)
>
> [科技论文书写规范之正斜体问题](https://blog.csdn.net/wanjiac/article/details/106085105)