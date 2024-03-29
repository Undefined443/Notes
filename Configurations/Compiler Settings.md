### MinGW

在系统变量的 `Path` 中添加 MinGW 的 bin 文件夹路径即可。如 `C:\Program Files\mingw64\bin`

#### 测试

cmd 命令：`gcc -v`

### JDK

#### 新建系统变量

变量名：`JAVA_HOME`  
变量值：JDK 安装路径，如 `C:\Program Files\Java\jdk-17`

变量名：`CLASSPATH`  
变量值：`.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;`

#### 配置 Path

新建 `%JAVA_HOME%\bin` 和 `%JAVA_HOME%\jre\bin`

或者编辑文本，加入 `%JAVA_HOME%\bin;%JAVA_HOME%\jre\bin;`

#### 测试

cmd 命令：`java -version`, `java`, `javac`

### 解决 CLion 在使用 Terminal 时按 ESC 键切换至编辑窗口的问题

使用 <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>S</kbd> 快捷键打开 Settings -> Keymap -> Plugins -> Terminal -> Switch Focus To Editor，删除其快捷键绑定即可。

### IDEA 项目导入 JAR 包与打 JAR 包

#### 导入 JAR 包

在导入 JAR 包之前，可以看到项目的 `External Libraries` 中只有 JDK

![图片](../assets/IMG_4.png)

点击 `File` -> `Project Structure` (<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd>)

![图片](../assets/IMG_5.png)

选中 `Modules`

![图片](../assets/IMG_6.png)

在 `Dependencies` 标签界面下，点击右边绿色的 `+` 号，选择第一个选项 `JARs or directories...`，选择相应的 JAR 包，点击 `OK`，JAR 包导入成功

![图片](../assets/IMG_7.png)
![图片](../assets/IMG_8.png)
![图片](../assets/IMG_9.png)

点 `OK` 回到项目界面，IntelliJ IDEA 自动提示需要添加 import 语句，利用 <kbd>Alt</kbd> + <kbd>Enter</kbd> 键快速添加 import 语句之后，项目成功编译

![图片](../assets/IMG_10.png)

#### 打 JAR 包

点击 `File` ->  `Project Structure` (<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>S</kbd>)

选中 `Artifacts`

![图片](../assets/IMG_11.png)

点击 `+`，选择 `JAR`，选择 `From modules with dependencies...`

![图片](../assets/IMG_12.png)

填写弹出的配置窗口，点击 `OK`

![图片](../assets/IMG_13.png)

勾选 `Build on make` -> `OK` 保存

![图片](../assets/IMG_14.png)

`Build` -> `Make Project`

*注意这里可能会报编译错误，最好提前检查一下编译器版本：`File` -> `Settings` -> `Java Compiler`，修改 `Target bytecode version` 版本为 1.8，另外项目版本 `Project Structure` -> `Project/Modules` 版本改为 1.8*

![图片](../assets/IMG_15.png)

*Java Complier*

![图片](../assets/IMG_16.png)

*Project*

![图片](../assets/IMG_17.png)

*Modules*

![图片](../assets/IMG_18.png)

在 Make Project 后，可在打包输出路径找到 JAR 包

![图片](../assets/IMG_19.png)

[IntelliJ IDEA java项目导入jar包，打jar包](https://www.cnblogs.com/yulia/p/6824058.html)

#### 运行 JAR 包

```sh
java -jar <jar包名>  # 使用默认主类
java -classpath <jar包名> <主类名>  # 指定主类
```

> 主类名要写全限定类名，如 `com.example.Main`