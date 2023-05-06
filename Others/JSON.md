# JSON

JavaScript Object Notation

## 表示数据的方式

Object: 键值对的集合，使用花括号 `{}` 来定义。键值对之间用逗号分隔。

Array: 值的有序集合，使用方括号 `[]` 来定义。值之间用逗号分隔。

> 所有 JSON 数据需要包裹在一个花括号中，类似于 JavaScript 中的对象。

### JSON 中的键

键需要以字符串的形式定义，即在双引号中 `" "` 定义（不能是单引号）。键和值之间用冒号分隔。

键必须是唯一的，否则后定义的键值对会覆盖前面的键值对。

### JSON 中的值

值可以是以下数据类型：

- 数字（整数或浮点数）
- 字符串（需要在双引号中定义）
- 布尔值（true 或 false）
- 数组（在方括号中定义）
- 对象（在花括号中定义）
- null（空）

> JSON 中不可以使用八进制或十六进制表示数字。
>
> JSON 中没有日期类型，因此您只能通过日期的字符串（e.g. 1970-01-01）或者时间戳（e.g. 1632366361）来表示日期
>
> JSON 中不能定义注释

```json
{
  "number":123,
  "float":3.14,
  "string":"C语言中文网",
  "bool":true,
  "array":[
    "employees",
    {"name":"peter", "age": 18},
    {"name":"Anna", "age": 16}
  ],
  "object":{
    "name":"C语言中文网",
    "url":"http://c.biancheng.net/"
  }
}
```

### JSON 数据类型

简单数据类型：

- string
- number
- boolean
- null

复杂数据类型：

- Object
- Array

#### string

JSON 中的字符串需要使用双引号定义（注意：不能使用单引号），字符串中可以包含零个或多个 Unicode 字符。另外，JSON 的字符串中也可以包含一些转义字符，例如：

|转义字符|含义|
|:--:|:-|
|\\|反斜线本身|
|\/|正斜线|
|\"|双引号|
|\b|退格|
|\f|换页|
|\n|换行|
|\r|回车|
|\t|水平制表符|
|\u|四位的十六进制数字|

#### number

JSON 中不区分整型和浮点型，只支持使用 **IEEE-754 双精度浮点格式**来定义数字。此外，JSON 中不能使用八进制和十六进制表示数字，但可以使用 e 或 E 来表示 10 的指数。

#### Object

对象是一个**无序的**键值对的集合。对象由花括号 `{ }` 以及其中的若干键值对组成，一个对象中可以包含零个或多个键值对，每个键值对之间用逗号分隔。

整个 JSON 就是一个对象类型。

> 对象中的最后一个键值对的末尾不需要添加逗号。

#### Array

数组是值的有序集合。数组由方括号 `[ ]` 和其中的若干值组成，值可以是 JSON 中支持的任意类型，每个值之间用逗号分隔。

> 数组中的最后一个值的末尾也不需要添加逗号。

```json
{
  "course" : [
    "JSON 教程",
    "JavaScript 教程",
    "HTML 教程",
    {
      "website" : "C语言中文网",
      "url" : "http://c.biancheng.net"
    },
    [
      3.14,
      true
    ],
    null
  ]
}
```

### JSON 注释

JSON 不允许添加注释。为了使用注释，我们可以使用以下几种方法：

#### 使用特殊的键名

给要注释的键值对添加一个同名的键，并在键名中添加一个特殊字符加以区分，如 `@`，`#`，`?`,`_`，`/` 等，然后在值中定义注释的内容。

> :bulb:**Tip:** 在键名中添加特殊字符时，应尽量避免 `:`，`{`，`}`，`[`，`]` 等 JSON 中常用的字符。

```json
{
  "@name": "网站名称",
  "name": "C语言中文网",
  "_url": "网址",
  "url": "http://c.biancheng.net/",
  "course": "JSON 教程",
  "@charge": "0=收费; 1=免费",
  "charge": 1,
  "#list": "教程目录",
  "list": [
    "JSON数据类型",
    "JSON对象",
    "JSON数组"
  ],
  "message": {
    "code": 0,
    "message": "OK",
    "#data": {
      "#id": "用户ID",
      "#type": "0=正常; 1=异常",
      "#name": "姓名",
      "#createTime": "创建时间(yyyy-MM-dd)"
    },
    "data": {
      "id": "12345",
      "type": 0,
      "name": "我的名字",
      "createTime": "2020-05-20"
    }
  }
} 
```

也可以直接以 “comment”，“_comment” 或 “__comment” 作为键名来定义注释：

```json
{
  "_comment": "C语言中文网（http://c.biancheng.net/）—— 一个在线学习编程的网站",
  "course": {
    "name": "JSON 教程",
    "url": "http://c.biancheng.net/json/index.html"
  }
}
```

> 之所以不允许添加注释，是因为 JSON 主要是用来存储数据的，过多的注释会对数据的可读性造成影响，同时也会造成数据体积变大，进而影响数据传输、解析的速度。

## JSON5

JSON5 是由开发人员创建并在 [GitHub](https://github.com/json5/json5/tree/4cf57da675f55c619f959132eb58a5683ca4a9c7) 上发布的 JSON 的非官方标准，可以将它看作是 JSON 的升级版。JSON5 主要是通过引入部分 ECMAScript5.1 的特性来扩展 JSON 语法，减少 JSON 的某些限制，同时兼容现有的 JSON 格式。

与 JSON 相比，JSON5 做出了如下改变：

- 在对象或数组的末尾（即最后一个键值对或值）可以添加逗号
- 字符串可以使用单引号定义
- 字符串中可以包含转义字符，并且可以跨越多行
- 可以定义十六进制的数字
- 数字可以包含前导或后导的小数点
- 数字前可以添加一个加、减号来表示正负数
- 可以使用 `//` 来定义单行注释，使用 `/* ... */` 来定义多行注释

[使用 JSON5](http://c.biancheng.net/json/comments.html)

## JSON Schema

JSON Schema 可以用来限定要在 JSON 中出现的字段、字段含义、字段类型等信息。详见 [JSON Schema（模式）](http://c.biancheng.net/json/schema.html)

从 [JSON Schema 官网](https://json-schema.org/implementations.html)查找合适的 JSON Schema 库，或者通过[在线工具](https://jsonschemalint.com/#!/version/draft-04/markup/json)来使用 Schema。

## JSON 对比工具

[JSON 对比工具](http://c.biancheng.net/json/compare.html)

使用 VS Code 进行对比：选中要对比的文件，在右键菜单中选择 “Select for Compare”，然后选中第二个要对比的文件，在右键菜单中选择 “Compare with Selected”。

## JSON 在编程语言中的解析和创建

[Python](http://c.biancheng.net/json/python-json.html)

[Java](http://c.biancheng.net/json/java-json.html)

[Ajax](http://c.biancheng.net/json/ajax-json.html)