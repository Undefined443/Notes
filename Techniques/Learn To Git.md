# Git

## 安装与配置 Git

[Git 详细安装教程](https://blog.csdn.net/mukes/article/details/115693833)

### 自报家门

```shell
git config --global user.name "xiao"
git config --global user.email "iphone4s2008@icloud.com"
```

### 创建版本库 Repository

1. 创建并进入一个空目录

```shell
mkdir Demo
cd Demo
pwd # 显示当前目录
git init # 将当前目录设置成仓库

# 可以更改默认主分支名：
git config --global init.defaultBranch <name>
# 或者更改当前分支名：
git branch -m <name>
```

### 把文件添加到版本库

```shell
# 更新待提交文件列表
git add <file>
# 提交改动
git commit -m "added a readme file"

# 修改 HEAD 的 commit message
git commit --amend
```

*`git` 命令必须在仓库内执行*

*使用 `ls -ah` 命令查看当前目录文件（包括隐藏文件）*

*使用 `git add .* 命令添加所有文件

> 1. Git 只能管理文本文件，不能管理二进制文件
> 2. 不要使用 Windows 自带的记事本编辑文本文件

## 时光机穿梭

`git status`：查看当前仓库状态

`git diff <file>`：查看文件的改动情况

`git diff HEAD -- <file>`：查看工作区版本和版本库最新版本的区别

### 版本回退

#### 提交日志

`git log`：显示从最近到最久的提交日志

添加 `--pretty=oneline` 参数显示简化的提交日志

*输出中一大串的东西是 commit id (版本号)，这是一个 SHA1 计算出来的十六进制数字*

**每提交一个新版本，Git 就会把它们自动串成一条时间线**

#### reset

将当前分支回退到指定状态，之后的日志记录被删除（但是 commit-id）依然存在。

`HEAD^`：HEAD 的上一个结点

`HEAD^^`或 `HEAD~2`：HEAD 的上上个结点

```shell
git reset --hard HEAD^
```

reset 的三种模式：

![图片](https://upload-images.jianshu.io/upload_images/4428238-fcad08ebe26933a6.png)

--hard：直接将工作区置为目标结点的状态，丢弃所有未提交的修改

--soft：被回退的修改保留到暂存区，可以再次提交

--mixed（默认）：被回退的修改保留到工作区，可以再次提交

##### 操作符 \^ 与 \~

当某结点有两个父结点时，HEAD^ 指向第一个父结点，而 HEAD^2 指向第二个父结点。

这些操作符支持链式操作：`HEAD~^2~2`

#### 取消 reset

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

#### revert

可以理解为对某次提交进行反向修改，如果要回退已经上传到版本库的提交，则只能用这个命令。

#### 工作区与暂存区

工作区就是我们在电脑里能看到的目录

工作区有一个隐藏目录 `.git`，是 Git 的版本库

![pic](https://www.liaoxuefeng.com/files/attachments/919020037470528/0)

`git add` 命令的作用就是将文件修改添加到暂存区

`git commit` 命令的作用就是把暂存区的所有修改提交到当前分支

一旦提交后，并且对工作区没有任何修改，那么工作区就是 "clean" 的。

> Git 管理的是修改，而不是文件。

#### 撤销修改

```shell
git reset HEAD <file> # 撤销暂存区的修改，重新放回工作区。
git checkout -- <file> # 将工作区恢复到版本库或暂存区的最新版本

# 在 Git 2.23 版本开始引入了 git restore
git restore --staged <file> # 将文件修改从暂存区撤回
```

#### 删除文件

```shell
git rm <file> # 从工作区中删除 file 并将修改提交到暂存区
```

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

> 公钥相当于锁，私钥相当于钥匙，如果版本库上有你的锁，那么你就可以用钥匙打开版本库。

登录 GitHub，点击头像，打开 Settings->SSH and GPG keys，点击 New SSH key，填写任意 Title，在 Key 中粘贴 `id_rsa.pub` 文件的内容，完成添加。

> SSH 用于实现安全远程登陆
>
> Git 也支持 HTTPS 协议，但相比 SSH 速度慢，且每次推送都必须输入口令。

#### 创建远程库

在 GitHub 上新建一个库。

复制 `…or push an existing repository from the command line` 下的命令：

```shell
git remote add origin git@github.com:Straining5/Projects.git
# 修改当前分支的名字为 main
git branch -M main
# 将 main 的所有内容推送到远程库
git push -u origin main
```

*添加后，远程库的名字就是 origin，这是 Git 默认的叫法，也可以改成别的，但是 origin 这个名字一看就知道是远程库。*

> 当我们第一次使用 Git 的 `push` 或者 `clone` 命令连接 GitHub 时，会得到一个警告，该警告要求我们确认 GitHub 的 Key 的指纹信息确实来自 GitHub 的服务器。我们只需输入 yes 回车即可。

*由于远程库是空的，我们第一次推送 main 分支时，加上了 `-u` 参数。Git 不但会把本地的 main 分支内容推送到远程的 main 分支，还会把本地的 main 分支和远程的 main 分支关联起来，在以后的推送或者拉取时就可以简化命令。*

此时可以看到 GitHub 中的远程库已经和本地同步。

从现在起，只要本地作了提交，就可以通过命令 `git push origin main` 把本地库的 main 分支的最新修改推送至 GitHub。现在我们就有了真正的分布式版本库。

#### 删除远程库

可以先用 `git remote -v` 命令查看远程库的详细信息。

> 详细信息中 fetch 表示可以抓取的地址，push 表示可以推送的地址。

然后运行 `git remote rm <name>` 命令删除远程库。

> 此处的删除只是解除本地库和远程库的绑定关系

### 从远程库克隆

在 GitHub 库的 `<> Code` 区的绿色按钮 Code 中拷贝 SSH Key，然后运行命令：

```shell
#同样，这里需要替换 SSH Key
$ git clone git@github.com:Straining5/github-slideshow.git
```

Git 将把远程库拷贝到当前目录。注意，当前目录下不能有 `.git` 文件。

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

### stash

```shell
git stash # 将当前工作现场在当前分支上暂存起来

git stash list # 查看暂存的工作现场

git stash pop # 命令恢复工作现场并删除 stash
# 等价于下面两条命令
git stash apply <name> # 恢复
git stash drop <name> # 删除
```

### cherry-pick

```shell
git cherry-pick <node> # 摘取一个或几个提交到 HEAD
```

### push

```shell
git push <remote_repo> <branch> # 将本地的 branch 推送到远程库的 branch
git push <remote_repo> <source>:<destination> # 将 source 指向的位置推送到 destination。source 可以是分支，也可以是结点。如果 destination 不存在，则会自动创建一个
```

> 远程分支 origin/branch 也是存储在本地的，它记录了上次和远程库通信时远程库的状态
>
> 如果不提供参数的话，Git 会将 HEAD 推送到 HEAD 跟踪的分支（如果 HEAD 指向的是一个没有跟踪任何分支的分支或某个结点的话 push 会失败）
>
> 如果不提供 source 的话，git 会删除远程库的 destination

### fetch

```shell
git fetch # 将远程库所有更新下载到本地
git fetch <remote_repo> <branch> # 将远程仓库上的 branch 下载到本地的 <remote_repo>/<branch>

# 和 git push 一样，git fetch 也可以使用这样的命令：
git fetch <remote_repo> <source>:<destination> # 将远程的 source 下载到本地的 destination（当前不能在 destination 上工作）
# 但是很少有人这样用
```

> 如果不提供 source，git 会在本地创建一个新分支

### pull

`git pull` 相当于两个命令：

```shell
git fetch
git merge <remote_name>/<branch_name>
```

pull 的参数和 fetch 是一样的。

`git pull origin main` 等价于：

```shell
git fetch origin main
git merge origin/main # 注意如果你当前不在 main 分支上，pull 会把当前分支和 main 合并。
```

> 不要忘记 pull 里面还带一个 merge 操作

`git pull --rebase`：以 rebase 的方式进行合并

### 分离的 HEAD

一般 HEAD 都是指向某个分支，并随分支一起移动。但当我们 checkout 到某个具体的 commit 时，这种绑定状态被解除，成为分离头指针状态。在这种情况下，我们可以对文件进行修改并提交，但在我们 checkout 到其他地方之前，必须创建一个新的分支来保留做的修改。

### tag

```shell
git tag # 查看所有标签
git tag "tag_name" # 为 HEAD 创建一个标签
git tag "tag_name" <node> # 为 node 创建一个标签
git tag -a "tag_name" -m "message" <node> # 为 node 创建带说明的标签
git show <tag_name> # 查看标签信息
```

标签相当于一个锚点，可以用它来为一些里程碑式的修改进行标记。

###  describe

```shell
$ git describe <ref> # ref 可以是任何能被 Git 识别成提交记录的引用，缺省值为 HEAD
<tag>_<numCommits>_g<hash> #tag 是离 ref 最近的标签，numCommits 是 tag 与 ref 相差的提交数，hash 是 ref 的哈希值的前几位
```

如果 ref 本身就有一个标签，则只输出该标签名。

### 关联分支

```shell
# 创建一个跟踪远程分支的本地分支
git checkout -b <local_branch> <remote_repo>/<tracked_branch>
git branch -c <local_branch> <remote_repo>/<remote/branch>

git branch -u <remote_repo>/<remote_branch> <local_branch> # 设置 local_branch 同步 remote_branch。也可以省略 local_branch 以将当前分支与 remote_branch 同步。

git branch --set-upstream-to=<remote_repo>/<remote_branch> <local_branch> # 创建 local_branch 和 remote_repo/remote_branch 的链接。
```

### rebase

```shell
git rebase <destination> # 把当前分支摘下来，放到 destination 上。
```

rebase 是从当前分支与 destination 所在分支分离的地方开始，把属于当前分支的那一段挪到 destination 下面

### pull request

当远程分支被锁定时，不允许你直接 push 修改到远程分支。你应该 新建一个分支，推送这个分支并申请 pull request。

```shell
git branch -f main c6 # 将 main 分支强制指向 c6
git rebase -i c2      # 将当前分支以 c2 为根，重新整理中间的结点
```

> 参考 [廖雪峰：Git 教程](https://www.liaoxuefeng.com/wiki/896043488029600)

> [Git 简明指南](http://rogerdudler.github.io/git-guide/index.zh.html)
>
> [图形化 git 学习网站](https://learngitbranching.js.org/?locale=zh_CN)
>
> [php 中文网：git 常用命令大全](https://www.php.cn/tool/git/469391.html)