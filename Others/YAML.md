# YAML

[阮一峰：YAML 语言教程][ruanyf]

[The Official YAML Web Site](https://yaml.org/)

[ruanyf]: https://www.ruanyifeng.com/blog/2016/07/yaml.html

[Tutorials Point: YAML Tutorial](https://www.tutorialspoint.com/yaml/index.htm)

YAML (/ˈjæməl/)
: YAML Ain't Markup Language

## 基础元素

### 对象

```yml
# 写法一
animal: pets
# { "animal": "pets"}

# 写法二
hash: { name: Steve, foo: bar }
# { "hash": { "name": "Steve", "foo": "bar" } }
```

> 注释中给出的是 JSON 的写法  
> 和 JSON 一样，整个 YAML 文件也是一个对象

### 数组

```yml
# 写法一
- Cat
- Dog
- Goldfish
# [ "Cat", "Dog", "Goldfish" ]

# 写法二
animal: [Cat, Dog]
# { "animal": [ "Cat", "Dog" ] }
```

### 纯量 (scalar)

最基本的、不可再分的值。

```yml
name: Steve  # 字符串
age: 18  # 整数
pi: 3.14  # 浮点数
isMale: true  # 布尔值
isSingle: null  # null，也可以写成 ~
birthday: 1999-12-31  # 日期，ISO 8601 格式
time: 12:00:00  # 时间，ISO 8601 格式
```

ISO 8601 格式：

- 日期 `YYYY-MM-DD`
- 时间 `hh:mm:ss`
- 日期和时间 `YYYY-MM-DDThh:mm:ss`
- 日期和时间，带时区 `YYYY-MM-DDThh:mm:ss±hh:mm`

`2001-12-14t21:59:43.10-05:00` 表示 2001 年 12 月 14 日 21 点 59 分 43.10 秒，美国东部时间 5 个小时以前。

#### 强制类型转换

```yml
a: !!str 123  # 强制转换为字符串
b: !!int "123"  # 强制转换为整数
c: !!float "123"  # 强制转换为浮点数
d: !!bool "true"  # 强制转换为布尔值
```

#### 字符串

- 字符串默认不使用引号表示，但是如果字符串中包含空格或特殊字符，就必须使用引号。
- 单引号和双引号的区别在于：1. 双引号内部可以使用变量，单引号内部不能使用变量；2. 单引号不会对特殊字符进行转义，双引号会对特殊字符进行转义。

```yml
# 单引号不会转义特殊字符
s1: 'aaa\nbbb'
s2: "aaa\nbbb"
# { "s1": "aaa\\nbbb", "s2": "aaa\nbbb" }

# 单引号中如果还有单引号，需要使用两个单引号表示
str: 'labor''s day'
# { 'str': 'labor\'s day' }

# 字符串可以写成多行，后续行必须有一个单空格缩进。换行符会被转为空格
str: line1
 line2
 line3
# { "str": "line1 lin2 line3" }

# 使用 | 保留换行符，> 折叠换行
s1: |
  line1
  line2
s2: >
  line1
  line2
# { "s1": "line1\nline2\n", "s2": "line1 line2\n" }

# 使用 + 保留文字块末尾的换行，- 删除文字块末尾的换行
s1: |
  Foo

s2: |+
  Foo


s3: |-
  Foo
# { "s1": "Foo\n", "s2": "Foo\n\n\n", "s3": "Foo" }
```

#### 引用

锚点 `&` 和 别名 `*`，可以用来引用

```yml
defaults: &defaults  # & 建立锚点
  adapter:  postgres
  host:     localhost

development:
  database: myapp_development
  <<: *defaults  # * 引用锚点，<< 表示合并到当前数据

test:
  database: myapp_test
  <<: *defaults
```

等价于

```yml
defaults:
  adapter:  postgres
  host:     localhost

development:
  database: myapp_development
  adapter:  postgres
  host:     localhost

test:
  database: myapp_test
  adapter:  postgres
  host:     localhost
```

另一个例子

```yml
- &showell Steve 
- Clark 
- Brian 
- Oren 
- *showell
# [ 'Steve', 'Clark', 'Brian', 'Oren', 'Steve' ]
```

#### 函数和正则表达式的转换

[JS-YAML](https://github.com/nodeca/js-yaml) 库特有的功能，可以把函数和正则表达式转为字符串。

*example.yml*

```yml
fn: function () { return 1 }
reg: /test/
```

解析上面的 yml 文件的代码如下：

```js
const yaml = require('js-yaml');
const fs   = require('fs');

try {
  let doc = yaml.load(
    fs.readFileSync('./example.yml', 'utf8')
  );
  console.log(doc);
} catch (e) {
  console.log(e);
}
```

从 JavaScript 对象还原到 yml 文件的代码如下：

```js
const yaml = require('js-yaml');
const fs   = require('fs');

let obj = {
  fn: function () { return 1 },
  reg: /test/
};

try {
  fs.writeFileSync('./example.yml', yaml.dump(obj), 'utf8');
} catch (e) {
  console.log(e);
}
```
