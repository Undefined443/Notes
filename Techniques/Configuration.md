# Configuration

## Windows

参考资料：

[在 Windows 上设置开发环境](https://docs.microsoft.com/zh-cn/windows/dev-environment/)

[Windows 终端](https://docs.microsoft.com/zh-cn/windows/terminal/)

[winget](https://docs.microsoft.com/zh-cn/windows/package-manager/winget/)

### Windows Subsystem for Linux

在 PowerShell (管理员) 中输入命令：

```ps
wsl --install # 默认会安装 Ubuntu

# 如果没有自动安装，则使用以下命令：
wsl --install -d Ubuntu
# 若要查看其他可用的发行版：
wsl -l -o
# 列出已安装的发行版：
wsl -l -v
```

> 第一次输入命令后可能会提示："由于需要重启系统，因此没有进行任何操作。" 这时只需重启系统并重新输入命令即可。

[知乎：Windows 安装 Linux 子系统](https://zhuanlan.zhihu.com/p/394365997)

### PowerShell 7

1. 进入官网，安装 MSI 包。

[在 Windows 上安装 PowerShell](https://docs.microsoft.com/zh-cn/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2#msi>)

2. 配置 PowerShell 7

[使用 Oh My Posh 为 PowerShell 设置自定义提示符](https://docs.microsoft.com/zh-cn/windows/terminal/tutorials/custom-prompt-setup)

<del>

[知乎：Windows Terminal 完美配置](https://zhuanlan.zhihu.com/p/137595941)

> 安装字体：下载字体压缩包并解压，选中所有字体，在右键菜单中选择 “为所有用户安装”
>
> 配置 Windows Terminal：打开 Windows Terminal，在标题栏的下拉菜单中选择设置，在左边菜单中选择 “打开 JSON 文件”。
>
> 不要看知乎里的代码，看他给的 GitHub 链接里的，直接拷贝过去。

</del>

### 安装 Windows/Linux 双系统

Windows Boot Manager 不会显示 Ubuntu 选项，因此需要在 BIOS 的 `Boot` 选项下找到 `UEFI Hard Disk Drive BBS Priorities`，将 `Boot Option #1` 设置为 `ubuntu`。

### SSH

[安装 OpenSSH](https://docs.microsoft.com/zh-cn/windows-server/administration/openssh/openssh_install_firstuse#start-and-configure-openssh-server)

1. 搜索 “可选功能” 。
2. 添加可选功能 > 搜索 “SSH” ，并安装所有出现的选项。
3. 在管理员身份下打开 PowerShell，输入 MS Docs 中 “启动并配置 OpenSSH 服务器” 部分给出的命令。
4. 接下来便可以使用 `ssh username@address` 命令来连接到此计算机。

> 照理说应该是可以使用微软账户的用户名和密码来登录，并且在我的笔记本上确实可以。然而在 PC 上却不行，最后我使用了 设置 > 账户 > 家庭和其他用户 下的一个其他用户才登陆成功。

![](../assets/登陆SSH时使用的用户.png)

## MacOS

安装 VS Code 后配置环境变量：<kbd>⌘</kbd> + <kbd>⇧</kbd> + <kbd>P</kbd> 打开 Command Palette，输入 `Shell Command` ，选择 `Install 'code' command in PATH` 。

## Ubuntu

[snap](https://cn.ubuntu.com/blog/what-is-snap-application)

### deb 安装包

```sh
sudo cp file.deb /tmp # 先将 .deb 文件移到 /tmp 文件夹，避免出现 “无法被用户'_apt'访问” 问题
sudo apt install /tmp/file.deb
rm /tmp/file.deb
```

### Clash for Linux

在 [GitHub](https://github.com/Dreamacro/clash/releases) 下载 clash-linux-amd64 最新版本

右键解压或 `gunzip clash-linux-amd64-v1.5.0.gz`

```sh
mv clash-linux-amd64 clash # 重命名
mkdir ~/.config/clash && mv clash ~/.config/clash # 将 clash 放到 ~/.config/clash 目录下
cd ~/.config/clash
wget -O config.yaml https://subscribe.a9b.top/link/zAy6rZxfKYqigGsv?clash=1 # 获取订阅文件
echo 'PATH=$PATH:$HOME/.config/clash' >> ~/.bashrc # 添加到 PATH
source ~/.bashrc
chmod +x clash # 添加执行权限
clash
```

查看 config.yaml 前 6 行内容 `head -n 6 config.yaml`，根据 port，socks-port 设置系统网络代理(127.0.0.1 7890, 7891)

![](../assets/网络代理.png)

#### 通过网页设置 Clash

http://clash.razord.top/#/proxies

> :bulb: **Tip:** 在设置代理后必须打开 clash 才能上网，否则必须禁用代理。

### 终端代理

终端默认是不走代理的，即使我们已经打开了网络代理客户端的 “全局代理”。

> 用 curl 或 wget 下载 GitHub 上的文件时出现的 443 错误就是没有挂代理导致的。

#### 使用环境变量

很多 Linux 和 Unix 命令行工具（比如 curl，wget，lynx 等）使用名为 `http_proxy`，`https_proxy`，`ftp_proxy` 的环境变量来获取代理信息。它允许你通过代理服务器来连接那些基于文本的会话和应用。

wget: World Wide Web Get

curl: Client URL

> HTTP，HTTPS，FTP 是三个最常见的 TCP/IP 协议。

```sh
export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890  # 对于 https 的内容，只会使用 https 代理。
export all_proxy=socks5://127.0.0.1:7891

# 使用用户名和密码的代理，在 proxyAddres 前加上 user:password@
export http_proxy=http://user:password@proxyAddress:port
```

#### 使用命令选项

```sh
# 通过代理服务器访问 url
wget -e http_proxy=127.0.0.1:7890 <url> # 如果是 https 内容，需要使用 https_proxy

curl -x 127.0.0.1:7890 <url>
curl -x socks5://127.0.0.1:7891 <url>
```

> 使用 `protocol://` 的格式指定协议。若不指定，则默认值为 `http://`
>
> 端口默认为 1080

#### 设置配置文件

在 ~/.curlrc 中添加：

```
proxy = 127.0.0.1
proxy-user = "user:passward"
```

如果临时不需要代理使用以下参数

```sh
curl --noproxy "*" url
```

#### 设置 Linux 全局代理动作

```bash
alias set_proxy="export http_proxy='http://127.0.0.1:7890'; export https_proxy=$http_proxy; export all_proxy='socks5://127.0.0.1:7891'; echo 'Proxy on'"
alias unset_proxy="unset http_proxy; unset https_proxy; unset all_proxy; echo 'Proxy off'"
```

### ScreenShot

<kbd>Alt</kbd> + <kbd>Print Screen</kbd>：截取活动窗口

<kbd>Shift</kbd> + <kbd>Print Screen</kbd>：手动截取窗口

### 安装 Terminator

```sh
sudo add-apt-repository ppa:gnome-terminator
sudo apt update
sudo apt install terminator
```

### 安装 Oh My Zsh

```sh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# 自动补全，启用后终端可能会变卡
git clone git://github.com/makeitjoe/incr.zsh $ZSH_CUSTOM/plugins/incr

# autojump，使用 z 命令必须要这个
sudo apt install autojump -y

# syntax hightlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

进入 `~/.zshrc`，将 plugins 改为：

```
plugins=(git extract z zsh-autosuggestions zsh-syntax-highlighting)
```

extract 用法：`x <file>` 自动解压文件

z 会记录你曾经进入过的目录，用模糊匹配快速进入想要的目录 `z <dir>`

[简书：Ubuntu | 安装 oh-my-zsh](https://www.jianshu.com/p/ba782b57ae96)

## 安装字体

### MacOS

在官网下载字体压缩包，双击打开安装即可。

[GitHub: Menlo-for-Powerline](https://github.com/abertsch/Menlo-for-Powerline)

### Ubuntu

将字体压缩包解压到 `~/.local/share/fonts` 为当前用户安装，或者 `/usr/share/fonts` 为系统安装，然后运行 `fc-cache -f -v`

> 可以使用 `fc-list | grep <font name>` 检查字体是否安装成功，使用 `fc-list :lang=zh` 检查中文字体。

### 在终端中使用 Menlo for Powerline 字体

#### Ubuntu

在配置文件首选项下选中一个配置文件，选中 ”使用自定义字体“，在下拉菜单中选择 Menlo for Powerline 。

![配置字体](../assets/配置字体.png)

#### MacOS

终端 -> 偏好设置（<kbd>⌘</kbd> + <kbd>,</kbd>）

![](../assets/字体设置%20MacOS.png)

![](../assets/字体设置%20MacOS(1).png)

#### 在 Visual Studio Code 中使用 Menlo for Powerline 字体

在 settings.json 中加入 `"terminal.integrated.fontFamily": "Menlo for Powerline"`，或搜索 `Terminal: font` 设置，在 Font Family 栏下填入：`'Menlo for Powerline'` 。

### Could not get lock 问题

[CSDN: Could not get lock /var/lib/dpkg/lock-frontend](https://blog.csdn.net/lun55423/article/details/108907779)

### npm 代理问题

设置 npm 代理：

```sh
npm config set proxy=http://127.0.0.1:7890
npm config set registry=http://registry.npmjs.org
```

### apt

|     apt 命令     | 功能                           |
| :--------------: | :----------------------------- |
|   apt install    | 安装软件包                     |
|    apt remove    | 移除软件包                     |
|    apt purge     | 移除软件包及配置文件           |
|    apt update    | 刷新存储库索引                 |
|   apt upgrade    | 升级所有可升级的软件包         |
|  apt autoremove  | 自动删除不需要的包             |
| apt full-upgrade | 在升级软件包时自动处理依赖关系 |
|    apt search    | 搜索应用程序                   |
|     apt show     | 显示安装细节                   |


### chmod

u 表示该文件的拥有者，g 表示该文件的拥有者所属的组，o 表示其他人，a 表示所有人。

|  数字   | 权限  |
| :-----: | :---: |
| 4 (100) |  读   |
| 2 (010) |  写   |
| 1 (001) | 执行  |

![](https://www.runoob.com/wp-content/uploads/2014/08/rwx-standard-unix-permission-bits.png)

e.g.

```bash
# 数字表示法
chmod 777 file # 为所有用户开放 file 的全部权限
chmod 744 file # 只有拥有者有全部权限，其他人只读。

# 字母表示法
chmod o+w file # 为其他人增加写权限
chmod a+x file # 为所有人增加执行权限
chmod a-x file # 为所有人移除执行权限
chmod u=rwx,g=rx,o=r file
chmod u=rwx,og=rx file
```

#### 查看文件权限

```bash
$ ls -l
total 16
drwxr-xr-x  13 p6  staff  416  4  8 11:00 Courses
drwxr-xr-x  10 p6  staff  320  4  8 15:37 Notes
-rw-rw-rw-@  2 p6  staff   28  4  8 15:41 file.txt
-rw-rw-rw-@  2 p6  staff   28  4  8 15:41 fileLink.txt
lrwxr-xr-x   1 p6  staff    8  4  8 15:42 fileSoftLink -> file.txt
```

> 访问目录必须拥有执行权限

[`ls -l` 输出内容详解](https://www.cnblogs.com/justmine/p/9053419.html)

[Linux 文件权限查看及修改](https://www.cnblogs.com/cb0327/p/6189586.html)

[CSDN：「复制、拷贝、替身、软连接、硬连接」区别详解](https://blog.csdn.net/woodpeck/article/details/78761219)

### 校验和检验

#### MacOS

##### 计算校验和

```sh
md5 <file>           # MD5
shasum -a 1 <file>   # SHA-1
shasum -a 256 <file> # SHA-256
```

[如何在苹果Mac系统上使用MD5\SHA1\SHA256\SHA512等方式生成并验证下载文件签名](https://www.bootschool.net/article/5dda0d9af60a310558a7f070)

##### 检验校验和

校验和文件示例：

[Checksums.txt](../assets/Checksums.txt)

> 注意，在校验码和文件名之间有**两个**空格。

在开始检验前，终端先进入要检验的文件所在的目录。

```sh
shasum -a 512 -c Checksums.txt # 使用 SHA-512 算法逐个检验 Checksums.txt 中的文件
```

#### Linux

```sh
md5sum <file>
sha1sum <file>
sha256sum <file>
```

#### Windows

```bat
CertUtil -hashfile <file> MD5
CertUtil -hashfile <file> SHA1
CertUtil -hashfile <file> SHA256
```

```ps1
Get-FileHash <file> -Algorithm MD5
```

#checksum

## 包管理器

### MacOS

```sh
brew install
brew uninstall|remove|rm
brew list           # 显示已安装软件列表
brew upgrade        # 更新 Homebrew
brew search         # 搜索软件
brew info           # 显示软件详细信息
brew help [COMMAND] # 显示命令帮助
man brew            # 显示帮助手册
```

### Windows

```ps1
winget install
winget uninstall
winget list
winget upgrade
winget search
winget show         # 显示软件详细信息
```

[winget](https://docs.microsoft.com/zh-cn/windows/package-manager/winget/)