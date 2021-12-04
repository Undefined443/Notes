GREEN="echo -e \e[32m"
${GREEN}"开启 autoremove"
sudo apt autoremove -y
${GREEN}"重新安装 vim"
sudo apt-get remove vim-common -y
sudo apt-get install vim -y
${GREEN}"安装 git"
sudo apt-get install git -y
${GREEN}"创建 SSH Key"
ssh-keygen -t rsa -C "iPhone4s2008@iCloud.com"
git config --global user.name "李潇"
git config --global user.email "iPhone4s2008@iCloud.com"
${GREEN}"安装 cmake"
sudo apt-get install cmake -y
${GREEN}"安装 g++"
sudo apt install g++ -y
${GREEN}"安装 zsh"
sudo apt install zsh -y
chsh -s /bin/zsh
${GREEN}"安装 oh my zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cd ~/.oh-my-zsh/plugins
mkdir incr && cd incr
wget http://mimosa-pudica.net/src/incr-0.2.zsh
echo 'source ~/.oh-my-zsh/plugins/incr/incr*.zsh' >> ~/.zshrc
source ~/.zshrc
${GREEN}"安装 autojump"
sudo apt install autojump -y
echo 'source /usr/share/autojump/autojump.sh' >> ~/.zshrc
source ~/.zshrc
${GREEN}"安装 zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo 'source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ${ZDOTDIR:-$HOME}/.zshrc
source ~/.zshrc
${GREEN}"安装 zsh-autosuggestions"
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
echo 'source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
${GREEN}"将公钥添加到 GitHub："
cat ~/.ssh/id_rsa.pub
${GREEN}"请将下面内容加入 plugins"
${GREEN}"plugins=(git extract z zsh-autosuggestions)"
echo "Press any key to continue . . ."
read -n 1
vim ~/.zshrc
echo "是否立即重启？[Y/n]"
read ans
if [[ $ans == y || $ans == Y ]]; then
	reboot
fi