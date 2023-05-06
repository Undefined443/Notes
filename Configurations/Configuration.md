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

1. 安装 PowerShell

```powershell
winget search Microsoft.PowerShell
winget install --id Microsoft.Powershell --source winget
```

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

#### 命令行安装

在管理员模式下运行以下命令：

```powershell
# 检查 OpenSSH 可用性
Get-WindowsCapability -Online | Where-Object Name -like 'OpenSSH*'

# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Start the sshd service
Start-Service sshd

# OPTIONAL but recommended:
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
    Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
    New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
} else {
    Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
}
```

也可以使用如下命令启动 OpenSSH（在管理员模式下运行）：

```batch
net start sshd
```

[MS Docs: 安装 OpenSSH](https://docs.microsoft.com/zh-cn/windows-server/administration/openssh/openssh_install_firstuse#start-and-configure-openssh-server)

#### GUI 安装

1. 搜索 “可选功能” 。
2. 添加可选功能 > 搜索 “SSH” ，并安装所有出现的选项。
3. 在管理员身份下打开 PowerShell，输入 MS Docs 中 “启动并配置 OpenSSH 服务器” 部分给出的命令。
4. 接下来便可以使用 `ssh username@address` 命令来连接到此计算机。

> 照理说应该是可以使用微软账户的用户名和密码来登录，并且在我的笔记本上确实可以。然而在 PC 上却不行，最后我使用了 设置 > 账户 > 家庭和其他用户 下的一个其他用户才登陆成功。
>
> 2023.4.11 补充：可能还是用户名填错了，用 `whoami` 看下。命令输出为 `domain\username`。[whoami](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/whoami)

用户名就是 Windows 命令行里显示的用户名，密码是 Microsoft 帐户密码。

![](../assets/登陆SSH时使用的用户.png)

[[Shell Tools]]

[远程登录 VMware 虚拟机](https://cloud.tencent.com/developer/article/1679861)

## MacOS

安装 VS Code 后配置环境变量：<kbd>⌘</kbd> + <kbd>⇧</kbd> + <kbd>P</kbd> 打开 Command Palette，输入 `Shell Command` ，选择 `Install 'code' command in PATH` 。

## Ubuntu

[snap](https://cn.ubuntu.com/blog/what-is-snap-application)

```sh
snap install code --classic
```

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

# 自动补全，启用后终端可能会变慢，不建议使用
git clone git://github.com/makeitjoe/incr.zsh $ZSH_CUSTOM/plugins/incr

# syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Using Homebrew
brew install zsh-syntax-highlighting

# zsh-suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Using Homebrew
brew install zsh-autosuggestions
```

进入 `~/.zshrc`，将 plugins 改为：

```sh
plugins=(git extract z zsh-autosuggestions zsh-syntax-highlighting)  # 用 Homebrew 安装的插件不需要添加，跟着安装提示操作
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

### Ubuntu 22.04 安装 libwebkitgtk-1.0-0

在 Ubuntu 上安装完 PDI 后总是提示安装这个插件，然后因为在 Ubuntu 22.04 的 apt 中没有包含此插件的源，因此要新添加一个源，然后这个源还要再添加什么 key 验证。

#### 添加新源

```sh
sudo vim /etc/apt/sources.list
```

Add this entry to the file and save:

```
deb http://cz.archive.ubuntu.com/ubuntu bionic main universe
```

添加 key

```sh
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32


sudo apt-get update
```

[Chris Jean: Fix apt-get update “the following signatures couldn’t be verified because the public key is not available”](https://community.hitachivantara.com/discussion/libwebkitgtk-10-0-on-ubuntu-2204-lts)

[Pentaho Community: LIBWEBKITGTK-1.0-0 ON UBUNTU 22.04 LTS](https://chrisjean.com/fix-apt-get-update-the-following-signatures-couldnt-be-verified-because-the-public-key-is-not-available/)

## 软件安装

### MacOS 安装 Kettle

[关于在 M1 Mac 上安装部署 PDI (kettle)](https://blog.csdn.net/ColeMEI/article/details/118616719)

[Pentaho 9.3 支持 Java 11](https://help.hitachivantara.com/Documentation/Pentaho/9.3/What's_new_in_Pentaho_9.3)

> 截至 2022.10.13，Pentaho 9.3 仍不支持 AArch64 架构，必须在 x86_64 模式的终端中运行，并且依赖 **x86_64** 的 Java 11 运行环境。

### Apple Silicon Mac 安装 Intel Homebrew

1. 配置 Rosetta Shell（见 [How To Run Legacy Command Line Apps On Apple Silicon](https://indiespark.top/software/run-command-line-apple-silicon/)）
2. 在 Rosetta Shell 中运行 Homebrew 安装命令
