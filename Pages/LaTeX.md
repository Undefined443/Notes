# LaTeX

## Formulae

行内公式（内联公式）：使用 `$` 包裹

行间公式：使用 `$$` 包裹，将居中显示

#### 希腊字母

| 字母名称 | 大写  |  命令   | 小写  |    命令     |
| :------: | :---: | :-----: | :---: | :---------: |
|  alpha   |   A   |    A    |   α   |   \alpha    |
|   beta   |   B   |    B    |   β   |    \beta    |
|  gamma   |   Γ   | \Gamma  |   γ   |   \gamma    |
|  delta   |   Δ   | \Delta  |   δ   |   \delta    |
| epsilon  |   E   |    E    |   ϵ   |  \epsilon   |
|          |       |         |   ε   | \varepsilon |
|   eta    |   E   |    E    |   η   |    \eta     |
|  theta   |   Θ   | \Theta  |   θ   |   \theta    |
|  lambda  |   Λ   | \Lambda |   λ   |   \lambda   |
|    Mu    |   M   |    M    |   μ   |     \mu     |
|    nu    |   N   |    N    |   ν   |     \nu     |
|    xi    |   Ξ   |   \Xi   |   ξ   |     \xi     |
| omicron  |   O   |    O    |   ο   |  \omicron   |
|  omega   |   Ω   | \Omega  |   ω   |   \omega    |
|    pi    |   Π   |   \Pi   |   π   |     \pi     |
|   rho    |   P   |    P    |   ρ   |    \rho     |
|  sigma   |   Σ   | \Sigma  |   σ   |   \sigma    |
|   tau    |   T   |    T    |   τ   |    \tau     |
|   phi    |   Φ   |  \Phi   |   ϕ   |    \phi     |
|          |       |         |   φ   |   \varphi   |
|   chi    |   X   |    X    |   χ   |    \chi     |
|   psi    |   Ψ   |  \Psi   |   ψ   |    \psi     |

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

#### 点乘，叉乘 ×

$\cdot\ \times$

#### 点除

$\div$

#### 省略号

$\cdots\ \ldots\ \vdots\ \ddots$

> c: central  
> d: diagonal

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

#### 平行

$\parallel$

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

#### 自然连接

$\Join\ \bowtie$

#### 聚合函数

$\mathcal{G}$

[数据库常用关系代数符号在 LaTeX 中的表示](https://billc.io/2020/04/latex-relational-algebra/)

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

> bmatrix: bracket matrix

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

$\rightleftharpoons\ \circlearrowleft\ \looparrowleft\ \Lsh$

> 后三个符号属于 amssymb 包

[CSDN：LaTex 各种箭头符号总结](https://blog.csdn.net/Artoria_QZH/article/details/103310704)

#### 数学表格

$\begin{array}{c|cccc}
    & 00 & 01 & 11 & 10\\
  \hline
  0 & m_0 & m_1 & m_3 & m_2\\
  1 & m_4 & m_5 & m_7 & m_6\\
  \hline
\end{array}$

> array 和 matrix 的区别在于 array 有一个列对齐参数

#### 公式组合

$$
f(x)=
\begin{cases}
  2x, & x > 0\\
  3x, & x \le 0
\end{cases}
$$

#### 公式标号

##### 为单行公式标号

```tex
\begin{equation}  % 为公式标号
  \label{lab_name}  % 为下面的公式做标签
  a + b = c
\end{equation}

The number of lab_name is \ref{lab_name}  % 引用上面的公式
```

> 在单行模式下换行符 `\\` 无效

##### 为多行公式标号

```tex
\begin{equation}
  \begin{split}
    \label{lab_name}  % 做标签，可选
    a + b & = c\\
          & = d
  \end{split}
\end{equation}
```

##### 为单行标号

```tex
\begin{align}
  \label{lab1}
  a + b & = c\\
  \label{lab2}
        & = d
\end{align}
```

#### 对齐

```tex
\begin{align*}  % 也可以使用 aligned
  (2 + 1) \times (3 + 6) & = 3 \times 9\\
                         & = 27
\end{align*}
```

> 1. 如果使用 align，则会自动添加公式编号。
> 2. aligned 比 matrix 间距更大。
> 3. cases 会适当缩小其包裹的公式，而 aligned 不会。

#### 超长公式

```tex
\begin{multline}
 e = a + b + c + d + e + f + g\\
 + h + i + j + k + l + m + n
\end{multline}
```

> 属于 amsmath 包

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

> mathrm: math roman
> mathbf: math boldface

$\textbf{textbf}\\
\textit{textit}\\
\underline{underline}$

> textbf: text boldface  
> textit: text italics

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
>
> [数学研发论坛：数学公式教程](https://bbs.emath.ac.cn/thread-5237-1-1.html)
>
> [强迫症的 LaTeX 学习笔记](https://ridiqulous.com/latex-notes-details/)

## Thesis

[Overleaf: Documentation](https://www.overleaf.com/learn)

[YouTube: Dr. Trefor Bazett-Intro to LaTeX : Learn to write beautiful math equations || Part 1](https://www.youtube.com/watch?v=Jp0lPj2-DQA&list=PLHXZ9OQGMqxcWWkx2DMnQmj5os2X5ZR73&index=1)

### Architecture

```tex
% Preamble
\documentclass[twoside]{report}  % 文档类型，论文（双面）

% 要引用的包
\usepackage[utf8]{inputenc} 
\usepackage{graphicx}  % 插入图片所需要的包
\usepackage{geometry}  % 设置页边距所需要的包
\usepackage{amsmath,amsthm,amsfonts}  % amsmath 有很多原生环境没有的符号，如 \iiint

% 设置页边距
\newgeometry{
    top=0.75in,
    bottom=0.75in,
    outer=0.75in,
    inner=1.5in,  % 因为是双面，两面连到一起后两个
}                 % outer 加起来就是 1.5in

% 文档元数据
\title{YouTube Thesis\\
{\Large University of YouTube}}
\author{Xiao Li}
\date{March 2023}

% Body
\begin{document}

\maketitle  % 生成标题

\chapter*{Abstract}  % 摘要，* 用于去掉标号
A thesis about using YouTube. It is really cool.

\chapter*{Dedication}  % 献词
For my subscribers...

\chapter*{Acknowledgements}  % 致谢
I want to thank...

% 正文部分
\tableofcontents  % 目录

\listoffigures  % 图片列表

\include{ch-YouTubeButtons}   % 将文档 ch-YouTubeButtons.tex 插入进来（这种方式便于组织文章结构）

% ch-YouTubeButtons.tex 中的内容
\chapter{YouTube Buttons}

\section{Subscribe Button}  % 1.1 节

% Conclusion
\include{Conclusions}

\appendix  % 附录（实际上是改变了 chapter 的标号方式）

\include{Appendix}

\bibliographystyle{plain}  % 指定引用的格式
\bibliography{ref}  % 引用内容来源：ref.bib

\end{document}
```

> Preamble: 导言区

[YouTube: Dr. Trefor Bazett-How to write a thesis using LaTeX](https://www.youtube.com/watch?v=zqQM66uAig0&list=PLHXZ9OQGMqxcWWkx2DMnQmj5os2X5ZR73&index=3)

### 列表

```tex
% 有序列表
\begin{enumerate}
\item This is item 1
\item This is item 2
\end{enumerate}

% 无序列表
\begin{itemize}
\item This is an item.
\item This is another item.
\end{itemize}
```

#### 分页符

`\newpage`

#### 表格

```tex
\begin{center}  % 用于将表格居中
  \begin{tabular}{|c|cccc|}
    \hline
      & 00 & 01 & 11 & 10\\
    \hline
    0 & m_0 & m_1 & m_3 & m_2\\
    1 & m_4 & m_5 & m_7 & m_6\\
    \hline
  \end{tabular}
\end{center}
```

```tex
\begin{table}
  \caption{A nifty table!}  % 设置表格说明
  \label{niftytable}  % 做标记
  \begin{center}
    \begin{tabular}{|c|cccc|}
      \hline
        & 00 & 01 & 11 & 10\\
      \hline
      0 & m_0 & m_1 & m_3 & m_2\\
      1 & m_4 & m_5 & m_7 & m_6\\
      \hline
    \end{tabular}
  \end{center}
\end{table}
```

[YouTube: Dr. Trefor Bazett-Intro to LaTeX **Full Tutorial** Part II (Equations, Tables, Figures, Theorems, Macros and more)](https://www.youtube.com/watch?v=-HvRvBjBAvg&list=PLHXZ9OQGMqxcWWkx2DMnQmj5os2X5ZR73&index=2)

[YouTube: Dr. Trefor Bazett-Tables in LaTeX](https://www.youtube.com/watch?v=xyZtxfMsD38&list=PLHXZ9OQGMqxcWWkx2DMnQmj5os2X5ZR73&index=10)

### 图片

```tex
\begin{figure}[ht]  % 插入图片，参数指定图片位置（h: here, t: top）
    \centering  % 居中
    \includegraphics{images/Subscribe Button.png}  % 图片位置
    \caption{Subscribe Button}  % 图片说明
    \label{fig:Subscribe-Button}  % 做标记
\end{figure}
```

```tex
\includegraphics[scale=0.5]{images/length.png}  % 也可以直接插入
\includegraphics[width=\textwidth]{100K}  % 与页面文本宽度等宽
```

> 属于 graphicx 包

### 引用

```tex
% 引用 Bib 库中的 einstein 条目
I can reference Einstein\cite{einstein}.\\
```

### 脚注

```tex
I want to do a footnote right here\footnote{This is my first footnote!}.
```

```tex
% 添加脚注的另一种方式，可以稍后作解释，也可以让一个脚注被引用多次
I can use\footnotemark to make a placeholder and not define it until later\footnotemark[\value{footnote}].

\footnotetext{This is my second footnote}  % 在这里作出解释
                                           % 可以用 [..] 指定脚注的标号
```

### 定理、推论、证明

```tex
% preamble
\newtheorem{theorem}{Theorem}[section]  % {命令名}{定理标题}[标号级别]
\newtheorem{corollary}{Corollary}[theorem]  % 推论往往以定理标号为基础

% body
\begin{theorem}[YouTube]  % 定理名是可选的
  You should like and subscribe!
\end{theorem}

\begin{corollary}
  And checkout Overleaf as well!
\end{corollary}

\begin{proof}
Left to the interested subscriber
\end{proof}
```

> To learn more about theorem, corollary and lemmas, please visit [Overleaf](https://www.overleaf.com/learn/latex/Theorems_and_proofs)

### 自定义命令（宏）

```tex
% preamble
\newcommand{\R}{\mathbb{R}}  % {命令名}{实际要执行的命令}
\newcommand{\cv}[2]{\begin{bmatrix}  % {命令名}[接收的参数个数]{实际要执行的命令}
#1\\  % 参数 1
#2    % 参数 2
\end{bmatrix}}

% body
The real numbers $\R$

I could do $\cv{1}{2}$
```

> cv: column vector

### 示例文本

```tex
\lipsum[1-20]  % 插入一些示例文本（用于预览渲染效果）
```

> 属于 lipsum 包

## Useful Packages

[YouTube: Dr. Trefor Bazett-My Favorite LaTeX packages for writing beautiful math documents](https://www.youtube.com/watch?v=331YxgOJUGw&list=PLHXZ9OQGMqxcWWkx2DMnQmj5os2X5ZR73&index=4)

### hyperref

可以为文档添加链接功能

```tex
% Preamble
\usepackage{hyperref}

\hypersetup{
  colorlinks=true,  % 启用链接着色
  linkcolor=blue,   % 内部链接为蓝色
  urlcolor=red,     % 外部链接为红色
  pdftitle={How to write a thesis}  % 生成的 PDF 的内部标题为 How to write thesis
}
```

### fancyvrb

fancy verbatim: 用于放置代码

```tex
% Preamble
\usepackage{fancyvrb}

% Body
% 设置在代码块左部显示行号，用方框包围代码块，代码块显示为红色
\begin{Verbatim}[numbers=left, frame=single, formatcom=\color{red}]
#include <iostream>

int main() {
  std::cout << "Hello, world!" << std::endl;
  return 0;
}
\end{Verbatim}
```

### fancyhdr

fancy header: 用于调整页首和页尾样式

```tex
% Preamble
\usepackage{fancyhdr}
\pagestyle{fancy}  % 启用 fancy style
\lhead{Trefor's awesome LaTeX guide}  % 页首左部
\rhead{Sponsored by Oberleaf!}  % 页首右部
\cfoot{\thepage}  % 页尾中间显示页码
```

```tex
% Preamble
\usepackage{fancyhdr, lastpage}
% ...
\cfoot{Page \thepage\ of \pageref{LastPage}}  % Page 2 of 3
```

#### etoolbox

fancyhdr 默认不会更改 report 部分页面的 header，可以通过 etoolbox 来控制这一行为

```tex
% Preamble
\usepackage{fancyhdr}
\pagestyle{fancy}  % 启用 fancy style
\lhead{Trefor's awesome LaTeX guide}  % 页首左部
\rhead{Sponsored by Oberleaf!}  % 页首右部
\cfoot{Page \thepage\ of \pageref{LastPage}}  % Page 2 of 3

\usepackage{etoolbox}
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}
```

### fncychap

fancy chapter: 改变章节标题样式

```tex
% Preamble
\usepackage{Glenn}{fncychap}
% Options: Sonny, Lenny, Glenn, Conny, Rejne, Bjarne, Bjornstrup
```

### xcolor

改变文本颜色

```tex
% Preamble
\usepackage{xcolor}

% Body
Let's make {\color{red} this}
```

### tcolorbox

提供一个好看的文本框，可以用来放置代码、定理等

使用默认样式

```tex
% Preamble
\usepackage{tcolorbox}

% Body
\begin{tcolorbox}  % default is gray block
This is a tcolorbox.
\end{tcolorbox}
```

指定文本框的颜色

```tex
% Preamble
\usepackage{tcolorbox}

% color background = 5% red (95% white); color frame = 50% red (50% black)
\begin{tcolorbox}[colback=red!5!white,colframe=red!50!black,title=My nice heading]
This is a tcolorbox with a heading
\end{tcolorbox}
```

写一个定理

```tex
% Preamble
\usepackage[most]{tcolorbox}  % include most of the funcionality
% new tcolorbox theorem, 用法和 newtheorem 相似
\newtcbtheorem{theo}{Theorem}{}{theorem}  % {命令名}{显示名}{前缀}{样式}

% Body
\begin{theo}{Like and Subscribe}{likesub}  % \begin{theo}{标题}{标签}
For every person $x$, $x$ should like and subscribe.
\end{theo}
```

### siunitx

SI Unit (国际单位制): 简化单位的输入

```tex
% Preamble
\usepackage{siunitx}

% Body
$$
5\ \si{kg.m/s^2}
$$

% 等价于
$$
5\ \mathrm{kg}\ \mathrm{m}/\mathrm{s}^2
$$
```

### setspace

设置字间距

```tex
% Preamble
\usepackage{setspace}
\onehalfspacing  % 1.5 倍间距
% Options: double spacing, single spacing, one half spacing
```

```tex
% Preamble
\usepackage[acronym]{glossaries-extra}  % 使用 glossaries-extra 包的 acronnym 功能

\setabbreviationstyle[acronym]{long-short}  % 设置缩写样式，第一次引用完整形式，之后引用缩写形式
\newacronym{dtb}{DTB}{Doctor Trefor Bazett}  % 设置缩写词，{命令名}{缩写}{完整形式}
\makeglossaries  % 生成词汇表和符号列表

% Body
I want to say \gls{dtb} to long the first time and short the second \gls{dtb}.

% ...

\printglossary[type=\acronymtype]  % 生成缩写的术语表
\end{document}
```

> acronym: 首字母缩略词  
> glossary: 术语表

### 制作图表

#### tikz

绘制线条与简单图形

tikz 的所有语句都要加分号

[YouTube: Dr. Trefor Bazett-How to make beautiful math graphics using Tikz & LaTeX](https://www.youtube.com/watch?v=bQugbYq0BVA&list=PLHXZ9OQGMqxcWWkx2DMnQmj5os2X5ZR73&index=6)

```tex
% Preamble
\usepackage{tikz}
\usetikzlibrary{positioning}  % 使用相对位置功能时必须启用的库
```

##### 线条与图形

```tex
\tikz \draw (0,0) -- (2,1) -- (3,2);  % 绘制一段直线，指定经过的点
\tikz \draw[->] (0,0) -- (2,1) -- (3,2);  % 绘制箭头

\begin{tikzpicture}
\draw (0,0) circle (1);  % 绘制一个圆，指定圆心和半径
\draw (2,0) circle (1.5in);  % 以 inch 为半径单位
\draw (5,0) ellipse (10pt and 20pt);  % 绘制一个椭圆，指定长轴和短轴
\draw (0,0) rectangle (5,4);  % 绘制一个矩形，指定左下角和右上角
\draw (0,0) grid (5,4)  %  绘制一个网格，指定左下角和右上角
\vspace{1in}  % 设置 1inch 间距
\end{tikzpicture}
```

##### 弧线、填充与阴影

```tex
\begin{center}
    % 参数 [transform canvas={scale=4.0}] 可以让线条长度及线条粗细等比例放大 4 倍
    % 如果直接使用 [scale=4] 做为参数的话则只放大长度，不放大粗细
    \begin{tikzpicture}[transform canvas={scale=4.0}]  %% [scale=4] ONLY changes distances, not the canvas
        % 绘制弧线（椭圆的一部分），指定圆心，弧线角度范围，长轴和短轴
        \draw[blue] (0,1) arc (90:-90:0.5cm and 1cm);
        \draw[dashed,red] (0,1) arc (90:270:0.5cm and 1cm);
        \draw (0,0) circle (1cm);
        % filldraw 绘制边缘并填充内部（fill 和 draw 的合体）
        \filldraw[red] (0,1) circle (0.05);  %add fill=, and draw= to have separate colors
        \filldraw[red] (0,-1) circle (0.05);
        % 绘制阴影 [阴影类型，10% 蓝色（90% 白色）0.20 透明度] 阴影形状
        \shade[ball color=blue!10!white,opacity=0.20] (0,0) circle (1cm);
    \end{tikzpicture}
\end{center}
```

##### 线条粗细与节点

```tex
\begin{tikzpicture}

% 不同粗细的线条
\draw[ultra thick] (0,3) -- (2,3);
\draw[very thick] (0,2.5) -- (2,2.5);
\draw[thick] (0,2) -- (2,2);
\draw[thin] (0,1.5) -- (2,1.5);
\draw[very thin] (0,1) -- (2,1);
\draw[ultra thin] (0,.5) -- (2,.5);

% 节点
\draw node at (3,3) {Ultra Thick};  % (node 位置) {node 文本}
\draw node at (3,2.5) {Very Thick};
\draw node at (3,2) {Thick};
\draw node at (3,1.5) {Thin};
\draw node at (3,1) {Very Thin};
\draw node at (3,0.5) {Ultra Thin};

% 向图形插入节点
\filldraw (6,2) circle (0.1cm) node[anchor=west] {Anchored Node}

\end{tikzpicture}
```

##### 节点与线条

```tex
% 设置节点样式
% 样式名：SIR
% 样式：矩形，60% 红色边框（40% 白色），5% 红色填充（95% 白色），线条粗细，最小尺寸 5mm
\begin{tikzpicture}[
  SIR/.style={rectangle, draw=red!60, fill=red!5, very thick, minimum size=5mm}
]
% 节点
%          (节点名)        [相对位置]              {节点内容}
\node[SIR] (Susceptible)                        {Susceptible $S(t)$};
\node[SIR] (Infectious)  [below=of Susceptible] {Infectious $I(t)$};
\node[SIR] (Recovered)   [below=of Infectious]  {Recovered $R(t)$};

% 线条
%                     (起点)              插入节点[位置] {节点内容} (终点)
\draw[->, very thick] (Susceptible.south) to node[right] {$a$} (Infectious.north);
\draw[->, very thick] (Infectious.south)  to node[right] {$b$} (Recovered.north);
% 贝塞尔曲线            (起点)            .. controls +(控制点)     and +(控制点)      .. (终点)
\draw[->, very thick] (Recovered.east) .. controls +(right:7mm) and +(right:7mm) .. (Susceptible.east);
\end{tikzpicture}
```

> 线条中的 `to` 和 `--` 是等价的，`to` 可以插入节点，`--` 不能插入节点。
> 使用相对位置必须添加库 `\usetikzlibrary{positioning}`。

另一个示例

```tex
\begin{tikzpicture} [
youngnode/.style={rectangle, draw=red!60, fill=red!5, very thick, minimum size=40},
oldnode/.style={rectangle, draw=blue!60, fill=blue!5, very thick, minimum size=40}
]

% 节点
\node[oldnode]   (SusO)                 {$S_O(t)$};
\node[oldnode]   (InfO) [below=of SusO] {$I_O(t)$};
\node[oldnode]   (RecO) [below=of InfO] {$R_O(t)$};

\node[youngnode] (SusY) [left=of SusO]  {$S_Y(t)$};
\node[youngnode] (InfY) [left=of InfO]  {$I_Y(t)$};
\node[youngnode] (RecY) [left=of RecO]  {$R_Y(t)$};

% 线条
\draw[->, very thick] (SusO.south east) to node [right] {$a_ {OO}$} (InfO.north east);
\draw[->, very thick] (InfO.south)      to node [right] {$b_O$}     (RecO.north);
\draw[->, very thick] (RecO.east) .. controls +(right:17mm) and +(right:17mm) .. (SusO.east);

\draw[->, very thick] (SusY.south west) to node[left] {$a_{YY}$} (InfY.north west);
\draw[->, very thick] (InfY.south)      to node[left] {$b_Y$}    (RecY.north);
\draw[->, very thick] (RecY.west) .. controls +(left:17mm) and +(left:17mm) .. (SusY.west);

\draw[dashed, ->, very thick] (InfO.north west) to                       (SusY.south east);
\draw[->, very thick]         (SusY.south east) to node[left] {$a_{OY}$} (InfY.north east);

\draw[dashed, ->, very thick] (InfY.north east) to                        (SusO.south west);
\draw[->, very thick]         (SusO.south west) to node[right] {$a_{YO}$} (InfO.north west);

\end{tikzpicture}
```

#### pgfplots

[YouTube: Dr. Trefor Bazett](https://www.youtube.com/watch?v=5jmIHOWpEg0&list=PLHXZ9OQGMqxcWWkx2DMnQmj5os2X5ZR73&index=6)

##### 绘制 2D 图形

pgfplots 是基于 tikz 构建的

```tex
% Preamble
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}  % 指定 pgfplots 版本
\pgfplotsset{width=10cm}  % 可以设置全局宽度
```

###### 绘制一个直角坐标系函数图

```tex
\begin{tikzpicture}
  \begin{axis}      % \begin{axis}[xmin=-2, xmax=2, ymin=-2, ymax=2]
    \addplot{x^2};  % \addplot[color=red, dashed, mark=*, samples=50]{x^2};
  \end{axis}
\end{tikzpicture}
```

> `samples=50` 表示采样 50 个点，`mark=*` 表示标出采样点。  
> 为了使图形更加平滑，可以为 addplot 命令添加 `smooth` 选项

改变坐标轴的位置

```tex
\begin{tikzpicture}
  \begin{axis}[axis lines=left]  % other options: middle, right
    \addplot {x^2};
  \end{axis}
\end{tikzpicture}
```

添加横轴、纵轴的标签，以及图像的标题

```tex
\begin{tikzpicture}
  \begin{axis}[xlabel=$x$, ylabel=$y$, title={Like and Subscribe!}]
    \addplot {x^2};
```

只显示图形的一部分

```tex
\begin{tikzpicture}
  \begin{axis}[xmin=-2, xmax=2, ymin=-2, ymax=2, axis lines=middle]
    \addplot[color=red, domain=-1:1]{x^2};
    \addplot[color=blue]{1-x^2};
  \end{axis}
\end{tikzpicture}
```

添加横轴标签

```tex
\begin{tikzpicture}
    \begin{axis}[
    clip=false,  % 避免注释超出图像被裁减掉
    xmin=0, xmax=2.5*pi,
    ymin=-1.5, ymax=1.5,
    axis lines=middle,
    xtick={0, pi/2, pi, 3*pi/2, 2*pi},  % 横轴标签的位置
    xticklabels={$0$, $\frac{\pi}{2}$, $\pi$, $\frac{3}{2}\pi$, $2\pi$}],  % 横轴标签的文本
    xticklabel style={anchor=south west},  % 横轴标签的位置，锚点在 label 的左下角
    xmajorgrids=true,  % 启用 x 轴网格
    grid style=dashed  % 网格风格为虚线
    ]
        \addplot[domain=0:2*pi,red]{sin(deg(x))} node[right,pos=0.9]{$f(x)=\sin x$};  % 将节点放在图像 90% 的位置的右侧
        \addplot[domain=0:2*pi,blue]{cos(deg(x))} node[right,pos=1]{$g(x)=\cos x$};
    \end{axis}
\end{tikzpicture}
```

> pgfplots 使用角度作为 sin 和 cos 的参数，因此需要使用 `deg(x)` 将 x 转换为角度。

###### 散点图

```tex
\begin{tikzpicture}
    \begin{axis}
        \addplot+[  % + 表示在默认设置的基础上增加自定义设置
        only marks,  % 只绘制点，不绘制连线
        scatter,  % 设置为散点图的颜色
        mark size=2.9pt  % 稍微增大点的大小
        ]
        table[meta=ma]  % 设置 ma 列为纵坐标（数据第一行默认为横坐标）
        {test.txt};  % 实际的数据文件
    \end{axis}
\end{tikzpicture}
```

test.txt

```
GPA ma ve co un
3.45 634 589 3.76 3.52
2.78 558 512 2.87 2.91
2.52 583 503 2.54 2.4
3.67 685 602 3.83 3.47
3.24 592 538 3.29 3.47
2.1 562 486 2.64 7.37
2.82 573 548 2.86 2.4
2.36 559 536 2.03 2.24
2.42 552 583 2.81 3.02
3.51 617 591 3.41 3.32
3.48 684 649 3.61 3.59
2.14 568 592 2.48 2.54
2.59 604 582 3.21 3.19
3.46 619 624 3.52 3.71
3.51 642 619 3.41 3.58
3.68 683 642 3.52 3.4
3.91 703 684 3.84 3.73
3.72 712 652 3.64 3.49
2.15 564 501 2.14 2.25
2.48 557 549 2.21 2.37
3.09 591 584 3.17 3.29
2.71 599 562 3.01 3.19
2.46 607 619 3.17 3.28
3.32 619 558 3.01 3.37
3.61 700 721 3.72 3.61
3.82 718 732 3.78 3.81
2.64 580 538 2.51 2.4
2.19 562 507 2.1 2.21
3.34 683 648 3.213.58
3.48 717 724 3.68 3.51
3.56 701 714 3.48 3.62
3.81 691 684 3.71 3.6
3.92 714 706 3.81 3.65
4 689 673 3.84 3.76
2.52 554 507 2.09 2.27
2.71 564 543 2.17 2.35
3.15 668 604 2.98 3.17
3.22 691 662 3.28 3.47
2.29 573 591 2.74 3
2.03 568 517 2.19 2.74
3.14 607 624 3.28 3.37
2.03 568 517 2.19 2.74
3.14 607 624 3 28 3 37
```

自定义点的图形和颜色

```tex
\begin{tikzpicture}
\begin{axis}[scatter/classes={  % 设置散点图的类型
a={mark=square*,blue},  % a 类使用实心方框标记
b={mark=triangle*,red},  % b 类使用实心三角标记
c={mark=o,draw=black}}]  % c 类使用圆圈标记
% \addplot[] is better than \addplot+[] here:
% it avoids scalings of the cycle list
\addplot[scatter,only marks,
scatter src=explicit symbolic]  % sctter screener=explicit symbolic 使用显式符号作为散点筛选器
coordinates {  % 直接指定点的位置（而不是用 table 命令引入文件）
(0.1,0.15) [a]
(0.45,0.27) [c]
(0.02,0.17) [a]
(0.06,0.1) [a]
(0.9,0.5) [b]
(0.5,0.3) [c]
(0.85,0.52) [b]
(0.12,0.05) [a]
(0.73,0.45) [b]
(0.53,0.25) [c]
(0.76,0.5) [b]
(0.55,0.32) [c]
};
\end{axis}
\end{tikzpicture}
```

###### 堆叠条形图

```tex
\begin{tikzpicture}
\begin{axis} [ybar stacked]  % 指定图表的类型：y 轴堆叠条形图
% 指定最底层条形图的坐标
\addplot coordinates
{(0,1) (1,1) (2,3) (3,2) (4,1.5)};
% 指定中间层条形图的坐标，其最终高度是加在第一层上的
\addplot coordinates
{(0,2) (1,3) (2,1) (3,2) (4,2)};
% 指定最高层条形图的坐标，其最终高度是加在前两层上的
\addplot coordinates
{(0,0.5) (1,0.5) (2,4) (3,0) (4,3)};
\end {axis}
\end{tikzpicture}
```

##### 绘制 3D 图形

```tex
\begin{tikzpicture}
\begin{axis}
% 绘制三维函数图像
% surf 参数要求创建带有颜色的表面
% shader 参数指定着色方案，interp (interpolation) 表示使用平滑的 surf。（默认为 faceted，surf 上有网格）
\addplot3[surf, samples=20, shader=interp]{1-x^2-y^2};
\end{axis}
\end{tikzpicture}
```

改变图像颜色

```tex
\begin{tikzpicture}
% 将上色方案改为 cool，以及隐藏坐标轴
\begin{axis}[colormap/cool, hide axis]
\addplot3[mesh, samples=50]{1-x^2-y^2};  % 使用了网状风格
\end{axis}
\end{tikzpicture}
```

> `\begin{axis}[]` 也可以修改图像的范围，或者标记的位置，或者坐标轴的标签、坐标轴的位置等等。

绘制 3D 图像的另一种风格：用线连接而成的函数图像（而不是平面）

```tex
\begin{tikzpicture}
  \begin{axis}[view={60}{30}]  % view 参数指定图像的视角
    % domain 指定 x 的范围，samples y=0 是为了保证第一个点和最后一个点不会连起来
    \addplot3+[domain=0:5*pi,samples=60, samples y=0]
      ({sin(deg(x))},  % 图像的 (x,y,z) 坐标是关于输入 x 的函数
       {cos(deg(x))},  % （平面风格图像里，z 是关于 (x,y) 的函数
       {x});
  \end{axis}
\end{tikzpicture}
```

#### cleveref

一种可以替代 `\ref` 命令的包

```tex
% Preamble
\usepackage{cleveref}

% Body
\begin{theorem}
  \label{thm:1}
  This is theorem 1.
\end{theorem}

\begin{equation}
  \label{eq:1}
  This is equation 1.
\end{equation}

\begin{equation}
  \label{eq:2}
  This is equation 2.
\end{equation}

\begin{equation}
  \label{eq:3}
  This is equation 3.
\end{equation}

I can now refer to \cref{thm:1}  % I can now refer to theorem 1

I can also do \cref{eq:1, eq:2, thm:1, eq:3}  % I can also do eqs. (1) to (3) and theorem 1.
```

### Tricks

#### 自定义命令

```tex
% Preamble
% \newcommand\命令名[参数个数]{命令体}
\newcommand\pd[2]{\displaystyle\frac{\partial #1}{\partial #2}}

% Body
$\pd{z}{x}$
```

#### conditional formatting

```tex
% Preamble
\newcommand\conform{S}  % 把命令 conform 看作一个变量，它被赋值为 S

\newcommand\solution[1]{\if\conform S {Solution: #1}\else {There is no solution}\fi}  % 如果 conform 的值为 S，则显示 Solution: #1，否则显示 There is no solution

% Body
This is question 1.

\solution{This is my solution}  % Solution: This is my solution
```

```tex
% Preamble
\newcommand\conform{}  % 把命令 conform 看作一个变量，它被赋值为 S

\newcommand\solution[1]{\if\conform S {Solution: #1}\else {There is no solution}\fi}  % 如果 conform 的值为 S，则显示 Solution: #1，否则显示 There is no solution

% Body
This is question 1.

\solution{This is my solution}  % There is no solution
```

#### Style Sheet

功能类似于 C 的 `#include` 命令，可以把一些常用的命令放在一个文件里，然后在需要的地方用 `\input{文件名}` 引入。

MyStyleSheet.sty

```tex
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{amssymb}
\usepackage{amsfonts}
```

main.tex

```tex
% Preamble
\usepackage{MyStyleSheet}
```

#### include 和 input

*Subsection1.tex*

```tex
\subsection{Subsection 1}
This is subsection 1.
```

*Subsection2.tex*

```tex
\subsection{Subsection 2}
This is subsection 2.
```

*main.tex*

```tex
% Preamble
\includeonly{Subsection2}  % 只编译 Subsection2.tex

% Body
\include{Subsection1}  % 输出的文件将不包含 Subsection 1，但是会分配一个编号

\include{Subsection2}  % 输出的 Subsection 2 的编号为 2
```

> `include` 和 `input` 命令的区别在于 `include` 的内容会被放在单独的页面，而 `input` 就好像是把内容直接插入到当前位置。

#### Be Semantic

```tex
% 尽量使用
\emph{This is important}

% 而不是
\textit{This is important}
```

