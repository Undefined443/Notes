# PowerShell

## Practice

### 常用命令

```powershell
vim $PROFILE  # 编辑配置文件
Get-ChildItem *> $null  # 抛弃所有输出
whoami
Remove-Item -Recurse -Force <dir>  # rm -rf
Start-Process <dir>  # macOS 中的 open，alias start
Get-Help <string> -Online
Get-Command <string>  # sh 中的 which
Get-Command pwsh | Select-Object Source  # 只输出 Get-Command 返回对象的 Source 属性；Select-Object 也可以用 select 代替
Get-Service sshd
Start-Service sshd
Update-Help -UICulture en-US  # 更新 PowerShell 帮助文档
```

> `Get-Content` 命令也可以显示变量值：`Get-Content Env:PATH`

### 常用环境变量

```powershell
$Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="http://127.0.0.1:7890"  # 设置环境变量
$Env:http_proxy="";$Env:https_proxy=""  # 清除环境变量
$Env:Path -split ';' | sls python  # 查看环境变量并筛选 python
$Env:Path += ';C:\Tools'
$Env:USERNAME
```

配置文件位置：`$PROFILE`

[about_Profiles](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.3)

[about_PowerShell_Config](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_powershell_config?view=powershell-7.3)

[about_Environment_Variables](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables)

关于脚本：[about_Scripts](https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_scripts?view=powershell-7.3)

### 安装 PowerShell 7

```powershell
winget search Microsoft.PowerShell
winget install --id Microsoft.Powershell --source winget
```

### Oh My Posh

[Oh My Posh](https://ohmyposh.dev/)

install:

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

> Oh My Posh 更新很快，有时会被杀毒软件误报，可以考虑将可执行文件路径 `(Get-Command oh-my-posh).Source` 加入杀毒软件的白名单。

update:

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

fonts:

```powershell
oh-my-posh font install  # 在管理员权限下运行
```

> 官方推荐 `MesloLGM NF` 字体

Oh My Posh 的主题文件夹位置保存在环境变量 `$Env:POSH_THEMES_PATH` 中。可以通过命令 `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"` 查看。

## PowerShell 101

[PowerShell 101](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/00-introduction/)

[PowerShell 101 中文版](https://learn.microsoft.com/zh-cn/powershell/scripting/learn/ps101/00-introduction/)

<details>
<summary>什么是 101 课程</summary>
我们常说的 "101课程"，通常是指 XXXX 的入门级课程。在美国，数字 "101" 是大学课程中普遍使用的介绍性课程编号，是对某一个主题的综览课程。

因为许多教程的第一章或者导论部分都会用 "101" 做标注，这个词汇渐渐的就被引申了出来，用来表示基础入门级课程，变成了一个代号，也就是基础课程的同义词。

[博客园: 什么是 101 课程](https://www.cnblogs.com/HelloCpp/archive/2010/04/20/1716107.html)
</details>

[管理当前位置](https://learn.microsoft.com/zh-cn/powershell/scripting/samples/managing-current-location/)

[变量](https://learn.microsoft.com/zh-cn/powershell/scripting/lang-spec/chapter-05/)

### 变量

变量名以 `$` 开始，不区分大小写：

```powershell
$a = 1
$b = 2
$result = $a * $b
$result  # 输出变量
```

#### 自动变量

| 变量名 | 描述 |
| :---: | :--- |
| `$?` | 上一个命令的退出状态，如果上一个命令执行成功，则 `$?` 的值为 `True`，否则为 `False` |
| `$args` | 传递给脚本的参数，是一个数组 |
| `$HOME` | 用户主目录 |
| `$PWD` | 当前工作目录 |

[易百教程：PowerShell 自动变量](https://www.yiibai.com/powershell/powershell-automatic-variables.html)

### 字符串

```powershell
$s1 = '$a * $b = $result'  # 字符串中的变量不会被解析
$s2 = "$a * $b = $result"  # 字符串中的变量会被解析
$s3 = "line1`nline2"  # PowerShell 使用 ` 作为转义符
$s4 = $(Get-Date)  # 命令替换
```

### PowerShell cmdlets

PowerShell 命令被称作 `cmdlet` (发音 command-let)，每个cmdlet 的名字由一个动词-名词对组成，例如 `Get-Process`。当你要查找一个 cmdlet 时，可以指定筛选 `cmdlet` 的动词或者名词。

> `cmdlet` 是原生 PowerShell 命令
> PowerShell 命令不区分大小写

### The Help System

The Three Core Cmdlets in PowerShell:

```powershell
Get-Command
Get-Help
Get-Member
```

#### Get-Help

```powershell
help *process*  # help process
help Get-Help -Full
help Get-Help -Online
help Get-Help -Parameter Name
help Get-Help -Examples

Update-Help
```

> 函数 `help` 的使用体验要比 cmdlet `Get-Help` 更好，`help` 一次只显示一页内容，使用空格键翻页。

#### Get-Command

`Get-Command` is designed to help you locate commands.

```powershell
Get-Command -Verb Get
Get-Command -Noun Process
Get-Command -Name Get-Process

Get-Command -Name *service* -CommandType Cmdlet, Function, Alias  # 使用通配符搜索时最好限制一下命令类型
# 更好的做法是指定 Verb 或 Noun 或同时指定

Get-Command | Get-Random | Get-Help -Full  # Learn a PowerShell command a day
```

[Microsoft Docs: PowerShell 101](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started/)

## Reference

### Command Syntax

方括号表示可选项

尖括号是内容占位符，表示参数的 .NET 类型

类型后面的 `[]` 表示该参数可以接受多个值，用逗号分隔：

```powershell
Get-Process [-Name] <string[]>

Get-Process -Name Explorer, Winlogon, Services
```

花括号表示枚举，表示参数的可选值：

```powershell
-Option {None | ReadOnly | Constant | Private | AllScope}

-Option ReadOnly
```

[Microsoft Docs: about_Command_Syntax](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_command_syntax/)

#### About Parameter

[Microsoft Docs: about_Parameters](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parameters/)

参数名和参数值可以用空格分隔，也可以用冒号分隔：

```powershell
-<parameter_name> <parameter_value>
-<parameter_name>:<parameter_value>
```

使用 `Get-Help` cmdlet 获取命令参数信息：

```powershell
Get-Help Get-ChildItem

Get-Help Get-Member -Parameter *  # 获取关于 Get-Member 的所有参数的信息
```

## Appendix

### Windows Commands

[Windows Commands](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)

#### 常用命令

```batch
HELP [command]  REM man
ECHO            REM 显示消息，或将命令回显打开或关闭
CD              REM 显示当前目录的名称或将其更改
CLS             REM 清除屏幕
START           REM 启动单独的窗口以运行指定的程序或命令
SET Path        REM 显示环境变量 Path
SET var=val     REM 设置环境变量 var 的值为 val
TYPE            REM cat
COPY            REM cp
MOVE            REM mv
RENAME [drive:][path]filename1 filename2           REM 重命名文件
REPLACE [drive1:][path1]filename [drive2:][path2]  REM 替换文件
DIR       REM ls
MKDIR     REM mkdir
DEL       REM rm
RMDIR /S  REM rmdir, 递归删除
MKLINK    REM 创建符号链接和硬链接
ATTRIB    REM 显示或更改文件属性
ICACLS    REM chmod, 显示、修改、备份或还原文件和目录的 ACL
TREE [drive:][path]  REM 显示目录结构
TASKLIST  REM ps
TASKKILL  REM kill
PATH [[drive:]path[;...]][;%PATH%]  REM 将 %PATH% 包括在新的路径设置中会将旧路径附加到新设置
SHUTDOWN /s /t 30  REM 允许通过本地或远程方式正确关闭计算机
SC query sshd  REM 查询服务的状态
CMD        REM 打开另一个 Windows 命令解释程序窗口
EXIT       REM 退出 CMD.EXE 程序(命令解释程序)
```

ACL: Access Control List

[windows 命令: net 与 sc 的区别 - 简书 (jianshu.com)](https://www.jianshu.com/p/7a73cbc4b1e0)

#### 流程控制命令

```batch
FOR        REM 为一组文件中的每个文件运行一个指定的命令
IF         REM 在批处理程序中执行有条件的处理操作
LABEL      REM 创建、更改或删除磁盘的卷标
GOTO       REM 将 Windows 命令解释程序定向到批处理程序中某个带标签的行
```

#### 感兴趣的命令

```batch
ATTRIB      REM 显示或更改文件属性
CALL        REM 从另一个批处理程序调用这一个
CHCP        REM 显示或设置活动代码页，中国地区默认是 936 (GBK)，可以设置为 65001 (UTF-8)
CHKDSK      REM 检查磁盘并显示状态报告
COMP        REM 比较两个或两套文件的内容
DOSKEY      REM alias
FC          REM 比较两个文件或两个文件集并显示它们之间的不同
FIND        REM 在一个或多个文件中搜索一个文本字符串
FINDSTR     REM 在多个文件中搜索字符串
MODE        REM 配置系统设备(也可以查看代码页)
MORE        REM 逐屏显示输出
PAUSE       REM 暂停批处理文件的处理并显示消息
POPD        REM 还原通过 PUSHD 保存的当前目录的上一个值
PUSHD       REM 保存当前目录，然后对其进行更改
RECOVER     REM 从损坏的或有缺陷的磁盘中恢复可读信息
REM 记录批处理文件或 CONFIG.SYS 中的注释(批注)
ROBOCOPY    REM 复制文件和目录树的高级实用工具
SETLOCAL    REM 开始本地化批处理文件中的环境更改
SCHTASKS    REM 安排在一台计算机上运行命令和程序
SORT        REM 对输入排序
SYSTEMINFO  REM 显示计算机的特定属性和配置
XCOPY       REM 复制文件和目录树
```

#### 常用环境变量

```
%CD%  # 当前工作目录
%USERPROFILE%  # 用户主目录
%PATH%
%PATH:str1=str2%  # 环境变量替换增强
```

> `%USERPROFILE%` 包含了驱动器名，而 `%HOMEPATH%` 则不包含驱动器名

### Windows Registry

[Windows registry for advanced users - Windows Server | Microsoft Learn](https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/windows-registry-advanced-users)
