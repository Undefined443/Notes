# Spring Boot

表示层 > 业务层 > 持久层 > 数据库

使用分层结构进行解耦

## 表示层

### controller 包

用来存放表示层的各种动作类。

命名规范：`xxxController`

如何让一个类变为动作类：使用 `@RestControl` 注解

```java
package com.hello.controller;

@RestController  // 让 Spring Boot 认识这个类是动作类
public class HelloController {

  /* 不使用 MyBatis */
  
  @Resource  // 让 Spring Boot 自动给变量赋值
  private HelloService helloService;  // Spring Boot 会自动将 HelloService 对象赋值给 helloService 变量
  
  @RequestMapping("/hello")    // 让该方法变成一个动作方法
  // 指定当前方法和一个 URL 的对应关系。当你在浏览器中访问这个 URL 的时候，就会执行这个方法。URL 路径名通常和方法名相同
  public String hello() {
    String data = helloService.saveHello();  // 不使用 MyBatis，使用了自定义的方法
    return data;  // 方法被调用时会将 data 的值作为 HTML 页面 <body> 标签的内容
  }

  /* 使用 MyBatis */
  
  @Resource
  private MybatisService mybatisService;
  
  @RequestMapping("/mybatis")
  public List<User> mybatis() {
    List<User> data = mybatisService.list();
    return data;
  }
}
```

## 业务层

面向接口编程，业务层包括业务层接口和其实现类。

### service 包

存放各种接口。命名规范：`xxxService`

```java
package com.hello.service;

// 接口，一组规范，规定

/* 不使用 MyBatis */
public interface HelloService {
  int saveHello();
}

/* 使用 MyBatis */
public interface MybatisService extends IService<User> {
  // 需要用到的方法已经被 MyBatis 定义了，因此这里为空
}
```

#### impl 包

存放接口的实现类。命名规范：`xxxServiceImpl`

```java
package com.hello.service.impl;

/* 不使用 MyBatis */
@Service  // 让 Spring Boot 认识这个类是业务层类
public class HelloServiceImpl implements HelloService {  // 接口实现类，必须重写接口中的规范
  @Resource  // 让 Spring Boot 将实际的对象赋值给变量
  private HelloDao helloDao;  // 声明持久层变量
  
  @Override  // 让编译器检查是否重写了接口方法
  public String saveHello() {
    String data = helloDao.selectHello();
    return data;
  }
}
  
/* 使用 MyBatis */
@Service
public class MybatisServiceImpl implements MybatisService extends ServiceImpl<UserMapper, User> {  
}
```

> 如果遗漏 `@Service` 注解，那么在启动程序时会出现报错：`A component required a bean of type 'HelloService' that could not be found.`

## 持久层

持久层使用的框架是 MyBaits（不属于 Spring 家族）。为了简化操作，可以使用 MyBatis-Plus（MyBatis 的增强工具）。

涉及到持久层，一定需要数据库驱动。（手动下载或者使用 Maven 下载）为了提高效率，MyBatis 需要数据源连接池，常见：dpcp2、druid（阿里，国内常用），Spring Boot 内置有连接池。

如果使用了 MyBatis，那么持久层就是接口。如果不使用，那么就是写自己的类。

持久层包名规范：dao（不使用 MyBatis）、mapper（使用 MyBatis）

让表示层调用业务层，让业务层调用持久层，让持久层调用数据库。

### 不使用 MyBatis

```java
package com.hello.dao;

// 持久层类，能对表进行 CURD
@Repository  // 让 Spring Boot 认识这个类是持久层类
public class HelloDao {
  public String selectHello() {  
    String data = "模拟，在 hello 表中查询到了数据，存放在 data 变量中";
    return data;
}
```

### 使用 MyBatis

在 POM 中导入持久层依赖：

```xml
<!-- mysql 驱动 -->
<dependency>
  <groupId>mysql</groupId>
  <artifactId>mysql-connector-java</artifactId>
  <version>8.0.28</version>
</dependency>

<!-- mybatis plus -->
<!-- 可以看到该依赖中包含了 mybatis 和 spring jdbc -->
<dependency>
  <groupId>com.baomidou</groupId>
  <artifactId>mybatis-plus-boot-starter</artifactId>
  <version>3.5.2</version>
</dependency>

<!-- spring jdbc -->
<!-- 可以看到该依赖中包含了 HikariCP 连接池 -->
<!-- 由于 mybatis plus 已经包含了该依赖，因此该依赖可以省去 -->
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>
```

创建实体类包 `entity` 和实体类（用于封装数据库数据的类）

```java
package com.hello.entity;

// 可以使用 lombok 插件自动生成 get 和 set 方法，以及 toString 方法
@Getter
@Setter
@ToString
// 实体类，封装和保存表数据
public class User {  // 封装 User 表
  // id, uname, pass, addr
  //为了安全，字段必须为 private
  @TableId(type = IdType.AUTO)  // 指定主键以及主键生成策略
  private Integer id;
  private String uname;
  private String pass;
  private String addr;
  
  // 为每个字段生成 get 和 set 方法
  
  // 为每个字段生成 toString 方法
}
```

创建持久层类

```java
package com.hello.mapper;

public interface UserMapper extends BaseMapper<User> {  // 使用 MyBatis-Plus 的方法很简单，只需继承 BaseMapper 类。操作哪个实体类，范型就是谁。
}
```

创建数据库

```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMATY KEY,
  uname VARCHAR(40) NOT NULL,
  pass VARCHAR(40) NOT NULL,
  addr VARCHAR(40)
)

INSERT INTO users VALUES (NULL, 'admin', 'admin', 'NewYork'), (NULL, 'zhangsan', '123456', NULL);
```

在主配置类上扫描 Mapper 接口

```java
package com.hello;

@SpringBootApplication
@MapperScan("com.hello.mapper")  // 扫描 Mapper 接口
public class DemoApplication {
  
  public static void main(String[] args) {
    SpringApplication.run(DemoApplication.class, args);
  }
}
```

> 业务层接口继承 `IService<T>` 类
>
> 业务层实现类继承 `ServiceImpl<M, T>` 类
>
> 持久层接口继承 `BaseMapper<T>` 类

> 数据库表名、列名：first_name
>
> Java 类名、变量名: FirstName
>
> MyBatis 会自动对应。

## resources 文件夹

### static 文件夹

web 服务器的文件夹

### application.properties

各种配置项

```properties
# 端口
server.port=8080

# 数据源
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
# jdbc:protocol://ip:port/database
spring.datasource.url=jdbc:mysql://localhost:3306/xdsx
spring.datasource.username=root
spring.datasource.password=

# MyBatis-Plus 的设置
mybatis-plus.configuration.log-impl=org.apache.ibatis.logging.stdout.StdOutImpl  # 将日志打印到控制台
```

## POM

### dependencies

Spring Boot 的各种 starter 类：就是各种启动器

比如，加了 test 启动器，就可以通过增加 `@Test` 注解来使非 main 方法作为主方法运行。加了 web 启动器，就可以获得一个Tomcat Web 服务器（目录结构会出现服务器的 static 文件夹）（开发 Web 应用程序必须使用 web 启动器）。

`spring-boot-starter-web` 和 `spring-boot-starter` 的关系：前者包含后者

## 测试

GET 请求：参数在 `Params` 中

POST 请求：参数在 `Body` 中

```json
{
  "uname": "zhangsan",
  "pass": "123456",
  "addr": "NewYork"
}
```

## CRUD

Controller 类：

```java
@RequestMapping("/get_all_user")
public List<User> getAllUser() {
  return mybatisService.list();
}

@RequestMapping("/save_user")
// /save_user?id=1&uname=zhangsan&pass==123456&addr=NewYork
public String saveUser(User user) {
  return mybatisService.save(user) ? "添加成功" : "添加失败";
}

@RequestMapping("/update_user")
public String updateUser(User user) {
  return mybatisService.updateById(user) ? "修改成功" : "修改失败";
}

@RequestMapping("/delete_user")
public String deleteUser(Integer id) {
  return mybatisService.removeById(id) ? "删除成功" : "删除失败";
}

@RequestMapping("/get_by_id")
public User getById(Integer id) {  // 测试时在浏览器中访问 /get_by_id?id=1
  return mybatisService.getById(id);
}

// 使用 POST 方法
@PostMapping("/login")
    public User login(@RequestBody User user) {  // 要求从请求体中寻找参数
        String uname = user.getUname();
        String pass = user.getPass();
        QueryWrapper<User> wrapper = new QueryWrapper<>();  // 获取一个查询包装器
        wrapper.eq("uname", uname);  // 设置一个查询条件：数据库的 username 与参数 uname 的值相等
        wrapper.eq("pass", pass);
        return testService.getOne(wrapper);  // 查询并返回一条数据
    }
```

测试可以使用 `Apifox`

## 分页

MyBatis-Plus 中已经封装了分页功能，需要添加分页插件。

在主配置类中添加分页拦截器：

```java
@Bean
public MybatisPlusInterceptor mybatisPlusInterceptor() {
  MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
  interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
  return interceptor;
}
```

在 Controller 类中使用分页功能：

```java
@RequestMapping("select_page")
public IPage<User> selectPage(Integer current, Integer size) {
  Page<User> page = new Page<>(current, size);
  return testService.page(page);
}
```

## 案例

### 登陆

```js
// 校验请求参数
if (uname === '' || pass === '') {
  this.msg = '用户名或密码不能为空';
  return;
}
axios.get("http://localhost:8081/login"), {
        params: {  // 请求参数
          uname: this.uname,
          pass: this.pass
        }
      .then(response => {
        if (response.data) {
          this.$router.push("/home");  // 跳转到 home 页面
        } else {
          alert("用户名或密码错误");
        }
      })
      .catch(err => {
        console.log(err);
      })
}

```

```java
// 动作类
@RequestMapping("/login")
public User login(String uname, String pass) {  // /login?uname=xxx&pass=xxx
  QueryWrapper<User> wrapper = new QueryWrapper<>();  // 获取一个查询包装器
  wrapper.eq("username", uname);  // 设置一个查询条件：数据库的 username 与参数 uname 的值相等
  wrapper.eq("password", pass);
  return userService.getOne(wrapper);  // 查询并返回一条数据
}
```

### 上传文件

使用 `MultipartFile` 类型对象接收上传的文件。

```java
@PostMapping("/upload")
public String upload(String uname, MultipartFile head, HttpRequest request) throws IOException {
  String fileNmae = head.getOriginalFilename();  // 获取文件名
  request.getServletContext().getRealPath("/image");  // 获取上传路径
  
  // 确保上传目录存在
  if (!new File(path).exists()) {
    new File(path).mkdirs();
  }
  File file = new File(path, fileName);
  head.transferTo(file);  // 将上传的字节流传入文件
  return "success";
}
```

`application.properties`

```properties
spring.servlet.multipart.max-file-size=1MB
spring.servlet.multipart.max-file-size=10MB
```

## 实用插件

MyBatisX：自动生成实体层、业务层、持久层代码
