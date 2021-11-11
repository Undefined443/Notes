# Shell

在 Visual Studio Code 中按下 <kbd>Ctrl</kbd> + <kbd>`</kbd> 打开 Terminal

```bash
open <dir>     # 在访达中打开 dir 目录
explorer <dir> # 在资源管理器中打开 dir 目录

clear # 清屏
cls   # cmd 清屏

ls -ah # 查看当前目录所有文件（包括隐藏文件）

rm <file> # 删除文件
rm -rf    # 删除当前目录，并且不询问

vi # 使用 vim 编辑文件

q # 退出

cat <file> # 查看文件内容
cat -n <file> # 显示行号

touch <file> # 创建文件

echo "message" > <file> # 以覆写的方式将消息写入文件
echo "message" >> <file> # 以追加的方式写入文件
```

## vim

```bash
vi <file> # 用 vim 打开或创建一个文件
```

按下 <kbd>i</kbd> 进入输入模式

输入完成后，按下 <kbd>ESC</kbd> 回到命令模式

输入 `:` 进入底线命令模式并输入 `wq` 保存并离开

## Visual Studio Code

```bash
code . # 用 Visual Studio Code 打开该文件夹
```