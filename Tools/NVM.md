# NVM

[![Node Version Manager](https://raw.githubusercontent.com/nvm-sh/logos/HEAD/nvm-logo-color.svg)](https://github.com/nvm-sh/nvm)

官方声明不要使用 brew 安装 NVM

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

[在 Windows 上安装 Node.js](https://docs.microsoft.com/zh-cn/windows/dev-environment/javascript/nodejs-on-windows)

```sh
nvm ls  # 查看已安装的 Node.js 版本
nvm ls-remote --lts  # 查看可安装的 Node.js LTS 版本
nvm install 16  # 安装最新的 Node.js 18 版本
```

`nvm use <version>` 命令出现乱码：原因是权限不足。在管理员权限下运行这条命令。

## NPM

```sh
npm install xxx --save
npm install xxx -S

npm install xxx --save-dev
npm install xxx -D
```

[npm install 安装的四种用法 --save 和 --save-dev](https://blog.csdn.net/weixin_42260975/article/details/106253250?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1-106253250-blog-121209404.pc_relevant_default&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1-106253250-blog-121209404.pc_relevant_default&utm_relevant_index=2)

[node 安装依赖时带 --save-exact 是为什么](https://blog.csdn.net/aaqingying/article/details/121209404)

> --save 选项会将依赖添加到 package.json 的 dependencies 字段中，而 --save-dev 选项会将依赖添加到 devDependencies 字段中。

### 换源

NPM [ECONNRESET 错误](https://stackoverflow.com/questions/18419144/npm-not-working-read-econnreset) 解决方法：

方法一：

使用中国 NPM 镜像

```sh
npm config set registry https://registry.npmmirror.com/
```

也可以临时指定镜像源

```sh
npm install express --registry=https://registry.npmmirror.com
```

还可以使用镜像管理工具 `nrm`

```sh
npm install -g nrm
nrm add npmmirror https://registry.npmmirror.com
nrm add official https://registry.npmjs.org
```

```sh
nrm use npmmirror  # 使用 nrm 切换镜像源
```

或者使用以淘宝为镜像源的包管理器 `cnpm`

```sh
npm install -g cnpm --registry=https://registry.npmmirror.com
```

```sh
cnpm install express
```

> `cnpm` 和 `npm` 不要混用
>
> 最好还是换源而不是使用 `cnpm`

方法二（不建议）：

使用 HTTP 连接

```sh
npm config set registry http://registry.npmjs.org/
```

### 常用命令

生成 package.json 文件

```sh
npm init
```

利用 package.json 安装依赖

```sh
npm install
```

在 package.json 中添加依赖

```sh
npm install --save --save-dev <package>
```

### Troubleshooting

```output
npm ERR! code 1
npm ERR! path /Users/xiao/Tests/White-Jotter/wj-vue/node_modules/chromedriver
npm ERR! command failed
npm ERR! command sh -c node install.js
npm ERR! Only Mac 64 bits supported.
```

解决方法：

```sh
npm install --ignore-scripts
npm install
```

[51CTO 博客: 解决 npm install 时报错无法安装 chromedriver 的问题](https://blog.51cto.com/zero01/2298070)

#### npm 代理问题

```
npm ERR! code ECONNRESET
npm ERR! errno ECONNRESET
npm ERR! network request to https://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz failed, reason: Client network socket disconnected before secure TLS connection was established
npm ERR! network This is a problem related to network connectivity.
npm ERR! network In most cases you are behind a proxy or have bad network settings.
npm ERR! network 
npm ERR! network If you are behind a proxy, please make sure that the
npm ERR! network 'proxy' config is set properly.  See: 'npm help config'

npm ERR! A complete log of this run can be found in:
npm ERR!     /home/xiao/.npm/_logs/2022-10-22T11_00_36_894Z-debug-0.log
```

解决方法：关闭终端代理，或者使用 HTTP (而不是 HTTPS) 连接 package 库： `npm config set registry=http://registry.npmjs.org` (不建议)

##### 设置 npm 代理

```sh
npm config set proxy=http://127.0.0.1:7890
```

> 最好设置镜像源而不是设置代理
