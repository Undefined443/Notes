# Shell Tools

## tar

### 归档

#### 创建一个未压缩的 tar 归档文件

```sh
tar -cvf archive.tar file1 file2 dir1
```

其中，`-c` 表示创建归档文件，`-v` 表示显示详细信息，`-f` 表示指定归档文件名。

#### 创建一个使用 gzip 压缩的 tar 归档文件

```sh
tar -czvf archive.tar.gz file1 file2 dir1
```

其中，`-z` 表示使用 gzip 压缩。

#### 创建一个使用 bzip2 压缩的 tar 归档文件

```sh
tar -cjvf archive.tar.bz2 file1 file2 dir1
```

其中，`-j` 表示使用 bzip2 压缩。

### 提取

#### 提取未压缩的 tar 归档文件

```sh
tar -xvf archive.tar
```

其中，`-x` 表示提取归档文件。

#### 提取使用 gzip 压缩的 tar 归档文件

```sh
tar -xzvf archive.tar.gz
```

其中，`-z` 表示使用 gzip 压缩。

#### 提取使用 bzip2 压缩的 tar 归档文件

```sh
tar -xjvf archive.tar.bz2
```

其中，`-j` 表示使用 bzip2 压缩。

#### 提取使用 xz 压缩的 tar 归档文件

```sh
tar -xJvf archive.tar.xz
```

> 也可以使用 `-a` 选项让 tar 自动检测压缩格式

### unzip

使用 `unzip` 解压 zip 文件

```sh
unzip xxx.zip
```

### Q&A

Q: 为什么 Windows 上常见的压缩文件格式为 zip、winrar、7z，而 Linux 上常见的压缩文件格式为 gzip？

A: 这些不同的压缩文件格式在 Windows 和 Linux 系统中流行的原因主要与操作系统的历史、使用场景和开发者社区的偏好有关。

在 Windows 中，ZIP、RAR 和 7z 是最常见的压缩文件格式：

1. ZIP：ZIP 文件格式在 1990 年代中期被创建，它具有较好的压缩率和速度。由于其简单的结构和易于实现，ZIP 格式得到了广泛的支持。此外，自 Windows XP 开始，Windows 系统已内置了对 ZIP 格式的支持，使得用户无需安装其他软件即可解压缩 ZIP 文件。
2. RAR：RAR 格式是 WinRAR 软件的原生文件格式，它在压缩率和功能上优于 ZIP。WinRAR 是一个功能强大的压缩工具，逐渐在 Windows 用户中流行起来。由于 RAR 格式的专有性，只有 WinRAR 和一些兼容软件可以创建和解压缩 RAR 文件。
3. 7z：7z 是 7-Zip 软件的原生压缩格式，它提供了比 ZIP 和 RAR 更高的压缩率。7-Zip 是一款开源软件，因此可以免费使用。7z 格式在开发者和高级用户中受欢迎，但由于其较高的系统资源需求，在普通用户中的普及程度相对较低。

在 Linux 系统中，gzip 是最常见的压缩文件格式：

1. gzip：gzip（GNU zip）是一种广泛使用的压缩工具，特别是在 Unix 和类 Unix 系统（如 Linux）中。gzip 文件格式在 1990 年代初期被创建，与 Linux 的诞生时间相近。gzip 只压缩单个文件，而不是整个目录结构。为了压缩整个目录，通常会先用 tar 命令将目录打包成一个文件，然后再用 gzip 压缩该文件，得到一个 .tar.gz 文件。因为 gzip 和 Linux 同为开源软件，两者之间的兼容性很好，所以 gzip 在 Linux 社区中得到了广泛的支持。

2. 尽管这些压缩格式在不同的操作系统中更常见，但它们在多数情况下仍可以在其他操作系统中使用。例如，可以在 Linux 系统中使用 p7zip 软件来解压缩 7z 文件，或在 Windows 系统中使用 7-Zip 软件来解压缩 gzip 文件。

Q: 为什么很少在 Linux 系统中见到 zip、rar、7z 文件？gz 文件相对它们有什么优势吗？

A: 在 Linux 系统中，ZIP、RAR 和 7z 文件相对较少见，主要原因是 Linux 社区和开发者更倾向于使用开源和免费的工具，如 gzip。虽然 ZIP、RAR 和 7z 格式也可以在 Linux 系统中使用，但它们在该平台上的普及程度相对较低。以下是一些原因：

1. 开源和免费：gzip 是 GNU 项目的一部分，是一个完全开源和免费的压缩工具。Linux 社区通常倾向于使用和支持开源软件。ZIP 和 7z 格式也有开源的解压缩工具（如 Info-ZIP 和 p7zip），但它们在 Linux 社区中的使用相对较少。RAR 格式是专有的，虽然有免费的解压缩工具（如 unrar），但创建 RAR 文件需要购买 WinRAR 软件授权。
2. 与 Linux 工具链的兼容性：gzip 工具与 Linux 中的许多其他工具（如 tar、find 等）非常兼容。例如，可以使用 tar 命令将目录打包成一个文件，然后用 gzip 压缩该文件，得到一个 .tar.gz 文件。这种兼容性使得 gzip 成为 Linux 系统中的首选压缩工具。
3. 命令行友好：gzip 的命令行界面非常简洁且易于使用。这对于 Linux 用户来说很重要，因为在 Linux 系统中，命令行操作比图形界面更为常用。

gz 文件格式相对于 ZIP、RAR 和 7z 格式的优势主要在于其在 Linux 社区中的广泛支持和与其他 Linux 工具的兼容性。然而，gz 格式在压缩率上可能不如 ZIP、RAR 和 7z。此外，gz 格式只能压缩单个文件，而 ZIP、RAR 和 7z 格式则支持整个目录结构的压缩。虽然可以通过将目录打包成一个 tar 文件来解决这个问题，但这使得操作相对更加复杂。

总之，在 Linux 系统中，ZIP、RAR 和 7z 文件相对较少见，主要是因为开源、免费和与其他 Linux 工具的兼容性等因素。然而，在功能和压缩率方面，ZIP、RAR 和 7z 格式可能具有一定的优势。

## SSH

```sh
# 创建 SSH 密钥
ssh-keygen -t rsa
# 添加本地主机到 authorized_keys
cat id_rsa.pub >> ~/.ssh/authorized_keys
# 登录远程主机
ssh xiao@localhost
# 配置无密码登录
ssh-copy-id another_user@another_host

# 使用 SSH 传输文件(secure copy)
scp <file> xiao@192.168.162.132:<dir> # 使用 scp -r 递归复制整个目录

sudo service ssh restart  # Linux 的重启 SSH 服务
```

> 可以提前将常用的主机记录到 `/etc/hosts`: `192.168.162.131 hostname` 下次登录 SSH 时可以使用主机名代替 IP 地址
>
> `scp` 只能识别以正斜杠分隔的路径，即便是在 Windows 上也是如此：`/Users/xiao/.ssh/authorized_keys` 相当于 `C:\Users\xiao\.ssh\authorized_keys`

`ssh-copy-id` 的替代命令：

```sh
cat ~/.ssh/id_rsa.pub | ssh USER@HOST "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

`ssh-copy-id` 内部会执行一些 *nix shell 命令，因此只能用于 *nix 机器。

下面是替代 `ssh-copy-id` 的等效命令：

将 Windows 的公钥拷贝到 *nix 服务器：

```powershell
Get-Content $env:USERPROFILE\.ssh\id_rsa.pub | ssh <user>@<hostname> "cat >> .ssh/authorized_keys"
```

将 *nix 的公钥拷贝到 Windows

```sh
scp ~/.ssh/id_rsa.pub USER@HOST:.ssh/authorized_keys  # SSH 登录后自动进入用户主目录
```

[ask Ubuntu: How do I add SSH Keys to authorized_keys file?](https://askubuntu.com/questions/46424/how-do-i-add-ssh-keys-to-authorized-keys-file)

### SSH 免密登录 Windows

#### 方法一

Windows 上的 OpenSSH 默认将管理员用户组的 `AuthorizedKeysFile` 统一设置为`__ProgramData__/ssh/administrators_authorized_keys`。这样如果你登录的用户属于管理员组，那么将读取 `C:\ProgramData\ssh\administors_authorized_keys` 文件而不是 `~\.ssh\authorized_keys` 文件来验证你的私钥。

因此需要把自己的公钥拷贝到 `C:\ProgramData\ssh\administors_authorized_keys` 文件中：

```sh
scp ~/.ssh/id_rsa.pub USER@HOST:/ProgramData/ssh/administrators_authorized_keys
```

#### 方法二

打开 `C:\ProgramData\ssh\sshd_config`，拉到最下面，注释掉万恶的 Group administrators：

```config
#Match Group administrators
#       AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys
```

另外，你需要确保 `authorized_keys` 文件的访问控制权限包括 `Everyone` 的读权限。如果没有 `Everyone` 的权限，在 `属性 > 安全 > 编辑 > 添加 > 高级 > 立即查找` 中选中 `Everyone` ，再一路确定。

[多台 WIN 10 之间的 SSH 免密登录 - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/111812831)

### 更改 SSH 登录 Windows 的默认 Shell

通过 SSH 连接到 Windows 时默认登录的 Shell 是 Windows Command shell，可以通过下面的命令将默认 Shell 改为 PowerShell：

```powershell
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" -PropertyType String -Force
# 可以使用 Remove-ItemProperty 删除这个属性
```

这种方法登录的是 PowerShell 5。如果将 Value 改为 PowerShell 7 的话在连接时会出错误提示：

```output
Access is denied.
Connection to localhost closed.
```

[适用于 Windows 的 OpenSSH 服务器配置 | Microsoft Learn](https://learn.microsoft.com/zh-cn/windows-server/administration/openssh/openssh_server_configuration#configuring-the-default-shell-for-openssh-in-windows)

[通过 SSH 进行 PowerShell 远程处理 - PowerShell | Microsoft Learn](https://learn.microsoft.com/zh-cn/powershell/scripting/learn/remoting/ssh-remoting-in-powershell-core?view=powershell-7.3)

### authorized_keys

每个公钥独占一行

### 公钥

公钥由密钥类型 (`ssh-rsa`)、Base64 编码的密钥主题和 comment（如果有的话）组成，用空格分隔。Comment 用于帮助用户识别和管理不同的公钥，对密钥功能本身没有影响。因此可以手动删除 comment 及其前面的空格。

## nslookup

测试 DNS 服务器是否正常工作

```sh
nslookup www.baidu.com
```

## mount

```sh
fdisk -l  # 查看磁盘分区
mount /dev/sdc1 /mnt/usb  # 将 /dev/sdc1 挂载到 /mnt/usb
umount /mnt/usb  # 卸载 /mnt/usb
```

其他 `mount` 选项

```sh
mount -t vfat /dev/sdc1 /mnt/usb  # 指定文件系统类型为 vfat
mount -o iocharset=utf8 /dev/sdc1 /mnt/usb  # 指定字符集为 utf8
```

### 校验和检验

#### MacOS

##### 计算校验和

```sh
md5 <file>            # MD5
shasum -a 1 <file>    # SHA-1
shasum -a 256 <file>  # SHA-256
```

[如何在苹果Mac系统上使用MD5\SHA1\SHA256\SHA512等方式生成并验证下载文件签名](https://www.bootschool.net/article/5dda0d9af60a310558a7f070)

##### 检验校验和

校验和文件示例：

[Checksums.txt](../assets/Checksums.txt)

> 注意，在校验码和文件名之间有**两个**空格。

在开始检验前，终端先进入要检验的文件所在的目录。

```sh
shasum -a 512 -c Checksums.txt  # 使用 SHA-512 算法逐个检验 Checksums.txt 中的文件
```

#### Linux

```sh
md5sum <file>
sha1sum <file>
sha256sum <file>
```

#### Windows

```bat
CertUtil -hashfile <file> MD5
CertUtil -hashfile <file> SHA1
CertUtil -hashfile <file> SHA256
```

```ps1
Get-FileHash <file> -Algorithm MD5
```
