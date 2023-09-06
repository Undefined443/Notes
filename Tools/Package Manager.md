# Package Manager

## Homebrew

Homebrew Cask 项目：原先是独立于 Homebrew 的一个扩展，提供对以二进制形式发布的 macOS 应用的管理，但现在与 Homebrew 密切合作。

Formulae 和 Cask：Homebrew 将自己的包定义文件称为 Formulae，而 Homebrew Cask 将它们称为 Cask。Cask 和 Formulae 一样，是用基于 Ruby 的 DSL 编写的文件，描述如何安装软件。

[原讨论](https://stackoverflow.com/questions/46403937/what-is-the-difference-between-brew-install-xxx-and-brew-cask-install-xxx)

### 换源

我自己写的函数，将源切换为清华源：

```sh
# Homebrew mirror
function brew-mirror() {
    if [ "$1" = "true" ]; then
        cd "$(brew --repo)" && \
        git remote set-url origin https://mirrors.cloud.tencent.com/homebrew/brew.git && \
        cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core" && \
        git remote set-url origin https://mirrors.cloud.tencent.com/homebrew/homebrew-core.git && \
        export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles
        brew update
    else
        cd "$(brew --repo)" && \
        git remote set-url origin https://github.com/Homebrew/brew && \
        cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core" && \
        git remote set-url origin https://github.com/Homebrew/homebrew-core
        unset HOMEBREW_BOTTLE_DOMAIN
        brew update
    fi
}
```

[腾讯镜像源: Homebrew 镜像使用帮助](https://mirrors.cloud.tencent.com/help/homebrew.html)

[腾讯镜像源: Homebrew-bottles 镜像使用帮助](https://mirrors.cloud.tencent.com/help/homebrew-bottles.html)

### tap

`tap` 是 Homebrew 的一个扩展机制，可以让用户添加第三方仓库，从而安装第三方仓库中的软件。

```sh
brew install --cask temurin  # temurin 是目前最好的 Java 发行版
```

> zulu 也很不错，我选择 zulu

`brew tap`：用于添加第三方仓库，如 `brew tap homebrew/cask`。第三方仓库的名字为 homebrew/homebrew-cask，可以在 GitHub 上找到。

```sh
brew tap  # 查看已添加的仓库
brew tap owner/repo  # 添加仓库 owner/homebrew-repo
brew untap owner/repo  # 删除仓库
```

```sh
brew tap homebrew/cask
brew tap homebrew/cask-versions  # cask-versions 仓库提供了一些旧版本的软件
```

也可以不 tap 仓库直接使用仓库中的 Cask:

```sh
brew install owner/repo/package
```

example:

```sh
brew install --cask temurin17  # Eclipse Temurin 是 Adoptium OpenJDK 发行版的名称

brew install --cask zulu17  # Zulu 是 Azul Systems 公司的 OpenJDK 发行版。Zulu 是少数为 macOS/AArch64 架构提供 Java 8 支持的发行版之一

/usr/libexec/java_home -V  # 查看所有 Java 版本的 JAVA_HOME
```

```sh
brew install
brew uninstall|remove|rm
brew list           # *显示已安装软件列表
brew upgrade        #  更新 Homebrew
brew search         # *搜索软件
brew info           # *显示软件详细信息
brew help [COMMAND] #  显示命令帮助
man brew            #  显示帮助手册
```

## scoop

[Official Website](https://scoop.sh)

[GitHub: ScoopInstaller/Scoop](https://github.com/ScoopInstaller/Scoop)

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex
```

```powershell
scoop bucket add extras
scoop install pasteboard

scoop bucket add nerd-fonts
scoop install sudo
sudo scoop install -g Cascadia-Code

scoop bucket add versions
scoop install python27

scoop bucket add java
scoop install zulu8-jdk
```

### Troubleshooting

#### Couldn't find manifest for ...

```powershell
scoop bucket list  # 查看已添加的 bucket
scoop buckwt add main  # 如果没有 main 的话，将 main 添加到 bucket
```

### Update-Help 失败

```powershell
Update-Help -UICulture en-US
```

[CSDN: 解决 powershell 7.1 的 Get-Help 找不到对应的详细帮助](https://blog.csdn.net/weixin_43590796/article/details/11015922)

```powershell
winget install
winget uninstall
winget list
winget upgrade
winget search
winget show         # 显示软件详细信息
```

[Microsoft Docs: winget](https://docs.microsoft.com/zh-cn/windows/package-manager/winget/)

## apt

### 换源

#### 更换阿里源

```sh
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak  # 备份原始文件
sudo sed -i -r 's/([a-z]{2}\.)?archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
sudo sed -i -r 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
sudo apt update
```

#### EOL 发行版换源为 old-releases.ubuntu.com 源

```sh
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak  # 备份原始文件
sudo sed -i -r 's/([a-z]{2}\.)?archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
sudo sed -i -r 's/security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
sudo apt-get update
```

[apt-get 出现 Err 404 Not Found 的解决办法](https://www.cocobolo.top/linux/2019/04/26/apt-get%E5%87%BA%E7%8E%B0Err-404-Not-Found%E7%9A%84%E8%A7%A3%E5%86%B3%E5%8A%9E%E6%B3%95.html)

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

`whereis <bin>`: 查找已安装的二进制包的位置
