# Shell Tools

- [Shell Tools](#shell-tools)
  - [压缩工具](#压缩工具)
    - [tar](#tar)
      - [归档](#归档)
      - [提取](#提取)
    - [zip](#zip)
    - [Q\&A](#qa)
  - [SSH](#ssh)
    - [SSH Config 文件](#ssh-config-文件)
    - [SSH 免密登录 Windows](#ssh-免密登录-windows)
      - [方法一](#方法一)
      - [方法二](#方法二)
    - [更改 SSH 登录 Windows 的默认 Shell](#更改-ssh-登录-windows-的默认-shell)
    - [authorized\_keys](#authorized_keys)
    - [公钥](#公钥)
    - [以 root 身份登录](#以-root-身份登录)
  - [mount](#mount)
    - [校验和检验](#校验和检验)
      - [MacOS](#macos)
        - [计算校验和](#计算校验和)
        - [检验校验和](#检验校验和)
      - [Linux](#linux)
      - [Windows](#windows)
  - [GDB](#gdb)
  - [Network](#network)
    - [dig](#dig)
    - [基本用法](#基本用法)
    - [输出控制](#输出控制)
    - [其他选项](#其他选项)
    - [使用示例](#使用示例)
      - [什么是 A 记录](#什么是-a-记录)
    - [nslookup](#nslookup)
  - [NeoVim](#neovim)

## 压缩工具

### tar

#### 归档

```sh
# 创建一个未压缩的 tar 归档文件
# 其中，`-c` 表示创建归档文件，`-v` 表示显示详细信息，`-f` 表示指定归档文件名。
tar -cvf archive.tar file1 file2 dir1

# 创建一个使用 gzip 压缩的 tar 归档文件
# 其中，`-z` 表示使用 gzip 压缩。
tar -czvf archive.tar.gz file1 file2 dir1

# 创建一个使用 bzip2 压缩的 tar 归档文件
# 其中，`-j` 表示使用 bzip2 压缩。
tar -cjvf archive.tar.bz2 file1 file2 dir1
```

#### 提取

```sh
# 提取未压缩的 tar 归档文件
# 其中，`-x` 表示提取归档文件。
tar -xvf archive.tar

# 提取使用 gzip 压缩的 tar 归档文件
# 其中，`-z` 表示使用 gzip 压缩。
tar -xzvf archive.tar.gz

# 提取使用 bzip2 压缩的 tar 归档文件
# 其中，`-j` 表示使用 bzip2 压缩。
tar -xjvf archive.tar.bz2

# 提取使用 xz 压缩的 tar 归档文件
# 也可以使用 `-a` 选项让 tar 自动检测压缩格式
tar -xJvf archive.tar.xz
```

### zip

```sh
# 创建一个 zip 文件
zip -r xxx.zip file1 file2 dir1

# 解压一个 zip 文件
unzip xxx.zip
```

### Q&A

为什么 Windows 上常见的压缩文件格式为 zip、winrar、7z，而 Linux 上常见的压缩文件格式为 gzip？

> 这些不同的压缩文件格式在 Windows 和 Linux 系统中流行的原因主要与操作系统的历史、使用场景和开发者社区的偏好有关。
>
> 在 Windows 中，ZIP、RAR 和 7z 是最常见的压缩文件格式：
>
> 1. ZIP：ZIP 文件格式在 1990 年代中期被创建，它具有较好的压缩率和速度。由于其简单的结构和易于实现，ZIP 格式得到了广泛的支持。此外，自 Windows XP 开始，Windows 系统已内置了对 ZIP 格式的支持，使得用户无需安装其他软件即可解压缩 ZIP 文件。
>
> 2. RAR：RAR 格式是 WinRAR 软件的原生文件格式，它在压缩率和功能上优于 ZIP。WinRAR 是一个功能强大的压缩工具，逐渐在 Windows 用户中流行起来。由于 RAR 格式的专有性，只有 WinRAR 和一些兼容软件可以创建和解压缩 RAR 文件。
>
> 3. 7z：7z 是 7-Zip 软件的原生压缩格式，它提供了比 ZIP 和 RAR 更高的压缩率。7-Zip 是一款开源软件，因此可以免费使用。7z 格式在开发者和高级用户中受欢迎，但由于其较高的系统资源需求，在普通用户中的普及程度相对较低。
>
> 在 Linux 系统中，gzip 是最常见的压缩文件格式：
>
> 1. gzip：gzip（GNU zip）是一种广泛使用的压缩工具，特别是在 Unix 和类 Unix 系统（如 Linux）中。gzip 文件格式在 1990 年代初期被创建，与 Linux 的诞生时间相近。gzip 只压缩单个文件，而不是整个目录结构。为了压缩整个目录，通常会先用 tar 命令将目录打包成一个文件，然后再用 gzip 压缩该文件，得到一个 .tar.gz 文件。因为 gzip 和 Linux 同为开源软件，两者之间的兼容性很好，所以 gzip 在 Linux 社区中得到了广泛的支持。
> 2. 尽管这些压缩格式在不同的操作系统中更常见，但它们在多数情况下仍可以在其他操作系统中使用。例如，可以在 Linux 系统中使用 p7zip 软件来解压缩 7z 文件，或在 Windows 系统中使用 7-Zip 软件来解压缩 gzip 文件。

为什么很少在 Linux 系统中见到 zip、rar、7z 文件？gz 文件相对它们有什么优势吗？

> 在 Linux 系统中，ZIP、RAR 和 7z 文件相对较少见，主要原因是 Linux 社区和开发者更倾向于使用开源和免费的工具，如 gzip。虽然 ZIP、RAR 和 7z 格式也可以在 Linux 系统中使用，但它们在该平台上的普及程度相对较低。以下是一些原因：
>
> 1. 开源和免费：gzip 是 GNU 项目的一部分，是一个完全开源和免费的压缩工具。Linux 社区通常倾向于使用和支持开源软件。ZIP 和 7z 格式也有开源的解压缩工具（如 Info-ZIP 和 p7zip），但它们在 Linux 社区中的使用相对较少。RAR 格式是专有的，虽然有免费的解压缩工具（如 unrar），但创建 RAR 文件需要购买 WinRAR 软件授权。
>
> 2. 与 Linux 工具链的兼容性：gzip 工具与 Linux 中的许多其他工具（如 tar、find 等）非常兼容。例如，可以使用 tar 命令将目录打包成一个文件，然后用 gzip 压缩该文件，得到一个 .tar.gz 文件。这种兼容性使得 gzip 成为 Linux 系统中的首选压缩工具。
>
> 3. 命令行友好：gzip 的命令行界面非常简洁且易于使用。这对于 Linux 用户来说很重要，因为在 Linux 系统中，命令行操作比图形界面更为常用。
>
> gz 文件格式相对于 ZIP、RAR 和 7z 格式的优势主要在于其在 Linux 社区中的广泛支持和与其他 Linux 工具的兼容性。然而，gz 格式在压缩率上可能不如 ZIP、RAR 和 7z。此外，gz 格式只能压缩单个文件，而 ZIP、RAR 和 7z 格式则支持整个目录结构的压缩。虽然可以通过将目录打包成一个 tar 文件来解决这个问题，但这使得操作相对更加复杂。
>
> 总之，在 Linux 系统中，ZIP、RAR 和 7z 文件相对较少见，主要是因为开源、免费和与其他 Linux 工具的兼容性等因素。然而，在功能和压缩率方面，ZIP、RAR 和 7z 格式可能具有一定的优势。

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

### SSH Config 文件

可以简化连接命令

`~/.ssh/config`:

```sh
# 设置连接到任意主机使用的密钥（默认为 id_rsa）
Host *
  IdentityFile ~/.ssh/id_rsa

Host remote-ubuntu
  HostName 118.195.247.228
  User xiao
  Port 6000

Host example
  HostName example.com
  User username
  IdentityFile ~/.ssh/private_key.pem
  Port 2222

# 设置通过 443 端口连接到 github.com
Host github.com
  HostName ssh.github.com
  User git
  Port 443
```

登录时可以使用 `ssh remote-ubuntu` 代替 `ssh xiao118.195.247.228 -p 6000`

**说明**

`scp` 只能识别以正斜杠分隔的路径，即便是在 Windows 上也是如此。在 Shell 中的路径：`/Users/xiao/.ssh/authorized_keys` 相当于 CMD 上的：`C:\Users\xiao\.ssh\authorized_keys`

-----------------------------------------

`ssh-copy-id` 的替代命令：

将 *nix 机器的公钥上传到 Windows：

```sh
cat ~/.ssh/id_rsa.pub | ssh username@hostname "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

或者

```sh
scp ~/.ssh/id_rsa.pub username@hostname:.ssh/authorized_keys  # SSH 登录后会自动进入用户主目录
```

`ssh-copy-id` 内部会执行一些 *nix shell 命令，因此只能用于 *nix 机器。

将 Windows 的公钥上传到 *nix 机器：

```powershell
Get-Content $Env:USERPROFILE\.ssh\id_rsa.pub | ssh username@hostname "cat >> .ssh/authorized_keys"
```

[How do I add SSH Keys to authorized_keys file? | Ask Ubuntu](https://askubuntu.com/questions/46424/how-do-i-add-ssh-keys-to-authorized-keys-file)

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

[多台 WIN 10 之间的 SSH 免密登录 | 知乎](https://zhuanlan.zhihu.com/p/111812831)

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

### 以 root 身份登录

```sh
sudo vim /etc/ssh/sshd_config
```

找到这两条命令

```config
#PermitRootLogin prohibit-password

#PermitEmptyPasswords no
```

改成这两条

```config
PermitRootLogin yes

PermitEmptyPasswords yes
```

最后重启 `sshd` 服务

```sh
sudo systemctl restart sshd
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

## GDB

只有使用 `-g` 选项编译的程序才能使用 GDB 调试。

```powershell
gcc -g hello.c -o hello
```

```sh
gdb <executable>
b main  # 在 main 函数上打断点
r       # 运行程序
n       # 单步调试
q       # 退出
```

## Network

```sh
ping 192.168.1.2  # 测试主机连通性
ping6 2400:3200:baba::1  # ping ipv6
curl google.com  # 在应用层测试主机连通性
nmap -sn 192.168.1.0/24  # 扫描网络 192.168.1.0 中的设备
telnet 192.168.1.2 6000  # 测试目的主机的 6000 端口是否开启
sudo netstat -tunlp | grep 7000  # 检查 7000 端口是否开启
dig alidns.com  # 查询域名解析
```

### dig

`dig`（Domain Information Groper）是一个用于 DNS 查询的命令行工具，广泛用于查看域名系统的相关信息。下面是一些常见的`dig`命令的用法：

### 基本用法

```sh
# 查询域名的 A 记录（IPv4 地址）：
dig example.com

# 查询指定 DNS 服务器的 A 记录：
dig @dns-server-ip example.com

# 指定查询记录类型（例如，查询 MX 记录）：
dig example.com MX

# 递归查询：
dig +recurse example.com
```

### 输出控制

```sh
# 只显示回答部分（不显示头部和其他信息）：
dig +short example.com

# 以人类可读的格式显示结果：
dig +noall +answer example.com
```

### 其他选项

```sh
# 指定端口号：
dig example.com -p 53

# 显示更详细的信息（调试模式）：
dig +trace example.com

# 显示详细的通信信息：
dig +stats example.com
```
<details>
  <summary>使用示例</summary>

### 使用示例

```sh
$ dig @114.114.114.114 registry-1.docker.io

; <<>> DiG 9.9.4-RedHat-9.9.4-38.el7_3.2 <<>> @114.114.114.114 registry-1.docker.io
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 17709
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;registry-1.docker.io.          IN      A

;; ANSWER SECTION:
registry-1.docker.io.   54      IN      A       54.242.59.189
registry-1.docker.io.   54      IN      A       3.215.51.67
registry-1.docker.io.   54      IN      A       54.83.42.45

;; Query time: 16 msec
;; SERVER: 114.114.114.114#53(114.114.114.114)
;; WHEN: Mon Aug 29 14:20:08 CST 2022
;; MSG SIZE  rcvd: 97
```

1. **命令头部信息：**

```plaintext
; <<>> DiG 9.9.4-RedHat-9.9.4-38.el7_3.2 <<>> @114.114.114.114 registry-1.docker.io
```

- `DiG 9.9.4-RedHat-9.9.4-38.el7_3.2`：指明了使用的 `dig` 版本。
- `@114.114.114.114`：指定了查询的 DNS 服务器地址为 114.114.114.114。
- `registry-1.docker.io`：指定了查询的域名。

2. **全局选项和服务器信息：**

```plaintext
; (1 server found)
;; global options: +cmd
```

- `(1 server found)`：表示找到了 1 个 DNS 服务器。
- `global options: +cmd`：指明使用了全局选项 `+cmd`，该选项表示显示执行命令的指令。

3. **回答头部信息：**

```plaintext
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 17709
;; flags: qr rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1
```

- `opcode: QUERY`：表示查询操作。
- `status: NOERROR`：表示查询状态为没有错误。
- `id: 17709`：表示查询的唯一标识符。
- `flags: qr rd ra`：表示一般查询、递归查询、和响应可用的标志。
- `QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1`：表示查询包含 1 个问题、3 个回答，没有权威和附加信息。

4. **OPT PSEUDOSECTION（可选部分）：**

```plaintext
;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
```

- `EDNS: version: 0, flags:; udp: 512`：表示使用 EDNS（Extension Mechanisms for DNS），版本为 0，无特殊标志，最大传输单元（udp）为 512 字节。

5. **问题部分：**

```plaintext
;; QUESTION SECTION:
;registry-1.docker.io.          IN      A
```

- `registry-1.docker.io. IN A`：表示查询了 `registry-1.docker.io` 的A记录。

6. **回答部分：**

```plaintext
;; ANSWER SECTION:
registry-1.docker.io.   54      IN      A       54.242.59.189
registry-1.docker.io.   54      IN      A       3.215.51.67
registry-1.docker.io.   54      IN      A       54.83.42.45
```

- `registry-1.docker.io.`：表示回答的域名。
- `54 IN A`：表示记录的生存时间（TTL）为 54 秒，记录类型为 A，即 IPv4 地址。
- `54.242.59.189`、`3.215.51.67`、`54.83.42.45`：表示 `registry-1.docker.io` 的 IPv4 地址。

7. **其他信息：**

```plaintext
;; Query time: 16 msec
;; SERVER: 114.114.114.114#53(114.114.114.114)
;; WHEN: Mon Aug 29 14:20:08 CST 2022
;; MSG SIZE  rcvd: 97
```

- `Query time: 16 msec`：表示查询耗时 16 毫秒。
- `SERVER: 114.114.114.114#53(114.114.114.114)`：表示使用的 DNS 服务器及其地址。
- `WHEN: Mon Aug 29 14:20:08 CST 2022`：表示查询的时间。
- `MSG SIZE rcvd: 97`：表示接收到的消息大小为 97 字节。

#### 什么是 A 记录

A记录（Address Record）是 DNS（Domain Name System）中的一种资源记录类型，用于将主机名映射到 IPv4 地址。每个 A 记录包含一个主机名和对应的 IPv4 地址。当你在浏览器中输入一个域名（比如 www.example.com）时，系统首先会向 DNS 服务器发送一个 A 记录查询，以获取与该域名关联的 IPv4 地址。

例如，以下是一个 A 记录的简单示例：

```plaintext
example.com.    IN    A    192.168.1.1
```

- `example.com.` 是主机名。
- `IN` 表示 Internet。
- `A` 表示 A 记录类型。
- `192.168.1.1` 是与主机名相关联的 IPv4 地址。

当系统收到类似 www.example.com 的请求时，它会查询 DNS 服务器以获取相应的 A 记录，然后将解析得到的 IPv4 地址用于建立连接。

需要注意的是，A 记录只能映射到 IPv4 地址。对于 IPv6 地址的映射，可以使用 AAAA 记录。

-----------------------------------------

```plaintext
example.com.    IN    A    192.168.1.1
```

1. 第二列的内容是`IN`，表示 Internet。除了`IN`外，第二列还可能是其他一些区域（Zone）或者特定网络环境的标识，例如：

- `CH`：表示 CHAOS 类。
- `HS`：表示 Hesiod 类。
- 其他一些特定用途的标识。

但在实际应用中，`IN` 是最常见的，也是默认的区域标识，用于指定 Internet。

2. 第三列的内容是 `A`，表示 A 记录类型。除了 `A` 外，DNS 还支持其他类型的记录，每种记录类型都有特定的用途。一些常见的 DNS 记录类型包括：

- `AAAA`：IPv6 地址记录，类似于 A 记录，但用于映射主机名到 IPv6 地址。
- `CNAME`：规范名称记录，用于创建别名，将一个主机名映射到另一个主机名。
- `MX`：邮件交换记录，指定邮件服务器的优先级和域名。
- `NS`：域名服务器记录，指定域名的权威 DNS 服务器。
- `PTR`：指针记录，用于反向 DNS 查找，将 IP 地址映射到主机名。
- `SOA`：起始授权机构记录，包含有关域的重要信息，如域的管理者、域的刷新时间等。

在查询结果中，`A`记录指定了主机名与 IPv4 地址之间的映射关系。不同的记录类型用于支持不同的网络服务和功能。
</details>

### nslookup

nslookup（Name Server Lookup）是一个用于执行 DNS 查询的命令行工具。它通常用于查询域名系统（DNS）的相关信息，例如获取特定主机名的 IP 地址、反向 DNS 查找、查询域名服务器等。在现代操作系统中，例如在 Windows 和一些 Linux 发行版中，`nslookup` 已经被更先进的工具如 `dig` 所取代，但它仍然是一些环境中常用的命令行工具之一。

```sh
nslookup www.baidu.com  # 查询 www.baidu.com 的 IPv4 地址
```

## NeoVim

安装 neovim 后安装 lazyvim