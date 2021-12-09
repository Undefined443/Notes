### 安装 Windows Linux 双系统后开机直接进入 Windows

解决方法：在 BIOS 的 Boot 选项下找到 UEFI Hard Disk Drive BBS Priorities，将 Boot Option #1 设置为 ubuntu。

### CLion

在官网下载 CLion

解压 `tar -zxvf CLion-2021.2.3.tar.gz`

运行 clion.sh 脚本

```bash
mv clion-2021.2.3 clion # 重命名
dir=`pwd`
dir=${dir#$HOME/}
echo 'PATH=$PATH:$HOME'/$dir/clion/bin >> ~/.bashrc # 添加到 PATH
bash # 开启新进程以刷新 PATH
clion.sh
```

### Clash for Linux

在 [GitHub](https://github.com/Dreamacro/clash/releases) 下载 clash-linux-amd64 最新版本

右键解压或 `gunzip clash-linux-amd64-v1.5.0.gz`

```bash
mv clash-linux-amd64 clash # 重命名
mkdir ~/.config/clash
mv clash ~/.config/clash # 将 clash 放到 ~/.config/clash 目录下
cd ~/.config/clash
wget -O config.yaml https://subscribe.a9b.top/link/zAy6rZxfKYqigGsv?clash=1 # 获取订阅文件
echo 'PATH=$PATH:$HOME'/.config/clash >> ~/.bashrc # 添加到 PATH
source ~/.bashrc
chmod +x clash # 添加执行权限
clash
```

查看 config.yaml 前 6 行内容 `head -n 6 config.yaml`，根据 port，socks-port 设置系统网络代理(127.0.0.1 7890, 7891)

![](../assets/网络代理.png)

#### 通过网页设置 Clash

http://clash.razord.top/#/proxies

*存在的问题*

在设置代理后必须打开 clash 才能上网，否则必须禁用代理

### ScreenShot

<kbd>Alt</kbd> + <kbd>Print Screen</kbd>：截取活动窗口

<kbd>Shift</kbd> + <kbd>Print Screen</kbd>：手动截取窗口

### 安装 Terminator

```bash
sudo add-apt-repository ppa:gnome-terminator
sudo apt update
sudo apt install terminator
```

### 安装 zsh

```bash
cat /etc/shells # 查看已安装 shell
sudo apt install zsh # 安装 zsh
chsh -s /bin/zsh # 更改默认 shell
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh # 安装 oh-my-zsh
# zsh 插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting # 代码高亮
sudo apt install autojump # 自动跳转
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions # 命令补全
timedatectl set-local-rtc 1 --adjust-system-clock # 解决时钟问题
```
### github.com:443

很多程序的安装脚本都在 GitHub 上，比如这条命令：

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

就是从 GitHub 上下载 install.sh 脚本，然后用 bash 去执行该脚本（`curl` 是下载命令，`sh -c "$(curl -fsSL ...)"` 是用 shell 执行 curl 下载下来的文件。然而由于墙的原因经常会出现 443 错误：

```bash
curl: (7) Failed to connect to raw.githubusercontent.com port 443: Connection refused
```

然而如果我们在直接在浏览器中访问这个网址，会发现可以正常访问。所以我们可以在本地创建一个脚本文件 install.sh，然后把网页的内容拷贝进去，然后执行脚本： `. ./install.sh`

解法二：[CSDN：curl: (7) Failed to connect to raw.githubusercontent.com port 443: Connection refused](https://blog.csdn.net/u011700186/article/details/109452684)

### curl 和 wget 使用代理

curl: Client URL

wget: World Wide Web Get

#### 使用环境变量

很多 Linux 和 Unix 命令行工具（比如 curl，wget，lynx 等）使用名为 `http_proxy`，`https_proxy`，`ftp_proxy` 的环境变量来获取代理信息。它允许你通过代理服务器来连接那些基于文本的会话和应用。

> HTTP，HTTPS，FPT 是三个最常见的 TCP/IP 协议

```bash
export http_proxy=http://127.0.0.1:7890
export https_proxy=$http_proxy # 对于 https 的内容，只会使用 https 代理

# 使用用户名和密码的代理，在 ip-addres 前加上 user:password@
export http_proxy=http://user:password@proxyAddress:port
```

#### 使用命令选项

```bash
# 通过代理服务器访问 url
wget -e http_proxy=127.0.0.1:7890 url # 如果是 https 内容，需要使用 https_proxy

curl -x 127.0.0.1:7890 url
curl -x socks5://127.0.0.1:7891 url
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

```bash
curl --noproxy "*" url
```

#### 设置 Linux 全局代理

```bash
# 设置 setproxy 和 unsetproxy 动作
# 开启代理 setproxy
# 关闭代理 unsetproxy
alias setproxy="export http_proxy=socks5://127.0.0.1:7890; export https_proxy=$http_proxy; echo 'HTTP Proxy on'"
alias unsetproxy="unset http_proxy; unset https_proxy; echo 'HTTP Proxy off'"
```

### apt

|     apt 命令     | 功能                           |
| :--------------: | :----------------------------- |
|   apt install    | 安装软件包                     |
|    apt remove    | 移除软件包                     |
|    apt purge     | 移出软件包及配置文件           |
|    apt update    | 刷新存储库索引                 |
|   apt upgrade    | 升级所有可升级的软件包         |
|  apt autoremove  | 自动删除不需要的包             |
| apt full-upgrade | 在升级软件包时自动处理依赖关系 |
|    apt search    | 搜索应用程序                   |
|     apt show     | 显示安装细节                   |
