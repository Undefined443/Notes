# Shell

## 以 root 账户登录 Shell

```bash
sudo su
```

sudo: superuser do

## 执行 Shell 脚本

```bash
#!/bin/bash
# 指明该脚本需要什么解释器来执行（使用哪一种 Shell）
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
. script.sh # source 命令的简化写法
```

## 配置脚本

Shell 有多个配置文件。对普通用户来说，~/.bashrc 是最重要的文件，因为不管是否登陆都会加载该文件。

[Shell 配置文件（配置脚本）的加载](http://c.biancheng.net/view/vip_3232.html)

实例

    # 给 PATH 变量增加新的路径
    PATH=$PATH:$HOME/addon # 将主目录下的 addon 目录也设置为系统路径
    # 修改命令提示符的格式
    PS1="[c.biancheng.net]\$"

> PATH 使用冒号 : 分隔不同的路径

[PS1 和 PS2 中的特殊字符](http://c.biancheng.net/view/vip_3279.html)

## 变量

在 Bash shell 中，每一个变量的值都是字符串。在默认情况下，Bash shell 不会区分变量类型。当然，如果有必要，也可以使用 `Shell declare` 关键字显式定义变量的类型。

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
echo "作者是${author}。" #用花括号指明变量名的边界

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

在当前 Shell 进程中有效。在 Shell 中定义的变量默认就是全局变量。

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

| 变量 | 含义                               |
| :--: | ---------------------------------- |
| `$0` | 当前脚本的文件名                   |
| `$n` | 传递给脚本或函数的参数             |
| `$#` | 传递给脚本或函数的参数个数         |
| `$*` | 传递给脚本或函数的所有参数         |
| `$@` | 传递给脚本或函数的所有参数         |
| `$?` | 上个命令的退出状态，或函数的返回值 |
| `$$` | 当前 Shell 进程 ID                 |

> 当 `$*` 和 `$@` 被双引号 `""` 包含时，会有如下区别：
>
> `"$*"` 会将所有的参数从整体上看做一份数据，而不是把每个参数都看做一份数据。
>
> `"$@"` 仍然将每个参数都看作一份数据，彼此之间是独立的。
>
> 命令的退出状态由 `exit` 命令返回，函数的返回值由 `return` 返回

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

```bash
# 数组没有长度限制
nums=(1 2 3) # 定义一个数组
nums=(1 2 3 "abc") # 数组没有类型限制
nums=([3]=24 [5]=19 [10]=12) # 可以只给特定元素赋值
nums[20]=88
```

### echo 输出彩色字符

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

mv <file> <dir> # 将 file 移动到 dir
mv <name1> <name2> # 重命名

rm <file> # 删除文件
rm -rf    # 删除当前目录，并且不询问

vi # 使用 vim 编辑文件

q # 退出

cat <file>    # 查看文件内容
cat -n <file> # 显示行号
type <file>   # cmd 中的 cat

head -n 5 <file> # 显示 file 前 5 行内容
tail -n 5 <file> # 显示 file 后 5 行内容

touch <file> # 创建文件

echo -e # 使用转义字符
echo -n # 关闭自动换行

echo "message" > <file> # 以覆写的方式将消息写入文件
echo "message" >> <file> # 以追加的方式写入文件

read VAR # 从终端读取用户输入，并赋值给 VAR 变量

echo $VAR # 使用 VAR 变量。可以通过 ${VAR} 指明变量名的边界

# 输入输出重定向
< file # 输入重定向
> file # 输出重定向

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
