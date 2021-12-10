#!/bin/bash
GREEN="echo -e \\e[32m"
RES='\e[0m'

export http_proxy=127.0.0.1:7890
export https_proxy=$http_proxy

# 基本组件
sudo apt update # 更新可用软件包列表
${GREEN}"开启 autoremove"$RES
sudo apt autoremove -y
${GREEN}"重新安装 vim"$RES
sudo apt remove vim-common -y
sudo apt install vim -y
${GREEN}"安装 git"$RES
sudo apt install git -y
${GREEN}"安装 cmake"$RES
sudo apt install cmake -y
${GREEN}"安装 g++"$RES
sudo apt install g++ -y
${GREEN}"安装 LLVM"$RES
sudo apt install llvm -y
${GREEN}"安装 LLDB"$RES
sudo apt install lldb -y
${GREEN}"安装 Clang"$RES
sudo apt install clang -y
${GREEN}"安装 curl"$RES
sudo apt install curl -y
${GREEN}"安装 zsh"$RES
sudo apt install zsh -y

# oh my zsh
${GREEN}"安装 oh my zsh"$RES
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Gitee 镜像
# sh -c "$(wget -O- https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"

# 自动补全
${GREEN}"安装自动补全"$RES
mkdir ~/.oh-my-zsh/plugins/incr
cd ~/.oh-my-zsh/plugins/incr
wget https://mimosa-pudica.net/src/incr-0.2.zsh
echo 'source ~/.oh-my-zsh/plugins/incr/incr*.zsh' >> ~/.zshrc

# auto jump
${GREEN}"安装 autojump"$RES
sudo apt install autojump -y
echo 'source /usr/share/autojump/autojump.sh' >> ~/.zshrc

# syntax hightlighting
${GREEN}"安装 zsh-syntax-highlighting"$RES
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# auto suggestions
${GREEN}"安装 zsh-autosuggestions"$RES
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

${GREEN}"创建 SSH Key"$RES
ssh-keygen -t rsa -C "iPhone4s2008@iCloud.com"
git config --global user.name "李潇"
git config --global user.email "iPhone4s2008@iCloud.com"
${GREEN}"将公钥添加到 GitHub："$RES
cat ~/.ssh/id_rsa.pub
echo "Press any key to continue . . ."
read -n 1
echo
${GREEN}"请将下面内容加入 plugins"$RES
echo "plugins=(git extract z zsh-autosuggestions zsh-syntax-highlighting autojump)"
echo "Press any key to continue . . ."
read -n 1
echo
gedit ~/.zshrc
