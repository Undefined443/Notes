# Shell

## 执行 Shell 脚本

```zsh
#!/bin/bash
# 指明该脚本需要什么解释器来执行（使用哪一种 Shell）
```

### 在新进程中运行 Shell 脚本

```zsh
# 将 Shell 脚本作为程序运行
# 如果不写 ./，Linux 只会到系统路径（由 PATH 环境变量指定）下查找外部命令
chmod +x ./script.sh # 给脚本添加执行权限
./script.sh          # 运行脚本

# 将 Shell 脚本作为参数传递给 Bash 解释器
bash script.sh # 这种方式将忽略脚本文件第一行的指定解释器信息
```

### 在当前进程中运行 Shell 脚本

```zsh
source script.sh
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

> PATH使用冒号 : 分隔不同的路径

[PS1 和 PS2 中的特殊字符](http://c.biancheng.net/view/vip_3279.html)

## 变量

在 Bash shell 中，每一个变量的值都是字符串。在默认情况下，Bash shell 不会区分变量类型。当然，如果有必要，也可以使用 `Shell declare` 关键字显式定义变量的类型。

```zsh
# 定义变量
variable=value # 如果要赋的值不包含任何空白符，那么可以不使用引号
variable='value' # '' 相当于原生字符串，将不解析内容中的变量、命令
variable="value"

readonly variable # 将变量定义为只读变量
unset variable # 删除变量。unset 命令不能删除只读变量

# 使用变量
author="李潇"
echo $author
echo "作者是${author}。" #用花括号指明变量名的边界

# 命令替换：将命令的结果赋给变量
var=`cat log.txt` # 多个命令之间以分号 ; 分隔
var=$(cat log.txt) # 推荐
Fir_File_Lines=$(wc -l $(ls | sed -n '1p')) # 两层嵌套
# 注意，如果被替换的命令的输出内容有换行符，或者含有多个连续的空白符，那么在输出变量时应该将变量用双引号包围，否则系统会使用默认的空白符来填充。
echo "$var"
```

> 修改变量的值时不能在变量名前加 `$`，只有在使用变量时才能加 `$`。
>
> `=` 的周围不能有空格

### 变量的作用域

#### 局部变量

```zsh
function func() {
  local a=99 # 若不使用 local，则 a 是全局变量
}
```

#### 全局变量

在当前 Shell 进程中有效。在 Shell 中定义的变量默认就是全局变量。

#### 环境变量

在所有的子进程中有效。

```zsh
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

```zsh
#!/bin/bash

echo "Language: $1"
echo "Name: $2"
```

```zsh
$ source script.sh Shell LiXiao
Language: Shell
Name: LiXiao
```

### 给函数传递位置参数

script.sh:

```zsh
#!/bin/bash

function func() {
  echo "Language: $1"
  echo "Name: $2"
}

func C++ LiXiao
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

```zsh
# 获取字符串长度
echo ${#string}

# 字符串拼接
str1="a"
str2="b"
str3=$str1$str2"c" # 只需将字符串放在一起就能拼接
```

[Shell 字符串截取](http://c.biancheng.net/view/1120.html)

## 数组

```zsh
# 数组没有长度限制
nums=(1 2 3) # 定义一个数组
nums=(1 2 3 "abc") # 数组没有类型限制
nums=([3]=24 [5]=19 [10]=12) # 可以只给特定元素赋值
nums[20]=88
```

## 常用命令

```zsh
open <dir/file>     # 在访达中打开 dir 目录
start <dir/file>    # cmd 中的 open
explorer <dir>      # 在资源管理器中打开 dir 目录

clear # 清屏
cls   # cmd 清屏

ls -ah # 查看当前目录所有文件（包括隐藏文件）

mv <file> <dir> # 将 file 移动到 dir

rm <file> # 删除文件
rm -rf    # 删除当前目录，并且不询问

vi # 使用 vim 编辑文件

q # 退出

cat <file> # 查看文件内容
cat -n <file> # 显示行号

touch <file> # 创建文件

echo "message" > <file> # 以覆写的方式将消息写入文件
echo "message" >> <file> # 以追加的方式写入文件

read VAR # 从终端读取用户输入，并赋值给 VAR 变量

echo $VAR # 使用 VAR 变量。可以通过 ${VAR} 指明变量名的边界

# 输入输出重定向
< file # 输入重定向
> file # 输出重定向
```

## vim

```zsh
vi <file> # 用 vim 打开或创建一个文件
```

按下 <kbd>i</kbd> 进入输入模式

输入完成后，按下 <kbd>ESC</kbd> 回到命令模式

输入 `:` 进入底线命令模式并输入 `wq` 保存并退出

## Visual Studio Code

在 Visual Studio Code 中按下 <kbd>Ctrl</kbd> + <kbd>`</kbd> 打开 Terminal

```zsh
code . # 用 Visual Studio Code 打开该文件夹
```
