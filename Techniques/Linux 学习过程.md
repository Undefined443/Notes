### 安装 Windows Linux 双系统后开机直接进入 Windows

解决方法：在 BIOS 的 Boot 选项下找到 UEFI Hard Disk Drive BBS Priorities，将 Boot Option #1 设置为 ubuntu。

### CLion

在官网下载 CLion

解压 `tar -zxvf CLion-2021.2.3.tar.gz`

运行 cLion.sh 脚本

``bash
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

解压出来的文件放哪都行

获取订阅文件

```bash
wget -O config.yaml [订阅地址]
```

目录下会多出来 config.yaml 和一个文件名乱七八糟的东西。把乱七八糟重命名为 config.yaml，然后放到 ~/.config/clash 目录下。

查看 config.yaml 前 6 行内容 `head -n 6 config.yaml`，根据 port，socks-port 设置系统网络代理

![](../assets/网络代理.png)

启动 clash

```bash
# 在 clash 所在目录下执行
mv clash-linux-amd64 clash # 重命名
dir=`pwd`
dir=${dir#$HOME/}
echo 'PATH=$PATH:$HOME'/$dir >> ~/.bashrc # 添加到 PATH
bash # 开启新进程以刷新 PATH
chmod +x clash
clash -d . # 设置配置
```

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
chsh# 更改默认 shell
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh # 安装 oh-my-zsh
# zsh 插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting # 代码高亮
sudo apt install autojump # 自动跳转
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions # 命令补全
timedatectl set-local-rtc 1 --adjust-system-clock # 解决时钟问题
```
