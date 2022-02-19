# Shell

## 以 root 账户登录 Shell

```bash
sudo su
```

> sudo: superuser do

## 执行 Shell 脚本

指明脚本解释器：

```bash
#!/bin/bash
```

### 在新进程中运行 Shell 脚本

```bash
# 将 Shell 脚本作为程序运行
# 如果不写 ./，Linux 只会到系统路径（由 PATH 环境变量指定）下查找外部命令
chmod +x script.sh # 给脚本添加执行权限
./script.sh          # 运行脚本

# 将 Shell 脚本作为参数传递给 Bash 解释器
bash script.sh # 这种方式将忽略脚本文件第一行的指定解释器信息
```

### 在当前进程中运行 Shell 脚本

```bash
source script.sh # 在 zsh 下依然需要使用 ./script.sh
. script.sh      # source 命令的简化写法
```

## 配置脚本

Shell 有多个配置文件。对普通用户来说，~/.bashrc 是最重要的文件，因为不管是否登陆都会加载该文件。

Git Bash for Windows 的配置文件在 `C:\Program Files\Git\etc\profile.d\git-prompt.sh`

[Shell 配置文件（配置脚本）的加载](http://c.biancheng.net/view/vip_3232.html)

实例

```bash
# 给 PATH 变量增加新的路径
PATH=$PATH:$HOME/addon # 将主目录下的 addon 目录也设置为系统路径
# 修改命令提示符的格式
PS1="[bash]\$" # 命令提示符改为 [bash]$
```

> PATH 使用冒号 `:` 分隔不同的路径

[PS1 和 PS2 中的特殊字符](http://c.biancheng.net/view/vip_3279.html)

## 变量

在 Bash shell 中，每一个变量的值都是字符串。在默认情况下，Bash shell 不会区分变量类型。当然，如果有必要，也可以使用 `declare` 关键字显式定义变量的类型。

```bash
# 定义变量
variable=value # 如果要赋的值不包含任何空白符及转义字符，那么可以不使用引号。不建议这种写法
variable='value' # '' 相当于原生字符串，将不解析内容中的变量、命令
variable="value" # 最常用的情况。会解析其中的变量，命令。但是不会解析转义字符

readonly variable # 将变量定义为只读变量
unset variable # 删除变量。unset 命令不能删除只读变量

# 使用变量
author="李潇"
echo $author
echo "作者是${author}。" # 用花括号指明变量名的边界
```

### 命令替换

```bash
# 命令替换：将命令的结果赋给变量
var=`cat log.txt` # 多个命令之间以分号 ; 分隔
var=$(cat log.txt) # 推荐，并且这种方式最常见
Fir_File_Lines=$(wc -l $(ls | sed -n '1p')) # 两层嵌套
# 注意，如果被替换的命令的输出内容有换行符，或者含有多个连续的空白符，那么在输出变量时应该将变量用双引号包围，否则系统会使用默认的空白符来填充。
echo "$var"
```

> 修改变量的值时不能在变量名前加 `$`，只有在使用变量时才能加 `$`。
>
> `=` 的周围不能有空格

### 变量的作用域

#### 局部变量

```bash
function func() {
  local a=99 # 若不使用 local，则 a 是全局变量
}
```

#### 全局变量

在当前 Shell 进程中有效。在 Shell 中定义的变量**默认就是全局变量。**

#### 环境变量

在所有的子进程中有效。

```bash
export a # 将变量导出为环境变量
export b=22 # 在定义的同时导出为环境变量
```

> 环境变量被创建时所处的 Shell 进程称为父进程，父进程中创建的进程叫子进程。创建子进程最简单的方式是运行 `bash` 命令。通过 `exit` 命令可以一层一层地退出 Shell。
>
> exit 可以返回命令的退出状态：`exit 0`

![进入 Shell 子进程](http://c.biancheng.net/uploads/allimg/190418/1-1Z41QJGN02.gif)

## 位置参数

Shell 脚本文件和函数可以自动接收传入的参数，并以 `$1`, `$2`, ... , `$n` 的方式表示。

> 如果参数个数达到了 10 个，那么需要用 `${10}` 的方式指明参数名的边界

### 给脚本文件传递位置参数

script.sh:

```bash
#!/bin/bash

echo "Language: $1"
echo "Name: $2"
```

```bash
$ source script.sh Shell LiXiao
Language: Shell
Name: LiXiao
```

### 给函数传递位置参数

```bash
$ function func() {
$   echo "Language: $1"
$   echo "Name: $2"
$ }
$ func C++ LiXiao
Language: C++
Name: LiXiao
```

## 特殊变量

| 变量 | 含义                           |
| :--: | ---------------------------- |
| `$0` | 当前脚本的文件名                 |
| `$n` | 传递给脚本或函数的参数（从 1 开始计数）|
| `$#` | 传递给脚本或函数的参数个数         |
| `$*` | 传递给脚本或函数的所有参数         |
| `$@` | 传递给脚本或函数的所有参数         |
| `$?` | 上个命令的退出状态，或函数的返回值   |
| `$$` | 当前 Shell 进程 ID             |

> 命令的退出状态由 `exit` 命令返回，函数的返回值由 `return` 返回

### $* 和 $@ 的区别

当 `$*` 和 `$@` 不被双引号 `""` 包含时，它们没有任何区别。

当它们被双引号 `""` 包含时，会有如下区别：

- `"$*"` 会将所有的参数从整体上看做一份数据，而不是把每个参数都看做一份数据。
- `"$@"` 仍然将每个参数都看作一份数据，彼此之间是独立的。

## 字符串

```bash
# 获取字符串长度
echo ${#string}

# 字符串拼接
str1="a"
str2="b"
str3=$str1$str2"c" # 只需将字符串放在一起就能拼接

# 字符串截取
# 截取范围，从左边开始计数
$ str=111a222b333a444 # a 是第 3 位（从 0 开始计数）

$ echo ${str: 3: 5} # 从第 3 位开始输出 5 位

a222b

$ echo ${str: 3} # 省略长度
a222b333a444

# 从右边开始计数
$ echo ${str: 0-4: 5} # 从倒数第 4 位开始输出 4 位。b 是倒数第 4 位（从 1 开始计数）
b333a

# 截去子串
# 截去左边（截去前缀）
$ echo ${str#*a} # 从左边截去第一个匹配 a 及之前的所有字符
222b333a444

$ echo ${str#111a} # 省略通配符 *，此时需要写出完整的前缀
222b333a444

$ echo ${str##*a} # 从右边截去第一个匹配 a 及之前的所有字符
444

# 截去右边（截去后缀）
$ echo ${str%a*} # 从右边截去第一个匹配 a 及之后的所有字符
111a222b333

$ echo ${str%%a*} # 从左边截去第一个匹配 a 及之后的所有字符
111
```

## 数组

### 数组的声明与使用

在 Shell 中，用 `()` 来表示数组，数组元素之间用空格分隔：

```bash
# 数组没有长度限制
nums=(1 2 3) # 定义一个数组
nums=(1 2 3 "abc") # 数组没有类型限制
nums[20]=88
nums=([3]=24 [5]=19 [10]=12) # 可以只给特定元素赋值

# 获取数组元素
echo ${nums[0]} # 输出第 0 个元素
echo ${nums[*]} # 输出数组所有元素
echo ${nums[@]} # 另一种写法

unset nums[0] # 删除数组元素
unset nums # 删除数组
```

### 获取数组长度

和获取字符串长度的方法类似，使用 `#` 号：

```bash
# 两种形式是等价的
echo ${#nums[*]}
echo ${#nums[@]}
```

### 数组拼接

先将数组展开，然后再合并到一起：

```bash
# 两种形式是等价的
arr=(${nums_1[*]} ${nums_2[*]})
arr=(${nums_1[@]} ${nums_2[@]})
```

### 关联数组（下标是字符串的数组）

#### 定义与使用

```bash
declare -A color # 定义一个名为 color 的数组
color["red"]="#ff0000"
color["green"]="#00ff00"
color["blue"]="#0000ff"

# 在定义的同时赋值
declare -A color=(["red"]="#ff0000" ["green"]="#00ff00" ["blue"]="#0000ff")

echo $(color["red"]) # 访问关联数组
```

#### 获取所有键

```bash
# 两种形式是等价的
${!color[*]}
${!color[@]}
```

## Shell 数学运算

除了 C 语言中包含的所有算数运算符外，Shell 还包括幂运算符：`**`

### 整数运算

将表达式写在双小括号 `(())` 之间。多个表达式用 `,` 分隔，最后一个表达式的值将作为命令的执行结果。

使用 `$` 获取 (()) 命令的结果。

> Shell 中还有 `let` 命令，`$[]` 命令，它们的功能和 `(())` 一样，都是计算整数。 除此之外，还有 `expr` 命令也可以用于整数计算。

e.g.

```bash
$ ((a=2-1))
$ ((b=a+4))
$ echo $((1+2, 2**3))
8
$ echo $((a<2&&b==5))
1
$ echo $((a++))
1
```

### 浮点数运算

使用 Linux `bc` 命令

一行一个表达式，或者一行中多个表达式用分号 `;` 分开。

[C 语言中文网：Linux bc 命令](http://c.biancheng.net/view/vip_3237.html)

#### 内置变量

|变量名|作用|
|:--:|:--|
|scale|指定精度，默认为 0|
|ibase|指定输入进制|
|obase|指定输出进制|
|last 或 .|表示最近打印的数字|

> :bulb: Tip: obase 要尽量放在 ibase 前面，因为指定 ibase 后，所有后续输入的数字都是以 ibase 的进制来换算的。

#### 内置函数

在输入 bc 命令时需要使用 `-l` 选项启用数学库。

|函数名|作用|
|:--:|:--|
|s(x)|正弦函数，x 是弧度值|
|c(x)|余弦函数，x 是弧度值|
|a(x)|反正切函数，返回弧度值|
|l(x)|自然对数函数|
|e(x)|自然指数函数|
|j(n,x)|贝塞尔函数，计算从 n 到 x 的阶数|

#### 在 Shell 中使用 bc 计算器

```bash
echo "expression" | bc # expression 可以包含 Shell 中的变量：$var
var=$(echo "expression" | bc)
```

e.g. 进制转换：

```bash
# 10 进制转 16 进制
i=15
j=$(echo "obase=16;$i" | bc)
echo $j

# 16 进制转 10 进制
k=$(echo "obase=10;ibase=16;$j" | bc) # 别忘了 obase 要写在 ibase 前面
echo $k
```

##### 借助重定向使用 bc 计算器

```bash
var=$(bc << EOF # 分界符（EOF）可以自定义
2*3
last/2
EOF
```

这种方式在有大量数学计算时比较方便

## declare 命令

语法：

```bash
declare [-/+] [选项] expression
```

> declare 和 typeset 都是 Shell 内建命令，它们用法相同，不过 typeset 已经弃用。

`-` 表示设置属性，`+` 表示取消属性。

|选项|含义|
|:--:|:--|
|-f|列出之前由用户在脚本中定义的函数名称和函数体|
|-F|仅列出自定义函数名称|
|-g|在 Shell 函数内部创建全局变量|
|-p|显示指定变量的属性和值|
|-a|声明变量为普通数组|
|-A|声明变量为关联数组|
|-i|将变量定义为整型|
|-r|将变量定义为只读|
|-x|将变量设置为环境变量|

e.g.

```bash
$ declare -i n m num # 将 n, m, num 声明为整型
$ declare -r CONST=23 # 将 CONST 声明为只读，等价于 readonly CONST

$ declare -p CONST # 显示变量的属性和值
declare -r CONST="23"
```

## 重定向

### 文件描述符

为了表示并区分已经打开的文件，Linux 会给每个文件分配一个 ID，即文件描述符（File Descriptor）。stdin，stdout，stderr 是默认打开的，它们已经有了自己的文件描述符：

|FD|文件名|
|:--:|:--:|
|0|stdin|
|1|stdout|
|2|stderr|

Linux 始终从文件描述符 0 读取内容，向文件描述符 1 输出正确结果，向文件描述符 2 输出错误提示。

文件描述符操作符（`>`, `<`）可以修改文件描述符指向的文件，从而实现重定向的功能。

### 输出重定向

格式：`FD>file`

在输出重定向中，`>` 表示覆盖，`>>` 表示追加。

> :bulb: **Tip:** `FD` 和 `>` 之间不能有空格，否则 Shell 会解析失败；`>` 和 `file` 之间的空格可有可无。

```bash
command >>file           # 以追加输出的方式打开 file，并让文件描述符 1 指向 file。这里 1 被省略
command 2>>file
command >>file1 2>>file2 # 正确结果输出到 file1，错误提示输出到 file2
command >>file 2>&1      # 2>&1：让文件描述符 2 指向文件描述符 1 所指的文件。结果是 1 和 2 都指向 file
command &>file           # 以覆写输出的方式打开 file，并让文件描述符 1 和 2 都指向 file
command n>&-             # 关闭文件描述符 n 及其代表的文件。n 默认为 1
```

> 建议将正确结果和错误输出保存到不同文件

#### /dev/null 文件

如果不想显示或保存任何输出，可以将输出重定向到 `/dev/null` 文件中：

```bash
ls -l &>/dev/null # 在 Windows 中的等价文件名为 NUL
```

### 输入重定向

格式：`FD<file`

```bash
command <file          # 以输入的方式打开 file，并让文件描述符 0 指向 file。这里 0 被省略
command <input >output # 从 input 输入，正确结果输出到 output
command n<>file        # 同时以输入和输出的方式打开 file，并让文件描述符 n 指向 file。n 默认为 0

# 使用 Here Document
command <<EOF
  document
EOF
```

#### Here Document

语法：

```bash
command <<END # END 是分界符，可以自定义
  document
END # 行内不能有其他内容
```

Shell 将把 document 的内容输入到命令中。

##### 忽略命令替换

默认情况下，document 中出现的变量和命令也会被求值或运行。你可以将分界符用单引号或双引号包围来使 Shell 替换失效：

```bash
command <<'END'
  document
END
```

##### 忽略制表符

默认情况下，行首的制表符也被当做正文的一部分。不过我们输入制表符仅仅是为了格式对齐，并不希望它作为正文的一部分。为了去掉制表符，你可以在 `<<` 和 `END` 之间添加 `-`：

```bash
cat <<-END
  document
END
```

##### 常见用法

Here Document 最常用的功能还是向用户显示命令或者脚本的用法信息：

```bash
usage(){
  cat <<-END
    usage: command [-x] [-v] [-z] [file ...]
    A short explanation of the operation goes here.
    It might be a few lines long, but shouldn't be excessive.
END
}
```

### 代码块重定向

将重定向命令放在代码块的结尾处，就可以对代码块中的所有命令实施重定向：

```bash
sum=0
while read n; do
  ((sum += n))
done <input >output # 输入重定向为 input，输出重定向为 output

# 组命令重定向
{
  echo "line 1"
  echo "line 2"
  echo "line 3"
} >file
```

## 管道

```bash
command1 | command2 # 管道符 | 左边命令的 stdout 将连接到右边命令的 stdin
```

![管道数据流指示](http://c.biancheng.net/uploads/allimg/190416/1-1Z4161052294c.gif)

### 管道与输入重定向

```bash
command1 <input | command2 | command3 >output # 第一个命令从 input 获取输入，最后一个命令向 output 写入输出
```

[C 语言中文网：管道详解](http://c.biancheng.net/view/3131.html)

### 过滤器

过滤器：从标准输入读取数据，向标准输出输出结果的命令

常用过滤器：

|命令|说明|
|:--|:--|
|awk|用于文本处理的解释性程序设计语言，通常被作为数据提取和报告的工具。|
|cut|用于将每个输入文件（如果没有指定文件则为标准输入）的每行的指定部分输出到标准输出。|
|grep|用于搜索一个或多个文件中匹配指定模式的行。|
|tar|用于归档文件的应用程序。|
|head|用于读取文件的开头部分（默认是 10 行）。如果没有指定文件，则从标准输入读取。|
|paste|用于合并文件的行。|l
|sed|用于过滤和转换文本的流编辑器。|
|sort|用于对文本文件的行进行排序。|
|split|用于将文件分割成块。|
|strings|用于打印文件中可打印的字符串。|
|tac|与 cat 命令的功能相反，用于倒序地显示文件或连接文件。|
|tail|用于显示文件的结尾部分。|
|tee|用于从标准输入读取内容并写入到标准输出和文件。|
|tr|用于转换或删除字符。|
|uniq|用于报告或忽略重复的行。|
|wc｜用于打印文件中的总行数、单词数或字节数。｜

#### grep

```bash
grep 'word' file    # 在 file 中查找并显示包含 word 的行
grep -i 'word' file # 忽略大小写
grep -R 'word' .    # 在当前目录及其子目录下的所有文件中查找并显示包含 word 的行
grep -c 'word' file # 搜索并显示 word 在 file 中出现的次数
```

## Shell 结构语句

### if else

```bash
if condition # 也可以写作：if condition; then
then
  statements
else
  statements
fi
```

> :bulb: **Tip:** condition 检测的是命令的退出状态。通常退出状态为 0 表示 “成功” ，其他状态表示 “失败” 。`((1))` 的退出状态为 0。

#### if elif else

```bash
if condition1; then
  statements
elif condition2; then
  statements
elif condition3; then
  statements
else
  statements
fi
```

if 语句也支持使用逻辑运算符将多个退出状态组合起来。

### case in

语法：

```bash
case expression in  # expression 可以是变量、数学表达式，或者是命令的执行结果。只要能得到 expression 的值就可以
  pattern1)         # pattern 可以是数字，字符串，甚至是简单的正则表达式
    statements
    ;;
  pattern2)
    statements
    ;;
  pattern3)
    statements
    ;;
  *)                # 可以没有 *) 部分。* 实际上是正则表达式
    statements   # 最后的双分号可以省略
esac
```

#### case in 支持的正则表达式

|格式|说明|
|:--|:--|
|*|表示任意字符串|
|[abc]|表示 a, b, c 三个字符中的任意一个。比如 [15ZH] 表示 1, 5, Z, H 中的任意一个|
|[m-n]|表示从 m 到 n 的任意一个字符。比如 [0-9] 表示一个数字，[0-9a-zA-Z] 表示一个字母或数字|
|\||表示多重选择，相当于或运算。比如 abc\|xyz 表示匹配字符串 "abc" 或 "xyz"|

e.g.

```bash
read -n 1 char
case $char in
  [a-zA-Z])
    printf "\n字母\n"
    ;;
  [0-9])
    printf "\n数字\n"
    ;;
  [,.?!])
    printf "\n标点符号\n"
    ;;
  *)
    printf "\n错误\n"
esac
```

### while

语法：

```bash
while condition
do
  statements
done
```

### until

until 的使用场景很少，一般使用 while 即可。

语法：

```bash
until condition # 若 condition 不成立则执行循环语句
do
  statements
done
```

### for

#### C 风格 for

```bash
sum=0
for((i=1; i<=5; ++i))
do
  ((sum += i))
done
echo $sum
```

#### Python 风格 for in

```bash
for variable in value_list
do
  statements
done
```

##### value_list

1. 直接给出具体的值：`1 2 3 4 5`，`"john" "jack" "tom"`
2. 给出一个取值范围（只支持数字和字母）：`{1..5}`，`{a..f}`
3. 使用命令的执行结果：`$(ls)`
4. 使用 Shell 通配符：`*.sh`
5. 使用特殊变量：`$@`（如果省略 value_list 的话相当于使用 $@）

[Shell 通配符](https://www.linuxidc.com/Linux/2016-08/134192.htm)

[[#特殊变量]]

### select in

select in 可以自动显示带编号的菜单，用户输入编号就可以为循环变量赋予编号对应的值。select in 经常与 case in 一起使用。

语法（结合 case in）：

```bash
select variable in value_list
do
  case variable in
    pattern1)
      statements
      break        # select in 只有遇到 break 或文件结束符才会退出循环
      ;;
    pattern2)
      statements
      break
      ;;
    pattern3)
      statements
      break
      ;;
    *)
      echo "输入错误，请重新输入。"
  esac
done
```

> 可以修改环境变量 `PS3` 来自定义输入提示符

### break，continue

```bash
break n
continue n
```

其中 n 表示作用的循环的层数（从内向外）。

### 函数

语法：

```bash
# 定义
function func() { # function 关键字可以省略。如果写了 function 关键字，那么 () 可以省略
  statements
  [return value]
}

# 调用
func [param1] [param2] [...] # 函数名后面不带括号
```

> Shell 不限制定义和调用的顺序。

#### 函数返回值

Shell 中的函数返回值是一个介于 0~255 的整数，用来表示函数的退出状态：返回值为 0 表示函数执行成功，非 0 表示函数执行失败。函数执行失败时可以根据退出状态来判断具体出现了什么错误。

> :bulb: **Tip:** 在 Shell 中不要用返回值表示函数的处理结果

如果函数体中没有 return 语句，那么函数将使用最后一条命令的退出状态作为自己的返回值。

##### 如何得到函数的处理结果

要想得到函数的处理结果，可以使用一下两种方案：

- 在函数内部使用 echo，printf 命令将结果输出，并在函数外部使用 <code>$()</code> 或 <code>` `</code> 捕获结果。（推荐）
- 将处理结果赋给全局变量

## Shell [[&nbsp;&nbsp;]] 关键字

`[[  ]]` 用来检测某个条件是否成立。

`[[  ]]` 是 Shell 内置关键字，不是命令，在使用时没有给函数传递参数的过程。因此相比 test 命令，`[[  ]]` 不需要关注某些细枝末节：

- 不需要把变量名用双引号 `""` 包围起来。即使变量是空值，也不会出错。
- 不需要对 `>`、`<` 进行转义。

语法：

```bash
[[ expression ]] # 注意 expression 两侧的空格
```

### 文件检测相关的选项

|expression|作用|
|:--|:--|
|-d file|判断 file 是否存在，并且是否为目录文件|
|-e file|判断 file 是否存在|
|-f file|判断 file 是否存在，并且是否为普通文件|
|-s file|判断 file 是否存在，并且是否非空|
|-r file|判断 file 是否存在，并且是否拥有读权限|
|-w file|判断 file 是否存在，并且是否拥有读权限|
|-x file|判断 file 是否存在，并且是否拥有执行权限|
|file1 -nt file2|判断 file1 的修改时间是否比 file2 新|
|file1 -ot file2|判断 file1 的修改时间是否比 file2 旧|

```bash
read fileName
read msg

if [ -w $fileName ] && [ -n $msg ]; then
  echo $msg >$fileName
  echo "写入成功"
else
  echo "写入失败"
fi
```

### 字符串判断相关的选项

|expression|作用|
|:--|:--|
|-z str|判断 str 是否为空|
|-n str|判断 str 是否非空|
|str1 = str2<br />str1 == str2|判断 str1 是否和 str2 相等|
|str1 > str2|判断 str1 是否大于 str2|
|str1 < str2|判断 str1 是否小于 str2|

```bash
read str1
read str2

# 检测字符串是否为空
if [[ -z $str1 || -z $str2 ]]; then # [[  ]] 支持逻辑运算符
  echo "字符串不能为空"
# 比较字符串
elif [[ $str1 < $str2 ]]; then
  echo "str1 < str2"
else
  echo "str1 >= str2"
fi
```

### [[&nbsp;&nbsp;]] 支持正则表达式

可以使用 `=~` 来检测字符串是否符合某个正则表达式：

```bash
# 检测一个字符串是否是手机号
read tel
if [[ $tel =~ ^1[0-9]{10}$ ]]; then
  echo "你输入了一个手机号"
else
  echo "你输入的不是手机号"
fi
```

更多 test 选项请参见 [C 语言中文网](http://c.biancheng.net/view/2742.html)

## echo 输出彩色字符

```bash
echo -e "\033[背景色;前景色m输出文字"

echo -e "\e[31m输出文字" # 只指定前景色，输出红色字符
echo -e "\e[41m输出文字" # 只指定背景色，输出红底白字
echo -e "\e[0m输出文字"  # 使用默认配色

# 样例
echo -e "\e[31mHello, World\e[0m" # 红色 Hello, World
# 注意，在 -e 选项的 echo 命令中，输出语句如果含有感叹号 !，则感叹号的后面只能是空白符或语句结束的双引号。否则 ! 会被解析成事件提示符
echo -e "文字"'!'"文字" # 解决 echo -e 输出 ! 的问题

# 设置颜色变量
GREEN="\e[32m"
RES="\e[0m"

echo -e "${GREEN}Hello, World$RES"

# 设置颜色动作
PRT_GREEN="echo -e \e[32m"

${SET_GREEN}"message"$RES
```

| 背景色 | 前景色 | 颜色 |
| :----: | :----: | :--: |
|   40   |   30   | 黑色 |
|   41   |   31   | 红色 |
|   42   |   32   | 绿色 |
|   43   |   43   | 黄色 |
|   44   |   44   | 蓝色 |

> `\033[背景色;前景色m` 是转义序列，其中 `\033[` 是转义起始符，`m` 是转义终止符。
>
> `\033` 对应 ASCII 码表的 Esc，可以用 `\e` 或 `\E` 代替。
>
> 背景色和前景色没有先后顺序。适应我们惯常的思维顺序，一般先确定背景色，再确定前景色。

![](http://c.biancheng.net/uploads/allimg/180926/3-1P926164539348.jpg)

[C 语言中文网：echo 命令：显示文字并给文字添加颜色](http://c.biancheng.net/linux/echo.html)

### 事件提示符 !

```bash
!100 # 执行第 100 条命令
!-1 # 执行倒数第一条命令
!! # !-1 的 alias

!abc # 引用最近的以 abc 开头的命令。可以在运行一条命令之后忘记这个命令的参数时使用
!?abc # 引用最近的包含 abc 的命令

# 间接取值
$ a="Hello"
$ b="a"
$ echo ${!b}
Hello
```

> 在 Shell 中，使用 ⬆️ 和 ⬇️ 也可以快速切换上一条、下一条命令
>
> ! 和 ⬆️ ⬇️ 只会引用成功执行的命令

### sh -c 的必要性

```bash
$ sudo echo "151.101.76.133 raw.githubusercontent.com" >> /etc/hosts
bash: /etc/hosts: 权限不够
```

bash 拒绝这么做，说是权限不够。这是因为重定向符号 `>` 和 `>>` 也是 bash 的命令。我们使用 sudo 只是让 echo 命令具有了 root 权限，但是没有让 `>` 和 `>>` 命令也具有 root 权限，所以 bash 会认为这两个命令都没有像 hosts 文件写入信息的权限。

利用 `sh -c` 命令，它可以让 bash 将一个字符串作为完整的命令来执行，这样就可以将 sudo 的影响范围扩展到整条命令。

## 常用命令

```bash
open <dir/file>     # 在访达中打开 dir 目录
start <dir/file>    # cmd 中的 open
explorer <dir>      # 在资源管理器中打开 dir 目录
nautilus <dit>      # ubuntu 中的 open

clear # 清屏
cls   # cmd 清屏

ls -a # 查看当前目录所有文件（包括隐藏文件）

mv <file> <dir>    # 将 file 移动到 dir
mv <name1> <name2> # 重命名

rm <file> # 删除文件
rm -rf    # 强制递归删除
rmdir     # 删除目录
del       # DOS 删除命令

cat <file>    # 查看文件内容
cat -n <file> # 显示行号
type <file>   # cmd 中的 cat

head -n 5 <file> # 显示 file 前 5 行内容
tail -n 5 <file> # 显示 file 后 5 行内容

touch <file> # 创建文件

echo -e # 使用转义字符
echo -n # 关闭自动换行

read VAR # 从终端读取用户输入，并赋值给 VAR 变量
         # 按下 Ctrl + D 表示读取到文件流的末尾

gedit [file] # 在 Linux 打开文本编辑器
```

### Linux 多命令顺序执行连接符

|  符号  | 作用                                                                                                                                                                 |
| :----: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|  `;`   | 没有任何逻辑关系的连接符。当多个命令用分号连接时，各命令之间的执行成功与否彼此没有任何影响，都会一条一条执行下去。                                                   |
| `\|\|` | 逻辑或，当用此连接符连接多个命令时，前面的命令执行成功，则后面的命令不会执行。前面的命令执行失败，后面的命令才会执行。                                               |
|  `&&`  | 逻辑与，当用此连接符连接多个命令时，前面的命令执行成功，才会执行后面的命令，前面的命令执行失败，后面的命令不会执行                                                   |
|  `\|`  | 管道符，当用此连接符连接多个命令时，前面命令执行的正确输出，会交给后面的命令继续处理。若前面的命令执行失败，则会报错，若后面的命令无法处理前面命令的输出，也会报错。 |

## vim

```bash
vi <file> # 用 vim 打开或创建一个文件
```

按下 <kbd>i</kbd> 进入输入模式

输入完成后，按下 <kbd>ESC</kbd> 回到命令模式

输入 `:` 进入底线命令模式并输入 `wq` 保存并退出

## Visual Studio Code

在 Visual Studio Code 中按下 <kbd>Ctrl</kbd> + <kbd>`</kbd> 打开 Terminal

```bash
code . # 用 Visual Studio Code 打开该文件夹
```
