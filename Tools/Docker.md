# Docker

[Docker Docs](https://docs.docker.com/get-started/)

[Docker 入门教程 - 阮一峰的网络日志](https://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html)

[Docker 从入门到实践-yeasy](https://yeasy.gitbook.io/docker_practice/)

## Practice

### Windows 下的绑定挂载

在 Windows 环境下进行绑定挂载时，需要注意路径的写法，需要使用 Windows 风格 (`C:\`) 的路径，而不是 Cygwin (`/c/`) 风格的路径。这一点在使用 git BASH 时要尤为注意。

比如说，在 git BASH 中，`pwd` 命令的输出是 `/c/Users/xiao/...`，而不是 `C:\Users\xiao\...`。因此如果使用了如下命令：

```sh
docker run -v "${PWD}":/app img
```

在 git BASH 中可能会产生意料之外的绑定挂载。

另外，在 PowerShell 中进行绑定时出现过另一种奇怪现象，在使用上面的命令挂载时，可能会出现奇怪的报错，这时将命令改成如下（改变引号的位置）：

```powershell
docker run -v "${PWD}:/app" img
```

就能正常运行。

这样的命令也会出现报错：目录格式不正确

```powershell
docker run -v $(pwd)\frpc.ini:/etc/frp/frpc.ini frp
```

然而如果把 `$(pwd)` 换成 `$PWD` 就不会报错。两条命令 echo 出来的内容却是一样的。

### 保持容器运行的小技巧

```sh
docker run -d ubuntu bash -c "tail -f /dev/null"
```

[Docker Docs: Persisting data](https://docs.docker.com/get-started/05_persisting_data/)

## image

### 管理 image

```sh
docker search hello-world  # 搜索 image

docker pull hello-world
# docker image pull library/hello-word
docker image ls  # 列出所有 image
docker images

docker image rm <img>  # 删除 image
docker rmi <img>
```

> `image` 可以在同一 CPU 架构的任何操作系统上运行

### build image

```sh
docker build -t <name> .  # . 表示 Dockerfile 所在的目录
# docker image build -t <name>:<tag> .

docker history <image>  # 查看镜像中创建镜像层的命令
```

> `-t`: tag，相当于一个指向镜像的指针

每一个 `image` 都是由一系列的 `layer` 组成的。Dockerfile 中的每条命令都会创建一个新的 `layer`。

`docker history <image>` 命令可以查看 `image` 中用于创建每个 `layer` 的命令。在命令的输出中，最底层的是 `base image`，最顶层的是 `top layer`。通过这个命令也可以看到每个 `layer` 的大小，帮助我们诊断大体积的 `image`。

### Dockerfile

```Dockerfile
FROM <image>   # 基础镜像
RUN <command>  # 在基础镜像上运行命令
COPY <src> <dest>  # 将本地文件复制到镜像中
EXPOSE <port>  # 暴露端口
CMD <command>  # 容器启动时运行的命令
```

每次 `RUN` 的执行都是在一个新的镜像层 `layer` 上进行的，所以，如果你的镜像中有多个 `RUN` 命令，那么每个 `RUN` 都会创建一个新的镜像层，这样会导致镜像体积变大。

> 常用基础镜像：`ubuntu`, `alpine`, `node:14`, `python`, `golang`, `openjdk:11-jdk-slim`, `nginx:1.21.0-alpine`

[Docker Guides: Language-specific guides](https://docs.docker.com/language/)

[Dockerfile reference](https://docs.docker.com/engine/reference/builder/)

### 发布 image

```sh
# 给 image 打 tag (创建一个新的 tag 并将该 image id 与 tag 关联)
docker tag old:0.0.1 username/new:0.0.1
# docker image tag old:0.0.1 username/new:0.0.1

# 发布
docker push username/new:0.0.1
# docker image push username/new:0.0.1
```

## container

### 管理 container

```sh
docker ps -a # 列出所有 container，包括终止运行的
# docker container ls -a # 同上

docker rm <container>  # <container> 可以是 tag 或者 id
# docker container rm <container>
```

常用命令：

```sh
docker rm -f <container>  # 强制删除一个容器（正在运行的容器也可以删除）
```

### 运行

```sh
docker run hello-world  # 若 image 不存在则自动执行 docker pull 命令
# docker container run hello-world
```

其他运行选项

```sh
docker run -it ubuntu  # -i: interactive -t: 分配一个伪 TTY
docker run -d ubuntu  # -d: 后台运行
docker run -p 80:80 nginx  # -p: 端口映射，将主机的 80 端口映射到容器的 80 端口
docker run -v /path/to/host:/path/to/container nginx  # -v: 挂载卷
docker run --name <name> nginx  # --name: 指定容器名
docker run --rm nginx  # --rm: 运行结束后自动删除容器
```

常用示例

- `-p 127.0.0.2:80:80`: 将主机的 127.0.0.2:80 映射到容器的 80 端口
- `-v "$(pwd)":/app`: 将当前目录挂载到容器的 /app 目录

### 停止

```sh
docker stop <container>  # 停止运行
docker kill <container>  # 强制停止
```

### 其他

```sh
docker start <container>  # 启动已经停止的 container

docker exec -it <container> bash  # 进入运行中的 container 的 shell

docker logs -f <container>  # 查看 container 的日志，-f: 实时查看

docker cp <container>:<path> <path>  # 从 container 中复制文件到主机

docker inspect <container>  # 查看 container 的详细信息
```

## Advanced Topics

### Volume Mounts

当你需要某个持久的地方来存储程序的数据时，卷挂载是一个很好的选择。(数据库)

```sh
docker volume create todo-db  # 创建一个 volume

docker run -dp 3000:3000 --mount type=volume,src=todo-db,target=/etc/todos getting-started  # 挂载 volume
```

```sh
docker volume ls
docker volume inspect todo-db  # 查看 volume 详细信息
```

[Docker Docs: Persist the DB](https://docs.docker.com/get-started/05_persisting_data/)

### Bind Mounts

绑定挂载对于开发环境来说是一个很好的选择。

```sh
docker run -it --mount type=bind,src="$(pwd)",target=/src ubuntu bash
```

也可以使用 `-v` 或 `--volume` 选项（不推荐）：

```sh
docker run -it -v "$(pwd)":/src ubuntu bash
```

[Docker Docs: Use bind mounts](https://docs.docker.com/get-started/06_bind_mounts/)

#### Run your app in a development container

```sh
docker run -dp 3000:3000 \
    -w /app --mount type=bind,src="$(pwd)",target=/app \
    node:18-alpine \
    sh -c "yarn install && yarn run dev"
```

> `-w`: Working Directory

相当于直接使用一个安装了 Node.js 的机器运行这个 node 项目。

当你完成对项目的修改，这时再使用 build 命令构造出最终的镜像：

```sh
docker build -t getting-started .
```

[Docker Docs: Run your app in a development container](https://docs.docker.com/get-started/06_bind_mounts/#run-your-app-in-a-development-container)

了解更多高级存储概念，查阅[Manage data in Docker](https://docs.docker.com/storage/)

## Docker Compose

[Docker Docs: Multi-container apps](https://docs.docker.com/get-started/07_multi_container/)

[Docker Manuals: Docker Compose](https://docs.docker.com/compose/gettingstarted/)

[阮一峰的网络日志: Docker Compose 工具](https://www.ruanyifeng.com/blog/2018/02/docker-wordpress-tutorial.html)

```sh
docker network create todo-app  # 创建一个网络

# 启动 mysql
docker run -d \
     --network todo-app --network-alias mysql \  # 连接到网络并指定网络别名（在网络中的主机名）
     -v todo-mysql-data:/var/lib/mysql \  # 卷挂载，自动创建名为 todo-mysql-data 的 volume
     -e MYSQL_ROOT_PASSWORD=secret \  # 设置环境变量，ROOT 密码
     -e MYSQL_DATABASE=todos \  # 设置环境变量，数据库名
     mysql:8.0

docker run -it --network todo-app nicolaka/netshoot  # 启动一个网络调试工具
$ dig mysql

# start your dev-ready container
docker run -dp 3000:3000 \
   -w /app -v "$(pwd):/app" \  # 绑定挂载
   --network todo-app \  # 连接到网络
   -e MYSQL_HOST=mysql \  # 设置环境变量，数据库 IP/主机名
   -e MYSQL_USER=root \  # 设置环境变量，数据库用户名
   -e MYSQL_PASSWORD=secret \  # 设置环境变量，数据库密码
   -e MYSQL_DB=todos \  # 设置环境变量，数据库名
   node:18-alpine \
   sh -c "yarn install && yarn run dev"  # 启动命令
```

<details>
  <summary>⚠️ 安全提示</summary>
  在生产中不建议通过环境变量来配置连接设置。在大多数情况下，secrets 被以文件的形式加载到运行的容器中，比如说 MySQL 容器支持通过以 `_FILE` 为后缀的环境变量来指向含有环境变量值的文件，如 `MYSQL_PASSWORD_FILE` 会让 app 使用文件中的值作为连接密码。

  <a href="https://blog.diogomonica.com//2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/">Why you shouldn't use ENV variables for secret data - Diogo Mónica</a>
</details>
<br />

[Docker Docs: Use Docker Compose](https://docs.docker.com/get-started/08_using_compose/)

*compose.yaml*

```yaml
services:
  app:
    image: node:18-alpine
    command: sh -c "yarn install && yarn run dev"
    ports:
      - 3000:3000
    working_dir: /app
    volumes:     
      - ./:/app  # Docker Compose 中可以直接使用相对路径
    environment:
      MYSQL_HOST: mysql
      MYSQL_USER: root
      MYSQL_PASSWORD: secret
      MYSQL_DB: todos

  mysql:  # 定义的服务名会自动成为其网络别名
    image: mysql:8.0
    # docker run 的 -v 选项会自动创建不存在的 volume，
    # 但是在 compose 中需要先在顶层 volumes section 
    # 中声明 volume，然后再在 service config 中指定
    # 挂载点
    volumes:
      - todo-mysql-data:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: todos

volumes:  # volumes section, 声明 volume
  todo-mysql-data:  # key: value，如果使用默认 volume 引擎的话不用给出 value
```

> 相对路径以 compose 文件所在的目录为基准  
> 相对路径必须以 `.` 或 `..` 开头  
> Docker Compose 会自动为你的应用程序栈创建一临时网络，因此你不用在 compose 文件中定义网络

[Docker Compose file reference: ports](https://docs.docker.com/compose/compose-file/compose-file-v3/#ports)

[Docker Compose file reference: volumes](https://docs.docker.com/compose/compose-file/compose-file-v3/#volumes)

运行应用程序栈

```sh
docker compose up -d  # 启动，-d 选项表示后台运行
docker compose down  # 停止

docker compose logs -f  # 查看日志，-f 选项表示实时输出
docker compose logs -f app  # 只查看 app 服务的日志
```

> 在运行 `docker compose down` 命令时，默认不会删除 compose 文件中的命名 volume，如果想要删除它们，可以加上 `--volumes` 选项。

### 构建多平台镜像

```sh
docker build --platform linux/amd64 -t undefined443/course:amd64 .
docker build --platform linux/arm64 -t undefined443/course:arm64 .
```

[Multi-platform builds](https://docs.docker.com/build/building/multi-platform/#getting-started)

```sh
# 查看现有的 builder
docker buildx ls

# 使用 docker-container 驱动创建一个 builder
# docker-container 提供了多平台 build 支持
docker buildx create --name mybuilder --driver docker-container --bootstrap

# 切换到刚刚创建的 builder
docker buildx use mybuilder

# 构建多平台镜像
docker buildx build --platform linux/amd64,linux/arm64 -t <username>/<image>:latest --push .

# 检视镜像
docker buildx imagetools inspect <username>/<image>:latest

# 使用 SHA256 摘要指定一个镜像变体
docker run --rm <username>/<image>@sha256:2b77acdfea5dc5baa489ffab2a0b4a387666d1d526490e31845eb64e3e73ed20 uname -m
```

### 构建镜像的最佳实践

[Docker Docs: Image-building best practices](https://docs.docker.com/get-started/09_image_best/)

#### Layer caching

当镜像层发生改变时，所有下游镜像层都要重新构建。

```Dockerfile
# syntax=docker/dockerfile:1
FROM node:18-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
```

如果我们这样写 Dockerfile，那么每次我们修改源代码并重新构建镜像时都要重新安装依赖，因为源代码的改变会导致 `COPY . .` 层发生改变，从而导致其下的所有层都要重新构建。

为了能够缓存依赖，我们需要重新组织 Dockerfile 的结构：

```Dockerfile
# syntax=docker/dockerfile:1
FROM node:18-alpine
WORKDIR /app
COPY package.json yarn.lock ./  # 先将安装依赖所需的文件拷贝进来
RUN yarn install --production   # 安装依赖
COPY . .                        # 最后再将其他内容拷贝进来
CMD ["node", "src/index.js"]
```

在 Dockerfile 所在的目录下创建 `.dockerignore` 文件，并填入以下内容：

```
node_modules
```

[Dockerfile reference: .dockerignore file](https://docs.docker.com/engine/reference/builder/#dockerignore-file)

在第二个 `COPY` 命令执行时应该忽略 `node_modules` 文件夹，否则它会覆盖 `RUN` 命令所产生的文件。

这样，只要依赖没有发生改变，那么在重新构建时就不需要重新安装依赖，从而减少 `build`、`push`、`pull`、以及更新镜像所需的时间。

#### Multi-stage builds

使用多阶段构建，可以帮助我们：

- 将 `build-time` 依赖与 `runtime` 依赖分离
- 通过只传送 app 需要运行的内容来减小整个 image 的体积

Maven/Tomcat 示例：

```Dockerfile
# syntax=docker/dockerfile:1
# build 阶段，使用 Maven 构建 Java 项目
FROM maven AS build
WORKDIR /app
COPY . .
RUN mvn package

# runtime 阶段，使用 Tomcat 运行 Java 项目
FROM tomcat
# 将 build 阶段构建的文件拷贝进来
COPY --from=build /app/target/file.war /usr/local/tomcat/webapps
```

最终的镜像只包含最后创建的阶段（可以使用 `--target` 标记覆盖）

##### 只构建需要的镜像

```sh
DOCKER_BUILDKIT=1 docker build --no-cache -f Dockerfile --target stage2 .
```

通过 `--target` 选项指定要构建的阶段。

通过设置 `DOCKER_BUILDKIT=1`，可以只构建 target 阶段以及 target 依赖的阶段。

[infoq: 3 Simple Tricks for Smaller Docker Image](https://www.infoq.cn/article/3-simple-tricks-for-smaller-docker-images)

[yeasy: Dockerfile 多阶段构建](https://yeasy.gitbook.io/docker_practice/image/multistage-builds)

[Docker Manuals: Multi-stage builds](https://docs.docker.com/build/building/multi-stage/)

### 在 GitHub 发布 Docker 镜像

1. 在 GitHub 上创建一个 personal access token (classic)
2. 在 Docker CLI 中登录到 GitHub Container Registry

```sh
export CR_PAT=YOUR_TOKEN
echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
```

3. 标记镜像并推送到 GitHub Container Registry

```sh
docker -t <image> ghcr.io/<username>/<image>:<tag>
docker push ghcr.io/<username>/<image>:<tag>
```

[GitHub Docs: 使用容器注册表](https://docs.github.com/zh/packages/working-with-a-github-packages-registry/working-with-the-container-registry)

#### 将 Docker 镜像连接到 GitHub 仓库

在 GitHub 的 Profile 中，选择 Packages，找到刚刚推送的镜像，点击 `Connect to a repository`

或者，编辑镜像的 Dockerfile，加入以下内容：

```Dockerfile
LABEL org.opencontainers.image.source https://github.com/<username>/<repo>
```

## Trouble Shooting

### alpine apk 换源

#### 临时

```sh
apk add --repository http://mirrors.aliyun.com/alpine/v3.14/main/ --allow-untrusted --no-cache bash
```

#### 永久

```sh
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
```

在 `Dockerfile` 中有些命令写在一个 `RUN` 命令中会导致奇怪问题发生。

### 在 Alpine 中使用 Python 安装依赖时，在安装 cffi 时报错：

```
fatal error: Python.h: No such file or directory
```

解决方法：

```Dockerfile
RUN apk add --no-cache --update --virtual .build-deps \
    --repository http://mirrors.aliyun.com/alpine/v3.14/main/ \
    python3-dev \
    py3-pip \
    make \
    g++ \
    gcc \
    libc-dev \
    linux-headers \
    libffi-dev \
    openssl-dev
```

`python:alpine` 安装了 `python3-dev` 后，就可以正常安装 cffi 了。

[](https://stackoverflow.com/questions/21530577/fatal-error-python-h-no-such-file-or-directory)

> [Stack Overflow: What is .build-deps for apk add --virtual command](https://stackoverflow.com/questions/46221063/what-is-build-deps-for-apk-add-virtual-command)

### 将 build 镜像中的 .venv 拷贝到 runtime 后找不到 .venv/bin/python

原因是 build 镜像中 `.venv/bin/python -> /bin/local/python`，而 runtime 镜像的 Python 在 `/usr/bin/python3.10`。

需要在构建虚拟环境时指定 Python 安装位置：

```Dockerfile
RUN PIPENV_VENV_IN_PROJECT=1 pipenv --python /usr/bin/python3.10 && pipenv install
```

[A perfect way to Dockerize your Pipenv Python application](https://sourcery.ai/blog/python-docker/)

### Windows 目录挂载问题

如果要将 Windows 目录挂载到 Linux 容器中，需要开启目录共享功能。

[Docker Docs](https://docs.docker.com/docker-for-windows/#shared-drives)

进入设置：Resources > File sharing，添加要共享的目录。

如果没有该设置项，检查 General 下的 `Use the WSL 2 based engine`，确保取消勾选。

![Check checkbox](../assets/Docker%20Folder%20Sharing.png)

![Add shared folder](../assets/Docker%20Folder%20Sharing_1.png)
