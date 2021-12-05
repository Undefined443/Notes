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
