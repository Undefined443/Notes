# Git

`clear` 清屏

`rm <file>` 删除文件

## 安装与配置 Git

[Git 详细安装教程](https://blog.csdn.net/mukes/article/details/115693833)

### 自报家门

```shell
$ git config --global user.name "xiao"
$ git config --global user.email "iphone4s2008@icloud.com"
```

### 创建版本库 Repository

1. 创建并进入一个空目录

```shell
$ mkdir Demo
$ cd Demo
$ pwd
```

*`pwd` 命令用于显示当前目录*

2. 通过 git init 命令将当前目录变成仓库

```shell
$ git init
```

### 把文件添加到版本库

1. 使用 `git add <file>` 命令更新待提交文件列表
2. 使用 `git commit -m <message>` 命令提交改动

```shell
$ git add readme.md 
$ git commit -m "added a readme file"
```

*`git` 命令必须在仓库内执行*

*使用 `ls -ah` 命令查看当前目录文件（包括隐藏文件）*

*使用 `git add .* 命令添加所有文件

> Git 只能管理文本文件，不能管理二进制文件

> 不要使用 Windows 自带的记事本编辑文本文件

## 时光机穿梭

运行 `git status` 命令查看当前仓库状态

运行 `git diff <file>` 命令查看文件的改动情况

*`git diff HEAD -- <file>`：命令查看工作区版本和版本库最新版本的区别*

### 版本回退

#### 提交日志

运行 `git log` 命令显示从最近到最久的提交日志

运行 `--pretty=oneline` 参数显示简化的提交日志

*输出中一大串的东西是 commit id (版本号)，这是一个 SHA1 计算出来的十六进制数字*

**每提交一个新版本，Git 就会把它们自动串成一条时间线**

#### 回退

在 Git 中，用 `HEAD` 表示当前版本，上一个版本是 `HEAD^`，上上个版本是 `HEAD^^`，或者写成 `HEAD~2`

使用 `git reset --hard commit_id` 命令：

```shell
$ git reset --hard HEAD^
```

`cat <file>` 查看文件内容

`cat -n <file>` 显示行号

#### 反悔

1. 使用 `git reflog` 命令显示参考日志（命令日志）
2. 找到要恢复的版本的 commit id，再次使用 `git reset --hard commit_id` 命令

```shell
$ git reflog
e849d38 (HEAD -> master) HEAD@{0}: reset: moving to HEAD^
188d795 HEAD@{1}: commit: appended a new line
e849d38 (HEAD -> master) HEAD@{2}: commit: modified self-introduction
1a0ec02 HEAD@{3}: commit (initial): added a self-introduction

$ git reset --hard 188d
# commit_id 不用输全，只要通过前几位能确定版本就行
HEAD is now at 188d795 appended a new line
```

#### 工作区与暂存区

工作区就是我们在电脑里能看到的目录

工作区有一个隐藏目录 `.git`，是 Git 的版本库

![pic](https://www.liaoxuefeng.com/files/attachments/919020037470528/0)

`git add` 命令的作用就是将文件修改添加到暂存区

`git commit` 命令的作用就是把暂存区的所有修改提交到当前分支

一旦提交后，并且对工作区没有任何修改，那么工作区就是 "clean" 的。

> Git 管理的是修改，而不是文件。

#### 撤销修改

运行 `git reset HEAD <file>` 命令撤销暂存区的修改，重新放回工作区。

运行 `git checkout -- <file>` 命令丢弃工作区的修改。file 将回退到版本库的最新版本（包括暂存区的版本）。

#### 删除文件

运行 `git rm <file>` 命令从工作区中删除 file 并将修改提交到暂存区

> 1. 先手动删除文件，然后运行 `git rm <file>` 和 `git add <file>` 效果是一样的
> 2. 删除也是一种修改操作

## 远程仓库

### 添加远程库

#### 创建 SSH Key

打开 Shell (Windows 下打开 Git Bash)，创建 SSH Key：

```shell
$ ssh-keygen -t rsa -C "iphone4s2008@icloud.com"
```

接下来一路回车，以默认值创建 SSH Key。此时可以在用户主目录里找到 `.ssh` 目录，里面有 `id_rsa` 和 `id_rsa.pub` 两个文件，这两个就是 SSH Key 的密钥对，`id_rsa` 是私钥，不能泄露，`id_rsa.pub` 是公钥，可以告诉他人。

登录 GitHub，点击头像，打开 Settings->SSH and GPG keys，点击 New SSH key，填写任意 Title，在 Key 中粘贴 `id_rsa.pub` 文件的内容，完成添加。

> SSH 用于实现安全远程登陆
>
> Git 也支持 HTTPS 协议，但相比 SSH 速度慢，且每次推送都必须输入口令。

#### 创建远程库

在 GitHub 上新建一个库。

复制 `…or push an existing repository from the command line` 下的代码

```shell
git remote add origin git@github.com:Straining5/Projects.git
# 修改当前分支的名字为 main
git branch -M main
# 将本地库的所有内容推送到远程库
git push -u origin main
```

*添加后，远程库的名字就是 origin，这是 Git 默认的叫法，也可以改成别的，但是 origin 这个名字一看就知道是远程库。*

> 当我们第一次使用 Git 的 `push` 或者 `clone` 命令连接 GitHub 时，会得到一个警告，该警告要求我们确认 GitHub 的 Key 的指纹信息确实来自 GitHub 的服务器。我们只需输入 yes 回车即可。

*把本地库的内容推送到远程，用 `git push` 命令，实际上是把当前分支 master 推送到远程。*

*由于远程库是空的，我们第一次推送 master 分支时，加上了 `-u` 参数。Git 不但会把本地的 master 分支内容推送到远程的 master 分支，还会把本地的 master 分支和远程的 master 分支关联起来，在以后的推送或者拉取时就可以简化命令。*

此时可以看到 GitHub 中的远程库已经和本地同步。

从现在起，只要本地作了提交，就可以通过命令 `git push origin master` 把本地库的 master 分支的最新修改推送至 GitHub。现在我们就有了真正的分布式版本库。

#### 删除远程库

可以先用 `git remote -v` 命令查看远程库的详细信息。

> 详细信息中 fetch 表示可以抓取的地址，push 表示可以推送的地址。

然后运行 `git remote rm <name>` 命令删除远程库。

> 此处的删除只是解除本地库和远程库的绑定关系

### 从远程库克隆

在 GitHub 上新建库，拷贝 SSH Key，或者在已有的库的 `<> Code` 区的绿色按钮 Code 中拷贝 SSH Key，然后运行命令：

```shell
#同样，这里需要替换 SSH Key
$ git clone git@github.com:Straining5/github-slideshow.git
```

Git 将把远程库拷贝到当前目录。注意，在当前目录下不能有 `.git` 文件。

## 分支管理

查看分支：`git branch`

创建分支：`git branch <name>`

切换分支：`git checkout <name>` 或者 `git switch <name>`

创建并切换分支：`git checkout -b <name>` 或 `git switch -c <name>`

合并到当前分支：`git merge <name>`

删除分支：`git branch -d <name>`

删除一个尚未被合并的分支：`git branch -D <name>`

### 解决冲突

当两个分支平行前进时，无法执行 Fast-forward 合并。此时运行合并命令后，Git 会在发生冲突的文件里标记出不同分支的内容。我们手动修改文件后，提交修改，此时两个分支成功合并。

可以用 `git log --graph --pretty=oneline --abbrev-commit` 命令查看分支的合并情况。

### 分支管理策略

合并分支时，Git 会优先采用 Fast forward 模式，即把当前分支直接指向合并的分支：

![pic](https://static.liaoxuefeng.com/files/attachments/919022412005504/0)

在这种模式下，删除分支后，在分支历史上看不到分支信息。

我们可以通过命令 `git merge no-ff -m <message> <name>` 命令来禁用 Fast forward 模式进行合并：

![pic](https://static.liaoxuefeng.com/files/attachments/919023225142304/0)

此时 Git 会在 merge 时生成一个新的 commit。这样，从分支历史上就可以看出分支信息。

> 因为禁用 Fast forward 模式合并时要生成一个新的 commit，因此在 `git merge no-ff` 命令中还要加上 `-m` 参数写入描述信息。

#### 分支策略

在实际开发中，master 分支（主分支）用来发布新版本。dev 分支是所有人干活的地方。每个人在 dev 分支上再创建自己的分支，完成自己的工作。

![pic](https://static.liaoxuefeng.com/files/attachments/919023260793600/0)

### Bug 分支

运行 `git stash` 命令将当前工作现场在当前分支上暂存起来。这时，我们就可以切换到其它分支而不必担心当前分支未 commit 的部分会被覆盖。

可以使用 `git stash list` 命令查看暂存的工作现场。

运行 `git stash pop` 命令恢复工作现场并删除 stash。或者是使用 `git stash apply <name>` 恢复，再用 `git stash drop` 删除。

我们通过一个 commit 修复主分支的 Bug 后，想要把修改的内容同样 commit 到 dev 分支上。此时可通过 `git cherry-pick <name>` 命令复制该 commit 到当前分支。cherry-pick 就好像是把其他分支的几个结点摘取到当前分支。

### 多人协作

#### 推送分支

运行 `git push <remote_repo> <branch>` 命令将 branch 分支推送到远程库。

#### 抓取分支

当我们从远程库 clone 时，默认情况下，我们只能看到本地的 master 分支。如果我们要在其他分支上开发，需要使用命令 `git branck -c dev origin/dev` 或 `git checkout -b dev origin/dev` 创建远程 origin 的 dev 分支到本地。

现在我们可以在 dev 上继续修改，然后通过命令 `git push <remote_repo> <branch>` 将 dev 分支推送到远程。

如果有人和你同时在 dev 分支上做了修改并且他的修改已经提交，那么此时无法继续推送，需要先用 `git pull` 命令把最新的提交从 origin/dev 上抓取下来，然后在本地合并，然后才能提交。

#### Rebase

我们和别人同时对同一分支做出修改，提交，然后 push。这时后 push 的那个人需要先从远程库抓取最新的提交，在本地合并，然后再 push。但是这样就会在分支历史上留下两个分支合并的记录，会变得比较乱。我们可以在

rebase 就是把当前分支摘下来，放到目标分支上。

> 注意，一开始远程的 origin/dev 分支与本地的 dev 分支是没有链接的。需要使用 `git branch --set-upstream-to=<origin/branch> <branch>` 命令创建 dev 和 origin/dev 的链接。

> 参考 [廖雪峰：Git 教程](https://www.liaoxuefeng.com/wiki/896043488029600)
>
> [Git 简明指南](http://rogerdudler.github.io/git-guide/index.zh.html)
