# Python

## 杂项

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

### 运算符

#### 算数运算符与赋值运算符

`//` 整除

`**` 幂运算

`*` 可以用于重复字符串：`str * 4`

> 别忘了幂运算可以实现开方运算：`16**(1/4)`

[算数运算符](http://c.biancheng.net/view/2183.html)  
[赋值运算符](http://c.biancheng.net/view/2182.html)

`is`, `is not`：`==` 用来比较两个变量的值是否相等，而 `is` 用来对比两个变量引用的是否是同一个对象。

#### 逻辑运算符

`and`, `or`, `not`

`and` 和 `or` 运算符会将其中一个表达式的值作为结果。

#### 三目运算符

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
name = "李潇"
age = 20
print("我叫%s我今年%d岁" % (name, age))
```

格式化字符串和变量之间用 `%` 分隔。

[转义字符](http://c.biancheng.net/view/2176.html)

## 序列

可以使用 0 ~ n-1 的索引访问序列元素，也可以使用 -n ~ -1 的索引访问序列元素。

```py
str[0]
str[start : end : step] # 序列切片，[start, end)
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
