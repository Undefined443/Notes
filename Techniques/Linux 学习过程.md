### 安装 Windows Linux 双系统后开机直接进入 Windows

解决方法：在 BIOS 的 Boot 选项下找到 UEFI Hard Disk Drive BBS Priorities，将 Boot Option #1 设置为 ubuntu。

### Clash for Linux

在 <https://github.com/Dreamacro/clash/releases> 下载 clash-linux-amd64 最新版本

右键解压或 `gunzip clash-linux-amd64-v1.5.0.gz`

解压出来的文件放哪都行

获取订阅文件

```zsh
wget -O config.yaml [订阅地址]
```

目录下会多出来 config.yaml 和一个文件名乱七八糟的东西。把乱七八糟重命名为 config.yaml，然后放到 ~/.config/clash 目录下。

查看 config.yaml 前 7  行内容，根据 port，socks-port 设置系统网络代理

