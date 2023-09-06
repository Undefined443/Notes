# MySQL

## 忘记密码

```sh
sudo vim /etc/mysql/debian.cnf
```

记住里面的 `password` 值，然后用它来登录：

```sh
mysql -u debian-sys-maint -p
```

```sql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';  -- 修改密码为 password
```

[博客园: ubuntu 系统下 mysql 重置密码和修改密码操作](https://www.cnblogs.com/it-tsz/p/10206008.html)

[Stack Overflow: java.sql.SQLException: Access denied for user 'root'@'localhost' (using password: YES)](https://stackoverflow.com/questions/11922323/java-sql-sqlexception-access-denied-for-user-rootlocalhost-using-password)

## 执行 .sql 文件

### 方法一

登录 MySQL 后，执行 `source` 命令：

```sh
mysql -u root -p
mysql> use database_name;
mysql> source /path/to/file.sql;
```

> 文件名不要加引号

#### PowerShell

```powershell
Get-Content .\file.sql | mysql -u root -p
```

### 方法二

在终端中直接执行 .sql 文件：

```sh
mysql -u root -p database_name < /path/to/file.sql
```

## Q&A

Q: 在命令 `mysql -uroot -proot_password` 中，为什么密码和 `-p` 选项之间没有空格？

A: 在 MySQL 命令行工具中，当您使用 `-p` 选项时，密码和 `-p` 之间没有空格是因为这种设计可以防止密码泄漏。

当您在命令行中输入命令时，其他用户可能会通过 `ps` 命令（Linux/macOS）或 `tasklist` 命令（Windows）查看正在运行的进程。如果密码和-p选项之间有空格，那么密码可能会出现在这些命令的输出中，从而泄露给其他用户。

将密码紧挨着 `-p` 选项输入（即不使用空格），可以将密码作为命令选项的一部分，这样在进程列表中就不会显示密码。这提高了密码在命令行中使用的安全性。

然而，将密码直接写在命令行中仍然存在一定的安全风险。为了更安全地使用 MySQL 命令行工具，建议只使用 `-p` 选项，而不输入密码。这样，系统会提示您输入密码，而不是将密码直接暴露在命令行中。例如：

```sh
mysql -u root -p
```

在这种情况下，MySQL 命令行工具会提示您输入密码，而不会将密码显示在屏幕上或进程列表中。这样可以降低密码泄露的风险。

## DDL

```sql
SHOW DATABASES;  -- 显示所有数据库

CREATE DATABASE database;  -- 新建数据库
CREATE DATABASE IF NOT EXISTS database;

DROP DATABASE database;  -- 删除数据库
DROP DATABASE IF NOT EXISTS database;

USE database;  -- 使用数据库
SELECT DATABASE();  -- 显示当前使用的数据库

SHOW TABLES;  -- 显示数据库中的所有表

DESCRIBE table;  -- 查询表结构

CREATE TABLE table (  -- 创建表
  -- ...
);

DROP TABLE table;  -- 删除表
DROP TABLE IF EXISTS table;

/* 修改表 */
ALTER TABLE table1
RENAME TO table2;  -- 重命名表

ALTER TABLE table
ADD attribute type;  -- 增加属性

ALTER TABLE table
MODIFY attribute new_type;  -- 修改属性类型

ALTER TABLE table
CHANGE old_attribute new_attribute new_type;  -- 更改属性

ALTER TABLE table
DROP attribute;  -- 删除属性

CREATE VIEW view AS (SELECT ... FROM ...);

CREATE TABLE table AS (SELECT ... FROM ...);

CREATE TABLE table1 LIKE table2;
```

## DML

```sql
-- 增加数据
INSERT INTO table (attr1, attr2, ...)  -- (attr1, attr2, ...) 可省略
VALUES (val1, val2, ...), ...;

-- 更新数据
UPDATE table
SET attr1 = val1, attr2 = val2, ...
WHERE p;

-- 删除数据
DELETE FROM table
WHERE p;
```

## DQL

```sql
SELECT ...  -- 字段
FROM ...  -- 表
WHERE ...  -- 条件
GROUP BY ...  -- 分组
HAVING ...  -- 分组后条件
ORDER BY ...  -- 排序
LIMIT ...  -- 分页
```

## 实际开发

外键约束一定要单独写：`FOREIGN KEY (attr) REFERENCES table(attr);`  
不要这样写：`attr INT REFERENCES table(attr)`，这样加不上外键约束的。

### 远程连接

Server:

```sql
CREATE USER 'xiao'@'%' IDENTIFIED BY '1296954';  -- 创建用户，% 表示允许任意主机连接

GRANT ALL PRIVILEGES ON *.* TO 'xiao'@'%'
WITH GRANT OPTION;  -- 授权，允许用户对所有数据库进行任意操作
```

Client:

```sh
mysql -u xiao -p -h 192.168.1.109  # -h 参数指定数据库所在的主机
```

[Host 'xxx.xx.xxx.xxx' is not allowed to connect to this MySQL server](https://stackoverflow.com/questions/1559955/host-xxx-xx-xxx-xxx-is-not-allowed-to-connect-to-this-mysql-server)

### 修改密码

```sql
set global validate_password_policy=0;  -- 修改密码安全策略为低（只校验密码长度，至少 8 位）。
ALTER USER 'root'@'localhost' IDENTIFIED BY '12345678';

-- 授予 root 用户远程管理权限
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '12345678';
```

### [MySQL 变量](https://stackoverflow.com/questions/11754781/how-to-declare-a-variable-in-mysql)

```sql
-- 用户变量，前缀为 @，可以不声明就使用（初始值为 NULL）
SET @var1 = 1, @var2 = 2;
SELECT @var1 := 1, @var2 := 2;  -- SELECT 必须用 := 赋值

-- 局部变量，必须在 BEGIN ... END 中声明后再使用
BEGIN
  DECLARE var INT DEFAULT 1;
END;

-- 系统变量，前缀为 @@
SHOW VARIABLES LIKE 'sort_buffer_size';  -- 查看变量值
SELECT @@sort_buffer_size;

SET GLOBAL sort_buffer_size=1000000;  -- 修改变量值
SET SESSION sort_buffer_size=1000000;
```
