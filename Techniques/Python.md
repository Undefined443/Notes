# Python

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
r'row string'
r"row string"
```

### 长字符串

```py
'''long string'''
"""long string"""
r'''row long string'''
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

### range() 快速初始化数字列表

```py
r1 = range(10)
r2 = range(0, 10)    # 返回 [0, 10) 的 range
r3 = range(0, 10, 2) # 设置步长
```

> `range()` 返回的并不是 `list` 类型，返回的就是 `range` 类型。如果要得到 `list` 类型，需要使用 `list()` 函数。

### tuple 元组

1. 元组是不可变序列；
2. 元组可以在映射和集合中当作“键”来使用；

```py
t1 = (1, 2, 3)  # 元素可以是任意类型；小括号可以省略。
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

### zip() 函数

`zip()` 可以将多个序列按照对应位置顺序重组为一个个新的元组。当序列元素个数不一致时，取最短的那个。

```py
zip(iterable, ...)
```

### collections 模块

```py
import collections

dq = deque()
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
