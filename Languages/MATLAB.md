# MATLAB

## 基本操作

|   命令   | 作用                         |
| :------: | :--------------------------- |
|    ;     | 禁止显示网版印刷             |
|   clc    | 清空命令行窗口               |
|    cd    | 改变当前目录                 |
|  delete  | 删除一个文件                 |
|    ls    | 列出当前目录中的所有文件     |
|   pwd    | 显示当前目录                 |
|   type   | 显示文件内容                 |
|   what   | 列出当前目录中的 MATLAB 文件 |
|   who    | 查看当前 Workspace 变量名    |
|  mkdir   | 新建文件夹                   |
|  rmdir   | 删除文件夹                   |
| movefile | 文件移动/重命名              |
| copyfile | 文件复制                     |
|   edit   | 编辑/创建文件                |

> 可以像使用 Shell 命令一样使用，也可以像使用 MATLAB 函数一样使用。

```matlab
%{
  块注释
%}

% 数组下标运算符
arr(i)  % i 从 1 开始

% 标量运算
a = 2;
b = a * 3;  % b = 6

% 矩阵运算
x = [1 2 3; 4 5 6; 7 8 9]
y = x * 2;  % y = [2 4 6; 8 10 12; 14 16 18]

% 数组乘法
x = [1 2 3];
y = [4 5 6];
z = x.* y;  % z = [4 10 18]

% 生成行向量
z = [3:6]     % z = [3 4 5 6]
z = [0:1:5];  % z = [0 1 2 3 4 5]

% 使用冒号运算符
z(1:3)  % z 向量的第 1 到第 3 个元素
x(1:2, 2:3)  % x 矩阵的 1 到 2 行的 2 到 3 列的元素
x(i, :)  % x 的第 i 行
x(:, j)  % x 的第 j 列
x(1:2, :)  % x 的 1 到 2 行
x([1 1], :)  % 两个 x 的第一行
```

## 输入输出

### 输入

```matlab
integer = input("Please input an integer: ");
string = input("Please input a string: ", "s");
```

> `"str"` 表示字符串，`'char'` 表示字符数组。

### 输出

```matlab
fprintf('The integer is %d\n', integer);
fprintf('The string is %s\n', string);
disp('Any word');

disp(integer);
disp(string);
```

## 循环

### for 循环

```matlab
for i = 1 : 10
    disp(i);
end
```

### while 循环

```matlab
i = 1;
while i <= 10
    disp(i);
    i = i + 1;
end
```

## m 文件

m 文件可以是脚本文件，也可以是函数文件。调用时使用文件名（不带后缀）。

### 脚本文件

不接受输入，不产生输出。

```
% 代码
```

### 函数文件

```matlab
function [out1, out2, out2] = func_name(in1, in2, in3)

% function comment
% 代码
```

## 绘图

### 平面直角坐标图

```matlab
x = [0 : 0.01: 10];
y = sin(x);
plot(x, y);
```

```matlab
y = sin(x);
g = cos(x);
plot(x, y 'r', x, g, 'g'), legend('sin(x)', 'cos(x)')  % 在一幅图像中绘制两个图形，图形 1 为红色，图形 2 为绿色，图例名称分别为 'sin(x)' 和 'cos(x)'
```

```matlab
x = [0:0.01:5];
y = exp(-1.5*x).*sin(10*x);

figure("Name","NRZ to AMI","NumberTitle","off");  % 改变图像窗口的标题

subplot(3,1,1);  % 将即将绘制的图形以多个子图的方式绘制，前两个参数指定子图网格的行数和列数，第三个参数指定即将绘制的子图在网格中的位置
plot(x,y);  % plot 绘制平面直角坐标图
axis([0 5 -1 1]);  % 设置横、纵轴坐标范围
title("y = f(x)");  % 子图标题
xlabel('x');
ylabel('y');
g = [1:0.01:6];

subplot(3,1,2);
stairs(x,g);  % 绘制阶梯图形（如波形图）
xlabel('x');
ylabel('g');
title("g = f(x)");
axis([0 5 1 6]);
grid;  % 显示网格线

subplot(3,1,3);
stem(x,y);  % 针状图
```

[合并多个绘图](https://ww2.mathworks.cn/help/matlab/creating_plots/combine-multiple-plots.html)

[stem 设置连线格式](https://ww2.mathworks.cn/help/matlab/ref/stem.html)