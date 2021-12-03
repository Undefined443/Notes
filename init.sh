echo "重新安装 vim"
sudo apt-get remove vim-common
sudo apt-get install vim
echo "安装 git"
sudo apt-get install git
echo "创建 SSH Key"
ssh-keygen -t rsa -C "iPhone4s2008@iCloud.com"
echo "将公钥添加到 GitHub："
cat ~/.ssh/id_rsa.pub
git config --global user.name "李潇"
git config --global user.email "iPhone4s2008@iCloud.com"
echo "安装 cmake"
sudo apt-get install cmake
echo "安装 g++"
sudo apt install g++
echo "安装 zsh"
sudo apt install zsh
chsh -s /bin/zsh
echo "安装 oh my zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cd ~/.oh-my-zsh/plugins/
mkdir incr && cd incr
wget http://mimosa-pudica.net/src/incr-0.2.zsh
echo "source ~/.oh-my-zsh/plugins/incr/incr*.zsh" >> ~/.zshrc
source ~/.zshrc
echo "安装自动跳转"
sudo apt install autojump
echo ". /usr/share/autojump/autojump.sh" >> ~/.zshrc
source ~/.zshrc
echo "安装语法高亮"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ~/.zshrc
echo "安装语法建议"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "请将下面内容加入 plugins"
echo "plugins=(git extract z zsh-autosuggestions)"
vim ~/.zshrc
echo "是否立即重启？[y/n]"
read ans
if [[ans==y]]; then
	reboot
fi
