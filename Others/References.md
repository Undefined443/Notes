# References

[设置域名服务器](https://ubuntu.com/server/docs/service-domain-name-service-dns)

[设置域名服务器 GitHub](https://cshihong.github.io/2018/10/15/DNS服务器搭建与配置/)

## Q&A

Q: 什么是 TTY?

A: TTY（Teletypewriter，电传打字机）是一种传统的电信设备，最早用于发送和接收文本消息。随着计算机技术的发展，TTY 的概念已经扩展到计算机终端和控制台。在现代计算机中，TTY 通常指代一个文本终端或终端模拟器。

在 Unix 和类 Unix 操作系统（如 Linux）中，TTY 是一个字符设备，它允许用户与计算机进行交互。用户可以通过键盘输入命令，计算机将结果显示在屏幕上。这种基于文本的界面被称为命令行界面（CLI）或终端。

在 Linux 系统中，有多种类型的 TTY：

1. 物理控制台：连接到计算机的物理显示器和键盘。
2. 虚拟控制台（Virtual Console）：通过按键组合（如 Ctrl+Alt+F1）在物理控制台上访问的多个独立的文本终端。这些终端在同一物理设备上运行，但每个都有自己的输入和输出。
3. 伪终端（Pseudo-terminal，PTY）：模拟物理终端的软件实现，通常用于远程访问（如 SSH）和终端模拟器（如 xterm 和 GNOME Terminal）。

总之，TTY 是与计算机进行文本交互的设备或模拟器，它们在现代计算机系统中广泛使用，尤其是在命令行界面中。