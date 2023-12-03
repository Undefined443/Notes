# Python

## 开发

[PyCharm Docs](https://www.jetbrains.com/help/pycharm/2022.2/installation-guide.html)

[腾讯云：Python 虚拟环境（pipenv、vnev、conda）一网打尽](https://cloud.tencent.com/developer/article/2124483)

### Poetry

Poetry 是当下热门的 Python 包管理器。Poetry 注重为项目提供完整的生命周期管理，包括构建、打包、发布和依赖管理。它的目标是成为 Python 项目的唯一工具。其使用 `pyproject.toml` 文件来管理项目的依赖和构建配置。

```sh
brew install poetry
```

#### 创建新项目

```sh
poetry new poetry-demo
cd poetry-demo
poetry shell
exit
```

#### 初始化已经存在的项目

```sh
cd pre-existing-project
poetry init
```

#### 安装依赖

```sh
poetry install
```

#### 激活虚拟环境

```sh
poetry shell
$ exit  # 退出虚拟环境
```

#### 移除虚拟环境

```sh
poetry env remove
```

[Poetry Docs: Basic Usage](https://python-poetry.org/docs/basic-usage/)

### Pipenv

Pipenv 是 Python 官方推荐的依赖管理工具，旨在简化 pip 和 virtualenv 的使用。其使用 `Pipfile` 和 `Pipfile.lock` 来管理项目的依赖和虚拟环境。

```sh
# 安装
pip3 install --user pipenv  # 如果当前用户不是 root，就使用 --user 选项
```

不要使用 `brew` 安装 `pipenv`:

> Homebrew installation is discouraged because it works better to install pipenv using pip on macOS.

```sh
pipenv install  # 为目录创建新的虚拟环境，并使用目录中的 Pipfile 或 requirements.txt 安装依赖

PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy  # deploy 会验证 Pipfile.lock 是不是由对应的 Pipfile 生成的

# 使用镜像源安装
pipenv install -i https://pypi.tuna.tsinghua.edu.cn/simple numpy

pipenv --venv  # 查看当前虚拟环境的信息

pipenv shell  # 激活虚拟环境

pipenv run python main.py  # 直接在外部运行虚拟环境命令

exit  # 退出虚拟环境

pipenv --rm  # 删除虚拟环境

# 更改镜像源
pipenv --pypi-mirror https://pypi.tuna.tsinghua.edu.cn/simple

pipenv lock    # 生成 Pipfile.lock
pipenv sync    # 安装 Pipfile.lock 中的依赖
pipenv update  # pipenv lock && pipenv sync

pipenv requirements > requirements.txt  # 生成 requirements.txt
```

常用命令一览：

```sh
pipenv --where                 # 列出本地工程路径
pipenv --venv                  # 列出虚拟环境路径
pipenv --py                    # 列出虚拟环境的 Python 可执行文件
pipenv install                 # 创建虚拟环境
pipenv install [moduel]        # 安装包
pipenv install [moduel] --dev  # 安装包到开发环境
pipenv uninstall[module]       # 卸载包
pipenv uninstall --all         # 卸载所有包
pipenv graph                   # 查看包依赖
pipenv lock                    # 生成 lockfile
pipenv run python [pyfile]     # 运行 py 文件
pipenv --rm                    # 删除虚拟环境
```

[Official Website](https://pipenv.pypa.io/en/latest/)

[Python Guide CN](https://pythonguidecn.readthedocs.io/zh/latest/dev/virtualenvs.html)

[掘金: Python——pipenv 精心整理教程](https://juejin.cn/post/6844904202737713160)

[简书: 拥抱 pipenv - ThomasYoungK](https://www.jianshu.com/p/d08a4aa0008e)

[Pipenv environment variable LANG is not set! | neldeles's personal blog/portfolio](https://www.neldeles.com/blog/posts/20200903-pipenv-environment-variable-lang-is-not-set)

### pip

#### [Remove the pip search command](https://github.com/pypa/pip/issues/5216)

由于自 2020 年 11 月 14 日以来，PyPI XMLRPC API 持续收到过量的搜索调用，因此 `pip search` 命令将在不久的将来（撰稿日期 2022.9.26）弃用。目前要想使用 `pip search` 功能，可以在 [PyPI 官网](https://pypi.org) 进行搜索。

```sh
pip3 venv .venv  # 在目录 .vnev 中创建虚拟环境
# 如果提示找不到 venv 命令，可以使用 python3 -m venv .venv
.venv/bin/activate
# activate.bat for CMD, activate.ps1 for PowerShell
```

> 即使没有激活虚拟环境，只要运行的是虚拟环境的 `Scripts` 目录下的 python 或 pip 可执行程序，依然能达到进入虚拟环境的效果。
>
> 在 PyCharm 中指定 Python 解释器为虚拟环境中的解释器即可进入虚拟环境。

### 换源

#### 临时更换镜像源

```sh
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ some-package
```

#### 永久更换镜像源

```sh
vim ~/.pip/pip.conf
```

填入以下内容

```ini
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
[install]
trusted-host = https://pypi.tuna.tsinghua.edu.cn
```

Windows 上的配置文件路径为 `%HOMEPATH%\pip\pip.ini`

[PIP 配置文件参考文档](https://pip.pypa.io/en/stable/topics/configuration/)

### requirements.txt

`pipreqs` 工具可以通过扫描项目目录帮助我们生成项目的依赖清单：

```sh
pip3 install pipreqs
pipreqs .  # 为当前项目生成依赖清单
```

也可以使用 `pip3 freeze`，该命令将当前虚拟环境中安装的所有包及其版本号写入 `requirements.txt` 文件。（需要在 venv 环境下执行）

```sh
pip3 freeze > requirements.txt  # 生成当前环境的依赖清单
pip install -r requirements.txt  # 安装依赖
```

可以在 `requirements.txt` 顶部添加 `-i https://pypi.tuna.tsinghua.edu.cn/simple` 来指定镜像源。

### pipinstaller

Installs pip packages on all your installed Python versions (Windows only)

[官方文档](https://pipinstaller.readthedocs.io/en/latest/)

```sh
# 打包项目
pipinstaller -p . -o ./dist 
```

## 杂项

[Python 标识符命名规范](http://c.biancheng.net/view/4186.html)

### 浅拷贝和深拷贝

[浅拷贝和深拷贝](http://c.biancheng.net/view/vip_6004.html)

1. 浅拷贝，指的是重新分配一块内存，创建一个新的对象，但里面的元素是原对象中各个子对象的引用。
2. 深拷贝，是指重新分配一块内存，创建一个新的对象，并且将原对象中的元素，以递归的方式，通过创建新的子对象拷贝到新对象中。

### bytes

相当于字节数组

```py
b1 = b"ASCII"                          # ASCII 字符可以直接转换为 bytes
b2 = bytes("string", encoding="utf-8") # 使用构造方法将指定的字符集转换为 bytes
b3 = "string".encode("utf-8")          # 使用字符串自带的 encode() 方法获得 bytes

s = b3.decode("utf-8")                 # bytes 类也有 decode() 方法返回 string
```

### 复数

```py
complex = 1 + 2j # 虚部以 j 或 J 作为后缀
```

### 高精度计算

```py
import decimal # 十进制运算
a = decimal.Decimal("10.0")
b = decimal.Decimal("3")
print(a/b)
```

```py
from fractions import Fraction
print(Fraction(10, 3))
```

### 原生字符串

```py
r'raw string'
r"raw string"
```

### 长字符串

```py
'''long string'''
"""long string"""
r'''raw long string'''
```

### 字符串换行

```py
# 推荐
str = ("str1"
"str2")

# 不推荐
str = "str1\
str2"
```

### 类型转换

[Python 类型转换](http://c.biancheng.net/view/4243.html)

```py
int(str)
float(str)
bool(str)
complex(real, [imag])
str(x)

chr(x) # 将 ASCII 码 x 转换成对应的字符
ord(c) # 将字符 c 转换成 ASCII 码

oct(x) # 将 x 转换为 8 进制字符串
hex(x) # 将 x 转换为 16 进制字符串
```

### 常用函数

```py
type(obj) # 检测 obj 的类型
id(obj)   # 返回 obj 的地址
dir(obj)  # 查看 obj 中的内容，obj 可省略。
help(obj) # 查看 obj 的帮助文档
```

`__doc__` 属性：提供某个函数的说明文档

### assert 断言

```py
assert expression # 若表达式值为假，抛出 AssertionError 错误。
```

### 逻辑控制

```py
# if
if expression:
    # TO DO
elif expression:
  pass
else:
    # TO DO

# while
while expression:
    # TO DO
else:
    # TO DO

# for
for var in c:
    # TO DO
else:
    # TO DO

break
continue
```

> `while` 和 `for` 后面都可以跟 `else`

## 运算符

### 算数运算符与赋值运算符

`//` 整除

`**` 幂运算

`*` 可以用于重复字符串：`str * 4`

> 别忘了幂运算可以实现开方运算：`16**(1/4)`

[算数运算符](http://c.biancheng.net/view/2183.html)  
[赋值运算符](http://c.biancheng.net/view/2182.html)

`is`, `is not`：`==` 用来比较两个变量的值是否相等，而 `is` 用来对比两个变量引用的是否是同一个对象。

### 逻辑运算符

`and`, `or`, `not`

`and` 和 `or` 运算符会将其中一个表达式的值作为结果。

### 三目运算符

```py
max = a if a>b else b
```

## I/O

### 输入

```py
str = input("tipmsg") # tipmsg 是提示信息
```

### 输出

```py
print(value, ..., sep=' ', end='\n', file=sys.stdout, flush=False)
```

`print()` 函数接受多个输出内容 `value`，可以通过 `sep` 设置分隔符，`end` 设置结束符，`file` 设置输出文件，`flush` 控制输出缓存（一般为 `False`）。

```py
f = open("input.txt", "w") # 以写入模式打开 input.txt
print('Hello World', file=f)
f.close()
```

#### print 格式化输出

[print 格式化输出](http://c.biancheng.net/view/2177.html)

`print()` 使用的转换说明符与 C 语言 `printf()` 类似。

```py
name = "Xiao"
age = 20
print("My name is %s and I'm %d years old." % (name, age))
```

格式化字符串和变量之间用 `%` 分隔。

[转义字符](http://c.biancheng.net/view/2176.html)

## 序列

```py
str[1] # 可以使用 0 ~ n-1 的索引访问序列元素，也可以使用 -n ~ -1 的索引访问序列元素。
str[start:end:step] # 序列切片，[start, end)
list = [None] * 5       # 序列相乘
```

### in 关键字

可以使用 `in` 关键字检查某元素是否为序列的成员：

```py
str = "c.biancheng.net"
print('c' in str)
```

还有和 `in` 功能相反的 `not in` 关键字。

### 内置函数

```py
len(s)
max(s)
min(s)
list(s)      # 将序列转换为列表
str(s)       # 将序列转换为字符串
sum(s)       # 计算元素和，元素必须为数字。
sorted(s)    # 返回一个排好序的 list
reversed(s)  # 返回给定序列的反向迭代器
enumerate(s) # 将序列组合为一个索引序列
```

[sorted()](http://c.biancheng.net/view/2239.html)

### list

Python 中没有数组，但是有功能更加强大的列表。

```py
# 创建列表
l = [1, "2", [3.0]] # 列表可以存储任意类型
# list() 可以将其他数据类型转换为列表类型
l = list("Hello")   # ['H', 'e', 'e', 'l', 'l', 'o']

# 添加元素
l.append(obj)    # 将参数作为整体加入列表
l.extend(obj)    # 若参数是列表或元组，将它们包含的元素逐个加入列表。
l.insert(0, obj) # 在指定位置插入元素，将参数视为整体
l3 = l1 + l2

# 删除元素
del l[0]         # 也可以使用负数索引
del l[start:end] # 删除 [start, end)
l.pop(index)     # 若省略索引则删除最后一个元素
l.remove(val)    # 根据元素本身的值进行删除，只会删除第一个匹配项，并且必须保证匹配项存在。
l.clear()        # 清空列表

# 修改元素
l[0] = 2
l[1:4] = [3.4, 5, 2]     # 新赋值元素个数可以不与区间元素个数相同
l[1:6:2] = [0.1, -99, 2] # 但是如果指定步长，则必须相同。

# 查找元素
# 如果元素不存在，抛出 ValueError 错误。返回 val 的索引值。
l.index(val[,start[,end]])

count(val) # 返回元素在列表中出现的次数
```

`del` 删除的应该是引用变量，实际的内存空间并不会马上被回收。要想让系统回收这些内存，需要使用 `gc` 库的 `collect()` 函数。

```py
import gc
l = [1, 2, 3]
del l
gc.collect()
```

#### range() 快速初始化数字列表

```py
r1 = range(10)
r2 = range(0, 10)    # 返回 [0, 10) 的 range
r3 = range(0, 10, 2) # 设置步长
```

> `range()` 返回的并不是 `list` 类型，返回的就是 `range` 类型。如果要得到 `list` 类型，需要使用 `list()` 函数。

#### 序列解包

Python 可以以这种形式直接将列表/元组中的元素赋给对应的变量：

```py
lst = [1, 2, 3]
a1, a2, a3 = lst
```

### tuple 元组

1. 元组是不可变序列；
2. 元组可以在映射和集合中当作“键”来使用；

```py
t1 = (1, 2, 3)  # 元素可以是任意类型；小括号可以省略。
t1 = 1, 2, 3
t2 = ("str",)   # 如果元组中只有一个字符串，必须在字符串后面加一个逗号。

t3 = tuple(obj) # 将其他数据类型转化为元组类型
```

### dict 字典

相当于 C++ 中的 map

```py
d1 = {key1: val1, key2: val2}        # val 可以是任意数据类型，key 只要满足唯一和不可变即可。
d2 = dict.fromkeys(list, value=None) # 使用 list 作为键的列表，value 为每个键对应的值。
d3 = dict(str1=val1, str2=val2)      # str 表示字符串类型的键（不带引号）

s = [['two', 2], ['one', 1], ['three', 3]]
d4 = dict(s)                         # 向 dict() 函数传入列表或元组，而它们中的元素又各自是包含 2 个元素的列表或元组，其中第一个元素作为键，第二个元素作为值。

keys = ['one', 'two', 'three']
vals = [1, 2, 3]
a = dict(zip(keys, vals))
```

#### 基本操作

```py
# 访问元素
d[key]               # 若 key 不存在，则抛出异常。
d.get(key[,default]) # 不会抛出异常，可以指定查找失败时的默认返回值。

# 增加/修改元素
d[key] = val         # 直接给不存在的键赋值；当键已存在时，覆盖对应的值。

# 删除元素
del d[key]

# 判断字典中是否存在指定的键
print(key in d)
```

#### 常用操作

##### 获取字典的键、值、键值对

```py
d.keys()   # 返回 dict_keys
d.values() # 返回 dict_values
d.items()  # 返回 dict_items
```

这些方法的返回值不是常见的列表或元组类型，如果想使用返回的数据，一般有下面两种方法：

1. 使用 `list()` 函数
2. 使用 `for in` 循环

```py
for k, v in d.items():
    print(k + ": " + v)
```

#### copy()

`copy()` 方法只会对最表层的键值对进行深拷贝。

```py
d1 = {'one': 1, 'two': 2, 'three': [1, 2, 3]}
d2 = d1
d1['four'] = 4        # 不影响 d2
d1['three'].remove(1) # 影响 b2
```

#### 其他

```py
d2.update(d1) # 使用 d1 更新 d2 ，不存在的键值对加入，重复的键值对覆盖。

d.pop(key)    # 删除指定的键值对
d.popitem()   # 删除最后的键值对

d.setdefault(key, defval) # key 不存在时，设置 key-defval 键值对并返回 defval；key 存在时，返回其对应的 val 。
```

[使用字典格式化字符串](http://c.biancheng.net/view/vip_6002.html)

### set 集合

set 相当于只有键，没有值的 map 。

```py
s1 = {1, 2, 3}
s2 = set(iteration) # 将字符串、列表、元组等可迭代对象转换成集合
```

> 1. `{}` 会被解释器当作空字典，而不是空集合。
> 2. 由于 Python 中的 set 集合是无序的，所以每次输出时元素的排序顺序可能都不相同。

#### 基本操作

```py
s.add(obj)    # 只能添加不可变数据
s.remove(obj) # 若元素不存在，则抛出 KeyError 错误。

s1 & s2       # 取交集
s1 | s2       # 取并集
s1 - s2       # 取差集
s1 ^ s2       # 取对称差集
```

> 取对称差集：取集合 A 和 B 中不属于 A & B 的元素

[set 方法](http://c.biancheng.net/view/4402.html)  
[frozenset](http://c.biancheng.net/view/4401.html)

### 字符串

```py
str1 = "string 1" "string 2" # 拼接字符串常量
str2 = s1 + s2               # 拼接字符串变量

str(obj)                     # 将 obj 转换为字符串
repr(obj)                    # 将 obj 转换为 Python 字符串的表达式形式

s.encode("gbk")              # 获取编码后得到的 bytes
```

[encode() 和 decode() 方法](http://c.biancheng.net/view/4305.html)

#### 常用方法

```py
# 分割字符串
s.split(sep[,maxsplit])   # sep：分隔符，默认为 None ，表示所有空白符；maxsplit 表示分割次数（返回的列表中最多有 maxsplit + 1 个元素），分割后剩余的部分不会截断，而是一起放到返回的 list 中。
s.split(maxsplit=-1)      # 如果不指定 sep 参数，则必须指定 maxsplit；maxsplit=-1 表示分割次数没有限制。

# 连接字符串
str.join(iterable) # str 是合并时的分隔符，iterable 是合并字符串的来源，可以是列表、元组等。
'-'.join(["152", "0950", "3397"])

# 统计子串出现次数
s1.count(s2[,start[,end]])

# 查找子串
s1.find(s2[,start[,end]])  # 返回 s2 在 s1 中的索引，或者 -1 。
s1.rfind(s2[,start[,end]])
s1.index(s2[,start[,end]]) # 与 find 的区别是，如果查找失败，index() 会抛出异常。

# 文本对齐
# width 是包括 s 本身在内的字符串总长度；fillchar 默认为空格。
s.ljust(width[,fillchar])  # 左对齐
s.rjust(width[,fillchar])  # 右对齐
s.center(width[,fillchar]) # 居中

s1.startswith(s2[,start[,end]]) # 检查 s1 是否以 s2 为开头
s1.endswith(s2[,start[,end]])

s.title() # 将每个单词的首字母大写，其他小写。
s.lower() # 全部转换为小写
s.upper()

# 删除指定字符（串）
s.strip([chars])  # 删除 s 左右两侧的指定字符（串）
s.lstrip([chars])
s.rstrip([chars])
```

> 如果 `sep` 参数为 `None` ，则连续的空白符不会对分割结果产生影响。

#### format()

[format() 格式化输出](http://c.biancheng.net/view/4301.html)

使用 `{}` 和 `:` 指定占位符

```py
print("货币形式：{:,d}".format(1000000))
print("科学计数法：{:E}".format(1200.12))
print("100 的十六进制：{:#x}".format(100))
print("0.01 的百分比表示：{:.0%}".format(0.01))
```

### 推导式

使用推导式可以快速生成列表、元组、字典以及集合类型的数据，因此推导式又可细分为列表推导式、元组推导式、字典推导式以及集合推导式。

列表推导式的语法格式：

`[表达式 for 迭代变量 in 可迭代对象 [if 条件表达式]]`

其中，`[if 条件表达式]` 可以省略。

```py
# 列表推导式
[x**2 for x in range(1, 10)]                       # 1 到 9 的平方列表
[x**2 for x in range(1, 10) if x % 2 == 0]         # 1 到 9 的偶数平方列表
[(x, y) for x in range(1, 6) for y in range(1, 5)] # 可以使用多个循环

# 元组推导式
(x**2 for x in range(1, 10)) # 用法和列表推导式相同

# 字典推导式
{key:len(key) for key in l}  # 使用列表 l 中的元素作为 key ，key 的长度作为 value 。

# 集合推导式
{x**2 for x in range(1, 10)}
```

元组推导式生成的结果并不是 `tuple` ，而是 `generator` 。在遍历过 `generator` 对象后其中的元素将不复存在。

```py
a = (x for x in range(1, 10)) # 通过元组推导式获得一个 generator
```

如果想要使用元组推导式获得新元组或新元组中的元素，有以下三种方式：

1. 使用 `tuple()` 构造函数

```py
print(tuple(a))
```

2. 使用 for 循环遍历 generator 对象

```py
for i in a:
    print(i, end=' ')
```

3. 使用 `__next__()` 方法遍历 generator 对象

```py
print(a.__next__())
print(a.__next__())
```

### zip() 函数

`zip()` 可以将多个序列按照对应位置顺序重组为一个个新的元组。当序列元素个数不一致时，取最短的那个。

```py
zip(iterable, ...)
```

`zip()` 函数返回的是一个 `zip()` 对象，可以遍历 generator 的方法来访问。

### collections 模块

```py
import collections

dq = deque()
```

## 函数

```py
def func():
    '''
    这里可以编写说明文档
    '''
    # TO DO
    return

# 获得说明文档
help(func)
print(func.__doc__)
```

在传递参数时，如果实参类型为不可变类型 (字符串、数字、元组)，则使用值传递；若实参类型为可变类型 (列表、字典)，则使用引用传递。其原因是在 Python 中可变类型是引用数据类型，在传参时实际上传的是引用，本质上还是值传递。

因此，如果需要让函数修改某些数据，则可以通过把这些数据包装成列表等可变对象，然后在函数中修改列表的方式来完成。

### 关键字参数

```py
def func(n1, n2):
    print(n1)
    print(n2)

func(1, 2)       # 使用位置参数
func(n2=2, n1=1) # 使用关键字参数
func(1, n2=2)    # 混合传参，关键字参数必须位于所有位置参数之后。
```

### 参数默认值

```py
def func(arg1, arg2, arg3=3): # 有默认值的形参必须放在最后
    pass

print(func.__defaults__)      # 可以通过函数的 `__defaults__` 属性查看函数的参数默认值
```

### 可变参数

```py
# 元组参数
def func(home, *args) # 在位置参数接收实参后，args 将剩下的所有非关键字参数以元组的形式接收。
def func(*args, home) # 元组形式的可变参数不一定要放在最后，但此时必须以关键字参数的形式指定位置参数 home 。

# 字典参数
def func(home, **args) # args 接收所有以关键字参数赋值的实参，此时 args 必须放在最后。
```

> 可变参数的默认值是空元组/空字典，因此可以不给可变参数传值。

### 逆向参数收集

可变参数将多个参数存储到列表/元组中，这个过程称为参数收集。反过来，将列表、元组、字典作为函数参数，Python 可以将其拆分，把其中的元素按照次序分给函数中的各个形参，这个过程叫做逆向参数收集。

和可变参数的规则类似，传入列表或元组时，要在其名称前加一个 `*` ，传入字典时，要在其名称前加一个 `**` 。

```py
def func(arg1, arg2, arg3):
    pass

args = [1, 2, 3]
func(*args)  # 列表，以位置参数的方式传参。

args = {"arg1": 1, "arg2": 2, "arg3": 3}
func(**args) # 字典，以关键字参数的方式传参。
```

### 偏函数

简单的理解偏函数，它是对原始函数的二次封装，是将现有函数的部分参数预先绑定为指定值，从而得到一个新的函数，该函数就称为偏函数。相比原函数，偏函数具有较少的可变参数，从而降低了函数调用的难度。

```py
from functools import partial

def func1(arg1, arg2):
    pass

func2 = partial(func1, arg1 = 1) # 定义偏函数，其封装了 func1() ，并为 arg1 设置了默认参数。
func2(arg2 = 2) # 这里必须用关键字参数的形式给 arg2 传参，否则 Python 将尝试将参数传给 arg1 。
```

### 变量作用域

#### 在函数内定义全局变量

```py
def func():
    global var # 在使用 global 关键字修饰变量名时，不能给变量赋初值。
```

#### 获取指定作用域中的变量

```py
globals() # 返回一个包含所有全局变量的字典
globals()['var1'] = 1 # 可以通过该字典访问或修改指定变量

locals() # 返回一个包含当前作用域内所有变量的字典
print(locals()['var1']) # locals() 返回的字典只能访问变量，无法用来修改变量的值。

vars(obj) # 返回 obj 对象范围内所有变量组成的字典。
```

如果要在函数内操作全局变量，有以下两种方法：

1. 通过 `globals()` 函数

```py
var = 1
def func():
    print(globals()['var']) # 访问全局变量 var
    var = "new var" # 定义一个新的局部变量 var
```

2. 使用 `global` 语句声明全局变量

```py
var = 1
def func():
    global var
    print(var)
    var = "same var" # 对全局变量 var 赋值
```

## 类

```py
class Student:
    name = "Xiao"
    age = 20
    
    # 构造函数
    def __init__(self, _name):
        name = _name
    
    def func(self, msg):
        print(msg)
        
stu = Student("Li Xiao")
stu.money = 999_999_999 # 可以给类对象动态添加/删除变量
del stu.money
```

## 实际应用

为 Python 项目独立地配置虚拟环境：[Virtual Environments and Packages](https://docs.python.org/3/tutorial/venv.html)

```py
python3 -m venv .venv  # 在当前项目下新建一个 .venv 文件夹，用于存放虚拟环境
source .venv/bin/activate  # 进入虚拟环境
deactivate  # 退出虚拟环境
```

### 进度条

```py
from tqdm import tqdm

progress_bar = tqdm(total=total_num, desc='Progress', unit='kb', unit_scale=True)
for i in range(total_num):
    progress_bar.update(1)
progress_bar.close()
```