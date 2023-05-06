# CMake

[CMake Tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)

```cmake
set(CMAKE_EXE_LINKER_FLAGS "-static")  # 静态链接
```

> 静态链接可以防止你的程序在其他机器上找不到动态库的情况，但是会使得程序体积变大
>
> Qt 程序不用设置这条命令，因为 Qt 程序除了要链接 C++ 标准库之外，还要链接 Qt 库，而 Qt 库无法通过这条命令静态链接。在 Windows 平台发布 Qt 程序之前应该先使用 `windeployqt` 工具将依赖的 Qt 动态库复制到程序目录下。

## 部署 Qt 程序

```batch
windeployqt your_app.exe

rem Bug: 在 Qt 6.5.0 上使用 windeployqt 会出现如下错误：
rem Cannot open .: Access is denied.
rem 解决办法：
windeployqt --no-translations your_app.exe
```

[CSDN: CMake -static 编译](https://blog.csdn.net/qq_19982783/article/details/77740703)

```cmake
# 设置 CMake 版本，应该作为第一条语句
cmake_minimum_required(VERSION 3.25)

# 设置项目名称、语言、版本号，应该紧跟着 cmake_minimum_required 命令
project(Tutorial VERSION 1.0)  # 指定了项目名和版本号，将隐式创建 Tutorial_VERSION_MAJOR 变量和 Tutorial_VERSION_MINOR 变量

# 设置变量，应该在 add_executable 之前
set(CMAKE_CXX_STANDARD 11 CMAKE_CXX_STANDARD_REQUIRED True) # 设置 C++ 标准

# 生成 Configured 文件
configure_file(TutorialConfig.h.in TutorialConfig.h)  # 使用 TutorialConfig.h.in 生成 Tutorial.h 文件，input 文件中的变量将被自动替换

# 设置可执行文件以及源码
add_executable(Tutorial tutorial.cxx)  # 生成的可执行文件名将为 Tutorial，其源文件为 tutorial.cxx

# 设置目标文件的 include 目录
target_include_directories(Tutorial PUBLIC "${PROJECT_BINARY_DIR}")  # 添加头文件目录，PUBLIC 表示所有依赖于 Tutorial 的目标都会继承这个目录
```

```cmake
# 设置库文件以及源码
add_library(MathFunctions mysqrt.cxx)
```

> 可执行文件名 Tutorial 和项目名 Tutorial 并没有关系

```sh
cmake -S <source_dir> -B <build_dir>  # 配置项目并生成本地构建系统
ccmake <build_dir>  # 使用图形化界面编辑项目配置

cmake --build <build_dir>  # 调用构建系统来编译/链接项目
```

[`cmake_minimum_required()`](https://cmake.org/cmake/help/latest/command/cmake_minimum_required.html#command:cmake_minimum_required)

[`project()`](https://cmake.org/cmake/help/latest/command/project.html#command:project)

[`add_executable()`](https://cmake.org/cmake/help/latest/command/add_executable.html#command:add_executable)

[`set()`](https://cmake.org/cmake/help/latest/command/set.html#command:set)

[`target_include_directories()`](https://cmake.org/cmake/help/latest/command/target_include_directories.html#command:target_include_directories)

---

## Useful Resources

[A Basic Starting Point](https://cmake.org/cmake/help/latest/guide/tutorial/A%20Basic%20Starting%20Point.html)

> 该教程包含如何把 configure file 生成到 BIN 目录下

[Adding a Library](https://cmake.org/cmake/help/latest/guide/tutorial/Adding%20a%20Library.html)

[Installing and Testing](https://cmake.org/cmake/help/latest/guide/tutorial/Installing%20and%20Testing.html)

```sh
# 将 CMake 构建的项目安装到当前目录下
cmake --install . --prefix .
```

[Adding System Introspection](https://cmake.org/cmake/help/latest/guide/tutorial/Adding%20System%20Introspection.html)

> 该教程通过检查能否编译一段测试程序来判断系统是否拥有所需功能

[Adding a Custom Command and Generated File](https://cmake.org/cmake/help/latest/guide/tutorial/Adding%20a%20Custom%20Command%20and%20Generated%20File.html)

> 在构建时执行自定义命令，生成文件，并将其用于构建

[Packaging an Installer](https://cmake.org/cmake/help/latest/guide/tutorial/Packaging%20an%20Installer.html)

[Selecting Static or Shared Libraries](https://cmake.org/cmake/help/latest/guide/tutorial/Selecting%20Static%20or%20Shared%20Libraries.html)

> Linux 上的动态库路径变量是 `LD_LIBRARY_PATH`，而 MacOS 上的动态库路径变量是 `DYLD_LIBRARY_PATH`
>
> 在 CMakeLists.txt 中指定动态库路径：  
> [linux 下通过 rpath 解决 cmake 动态编译后找不到动态链接库问题](https://juejin.cn/post/6936408961050476558/)  
> [RPATH 简介以及 CMake 中的处理](https://blog.xizhibei.me/2021/02/12/a-brief-intro-of-rpath/)
> 我在 MacOS 上使用时没有用到 `$ORIGIN` 变量，而是直接指定了动态库的路径
