# JavaScript

## NVM

[![Node Version Manager](https://raw.githubusercontent.com/nvm-sh/logos/HEAD/nvm-logo-color.svg)](https://github.com/nvm-sh/nvm)

官方声明不要使用 brew 安装 NVM

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```

[在 Windows 上安装 Node.js](https://docs.microsoft.com/zh-cn/windows/dev-environment/javascript/nodejs-on-windows)

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

## MDN Docs 学习笔记

[MDN Docs](https://developer.mozilla.org/zh-CN/docs/Learn/JavaScript/First_steps)

[廖雪峰：JavaScript 教程](https://www.liaoxuefeng.com/wiki/1022910821149312)

在 `.html` 文件中引入 JavaScript

```html
<!-- 在 </body> 标签前的新行添加以下代码 -->
<script> src="scripts/main.js" defer></script>
```

> 浏览器会按照代码在文件中的顺序加载 HTML。如果先加载的 JavaScript 想要修改其下方的 HTML，那么它可能由于 HTML 尚未被加载而失效。因此，将 JavaScript 代码放在 HTML 页面的底部附近通常是最好的策略。

如何确保 JavaScript 代码在 HTML 加载完成后再执行？

- 在 `<script>` 标签中添加 `defer` 属性
- HTML 文档全部加载完毕时会触发 window.onload 事件，可以在这个事件中执行 JavaScript 代码

```js
window.onload = function() {
  // JavaScript 代码
}
```

## 变量

使用关键字 `let` 或 `var` 声明变量。

```js
let myVariable;  // 尽管分号不是必需的，但建议加上
var beatles = [];
```

### Object 与 Array

```js
// Object
let person = {
  name: 'Bob',
  age: 20,
  tags: ['js', 'web', 'mobile'],  // Array
  city: 'Beijing',
  hasCar: true,
  zipCode: null
};
console.log(person.name);   // 输出 Bob
console.log(person.tags);   // 输出 [js, web, mobile]
console.log(person.arr[0]); // 输出 js
```

## 运算符

全等 `===`

非全等 `!==`

普通的相等 `==` 运算符允许类型转换，而全等不允许：

```js
var a = 25;
var b = "25";
console.log(a == b);   // 输出 true
console.log(a === b);  // 输出 false
```

[表达式和运算符](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators)

## 函数

```js
function add(num1, num2 = 0) {  // 可以使用参数默认值
  let result = num1 + num2;
  return result;
}
```

```js
// 函数可以存储在变量，对象，数组中
let fun = function() {  // 这也叫做函数表达式
  console.log("http://c.biancheng.net/js/");
}

// 函数还可以作为参数传递给其他函数，或者从其他函数返回
function createGreeting(name) {
  return "Hello, " + name;
}
function displayGreeting(greetingFunction, userName) {
  return greetingFunction(userName);
}
let result = displayGreeting(createGreeting, "Peter");
console.log(result);  // 输出 Hello, Peter
```

## JS 输出语句

```js
alert(message);       // 弹出一个提示框，只能输出文本内容
confirm(message);     // 弹出一个对话框
console.log(message); // 在浏览器的控制台输出内容，可以输出对象
document.write(exp1, exp2, exp3, ...);     // 将内容写入到 HTML 文档中

// 和前面的函数不一样，innerHTML 是一个属性而不是函数。可以获取或设置 HTML 标签中的内容。
var demo = document.getElementById("demo");
console.log(demo.innerHTML);
demo.innerHTML = "<h2>innerHTML</h2>"
```

## JS 结构语句

JavaScript 中的 `if else`，`while`，`for` 语句都和 Java 相同。除此之外，JavaScript 还拥有 `for in` 和 `for of` 语句。

### for in

`for in` 循环用来遍历 Object，在每次循环中，会将 Object 中的一个属性的 key 赋给循环变量。

```js
let person = {"name": "Clark", "surname": "Kent", "age": "36"};

for (let prop in person) {
  console.log(prop + " = " + person[prop]); // 输出键及对应的值
}
```

### for of

```js
// 遍历数组
let arr = ['a', 'b', 'c', 'd'];
for (let value of arr) {
  console.log(value + ", "); // 输出 a, b, c, d
}

// 遍历字符串
let str = "Hello";
for (let value of str) {
  console.log(value + ", "); // 输出 H, e, l, l, o, 
}
```

JavaScript 中的 `break` 和 `continue` 也和 Java 的用法一样（可以使用 `label`）

## I/O

### 终端输入

使用前需要安装 readline-sync 包：`npm install readline-sync`

```js
const readlineSync = require("readline-sync");
let ans = readlineSync.question("What's your answer?\n");
```

### 文件输入

```js
const fs = require("fs");
const content = fs.readFileSync("fileName", "utf8");
```

如果使用 `readFile` 输入，需要注意其有一个回调函数异步调用的问题：用于接受输入内容的回调函数并不会立即执行，最先执行的语句是 `readFile` 下面的语句。而回调函数则是等系统调用完成以后才执行。

```js
const fs = require("fs");
fs.readFile(file, "utf8", (err, content) => {
    if (err) {
      // 处理错误
      console.log("No such file");
      process.exit(1);
    }
    console.log(content); // 使用读取内容
  });
  console.log("我先被调用");
```

### 文件输出

```js
const fs = require("fs");
  fs.writeFile(file, JSON.stringify(data, null, "  "), (err) => {
    if (err) {
      console.log("Write file error");
      process.exit(1);
    }
    console.log("success");
  });
```

### 正则表达式

[MDN Docs: 正则表达式](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Guide/Regular_Expressions)

[Runoob：RegExp 对象](https://www.runoob.com/jsref/jsref-obj-regexp.html)

## DOM

[文档对象模型(DOM)](https://developer.mozilla.org/zh-CN/docs/Web/API/Document_Object_Model)

### HTML-DOM

> DOM Core 适用于所有标记文档，而 HTML-DOM 只适用于 HTML 文档。

```js
node.href = "";
node.src = "";
```

```js
node.nodeType;  // 获取节点类型；1:元素 2:属性 3:文本
node.nodeName;  // 获取节点名
node.nodeValue;  // 获取节点值

node.childNodes;  // 获取子节点
node.firstChild;  // 获取第一个子节点
node.lastChild;  // 获取最后一个子节点

node.getAttribute('name');  // 获取属性值
node.setAttribute('name', 'value');  // 设置属性值

node.onclick = function() {};  // 为元素添加事件处理程序

document.getElementByID("id");
document.getElementsByClassName("class_name");
document.getElementsByTagName("tag_name");
```

## 常用语句

```js
document.getElementByTagName("name"); // 通过标签名获得一个标签集
document.querySelector("selector");   // 使用 CSS 选择器选择元素
elem.innerHTML("content");            // 设置 elem 标签的内容，可解析 HTML 元素。
elem.textContent = "message";         // 设置 elem 标签的内容
elem.getAttribute("name");
elem.setAttribute("name", "value");

localStorage.setItem("name", "value");

elem.addEventListener('click', func); // 为元素添加事件监听器
```

### console

```js
console.table(arr);       // 以表格的形式输出数组和对象

console.time("label");
console.timeEnd("lebel"); // 计算过程用时

console.dir(elem);        // 输出 HTML 元素
```

#### console.log 输出颜色

`npm install colors`

```js
const colors = require("colors");

console.log("hello".green);
console.log("I like cake and pies".underline.red);
console.log("Inverse the color".inverse);
console.log("OMG Rainbows!".rainbow);
console.log("Run the trap".trap);
```

## Troubleshooting

### npm install Error: rollbackFailedOptional

```sh
npm config rm proxy
npm config rm https_proxy

npm config set registry https://registry.npmjs.org/
```

## JavaScript 高级程序设计

ECMAScript: JavaScript 的标准

: ECMA ("ek-ma-script")
European Computer Manufacturers Association (欧洲计算机制造商协会）

### with 语句

```js
// 可以将这些语句
var qs = location.search.substring(1);
var hostName = location.hostname;
var url = location.href;
// 改写为
with(location) {
  var qs = search.substring(1);
  var hostName = hostname;
  var url = href;
}
```

在 `with` 语句的代码块内部，每个变量首先被认为是一个局部变量，而如果在局部环境中找不到该变量的定义，就会查询 `location` 对象中是否有同名的属性。

> 由于大量使用 `with` 语句会导致性能下降，同时也会给调试代码造成困难，因此在开发大型应用时，不建议使用 `with` 语句。

### switch

JavaScript 的 `switch` 的 `case` 表达式可以不是常量表达式：

```js
var num = 25;
switch (true) {
  case num < 0:
    alert("Less than 0.");
    break;
  case num >= 0 && num <= 10:
    alert("Between 0 and 10.");
    break;
  case num > 10 && num <= 20:
    alert("Between 10 and 20");
    break;
  default:
    alert("More than 20.");
}
```

> `switch` 语句在比较值时使用的是全等操作符，因此不会发生类型转换（例如，字符串 "10" 不等于数值 10）。

### function

ECMAScript 中函数的参数在内部是用一个数组来表示的，函数接收到的始终都是这个数组，而不关心数组中包含哪些参数（如果有参数的话）。如果这个数组中不包含任何元素，无所谓；如果包含多个元素，也没有问题。实际上，在函数体内可以通过 `arguments` 对象来访问这个参数数组，从而获取传递给函数的每一个参数。

其实，`arguments` 对象只是与数组类似（它并不是`Array`的实例），因为可以使用方括号语法访问它的每一个元素（即第一个元素是 `arguments[0]`，第二个元素是`arguments[1]`，以此类推），使用 `length` 属性来确定传递进来多少个参数。

```js
function sayHi() {
  alert("Hello " + arguments[0] + "," + arguments[1]);
}
```

这个例子说明了 ECMAScript 函数的一个重要特点：命名的参数只提供便利，但不是必须的。

关于 `arguments` 的行为，还有一点比较有意思。那就是它的值永远与对应命名参数的值保持同步。例如：

```js
function doAdd(num1, num2) {
  arguments[1] = 10;
  alert(arguments[0] + num2);
}
```

每次执行这个 `doAdd()` 函数都会重写第二个参数，将第二个参数的值修改为10。因为 `arguments` 对象中的值会自动反映到对应的命名参数，所以修改 `arguments[1]`，也就修改了 `num2`，结果它们的值都会变成10。不过，这并不是说读取这两个值会访问相同的内存空间；**它们的内存空间是独立的，但它们的值会同步。**另外还要记住，如果只传入了一个参数，那么为 `arguments[1]` 设置的值不会反映到命名参数中。**这是因为 `arguments` 对象的长度是由传入的参数个数决定的，不是由定义函数时的命名参数的个数决定的。**

关于参数还要记住最后一点：没有传递值的命名参数将自动被赋予 `undefined` 值。这就跟定义了变量但又没有初始化一样。例如，如果只给 `doAdd()` 函数传递了一个参数，则 `num2` 中就会保存 `undefined` 值。

ECMAScript 中的所有参数传递的都是值，不可能通过引用传递参数。

ECMAScript 函数不能像传统意义上那样实现重载。而在其他语言（如 Java）中，可以为一个函数编写两个定义，只要这两个定义的签名（接受的参数的类型和数量）不同即可。如前所述，ECMAScript 函数没有签名，因为其参数是由包含零或多个值的数组来表示的。而没有函数签名，真正的重载是不可能做到的。

如果在 ECMAScript 中定义了两个名字相同的函数，则名字只属于后定义的函数。

通过检查传入函数的参数的类型和数量并作出不同的反应，可以模仿函数重载。

### reference

对引用数据类型的赋值，复制的是对象的引用：

```js
var obj1 = new Object();
var obj2 = obj1;
obj1.name = "Nicholas";
alert(obj2.name);  // "Nicholas"
```

在向函数参数传递引用类型的值时，会把这个值在内存中的地址复制给一个局部变量，因此这个局部变量的变化会反映在函数的外部。

```js
function setName(obj) {
  obj.name = "Nicholas";
}

var person = new Object();
setName(person);
alert(person.name);  // "Nicholas"
```

### 检测类型

要检测一个变量是不是基本数据类型，可以用 `typeof` 操作符，它可以确定一个变量是 `string`，`number`，`boolean`，`undefined`，还是 `object`：

```js
var s = "Nicholas";
alert(typeof s);  // string
```

为了检测对象是哪种类的实例，可以使用 `instanceof` 操作符。如果变量是给定引用类型（根据它的原型链来识别）的实例，那么 `instanceof` 操作符就会返回 `true`。

```js
alert(person instanceof Object);  // ECMAScript 的所有对象都是 Object 的实例
alert(pattern instanceof RegExp);
```

### 执行环境及作用域

每个执行环境都有一个与之关联的变量对象（variable object），环境中定义的所有变量和函数都保存在这个对象中。

全局执行环境是最外围的一个执行环境。根据 ECMAScript 实现所在的宿主环境不同，表示执行环境的对象也不一样。在 Web 浏览器中，全局执行环境被认为是 `window` 对象，因此所有全局变量和函数都是作为 `window` 对象的属性和方法创建的。

每个函数都有自己的执行环境。当执行流进入一个函数时，函数的环境就会被推入一个环境栈中。而在函数执行之后，栈将其环境弹出，把控制权返回给之前的执行环境。

当代码在一个环境中执行时，会创建变量对象的一个作用域链（scope chain）。作用域链的用途，是保证对执行环境有权访问的所有变量和函数的有序访问。作用域链的前端，始终都是当前执行的代码所在环境的变量对象。如果这个环境是函数，则将其活动对象（activation object）作为变量对象。活动对象在最开始时只包含一个变量，即 `arguments` 对象（这个对象在全局环境中是不存在的）。作用域链中的下一个变量对象来自包含（外部）环境，而再下一个变量对象则来自下一个包含环境。这样，一直延续到全局执行环境；全局执行环境的变量对象始终都是作用域链中的最后一个对象。

#### 延长作用域链

虽然执行环境的类型总共只有两种——全局和局部（函数），但还是有其他办法来延长作用域链。这么说是因为有些语句可以在作用域链的前端临时增加一个变量对象，该变量对象会在代码执行后被移除。

当执行流进入下列任何一个语句时，作用域链就会得到加长：

- `try-catch` 语句的 `catch` 块；
- `with` 语句。

对 `with` 语句来说，会将指定的对象添加到作用域链中。对 `catch` 语句来说，会创建一个新的变量对象，其中包含的是被抛出的错误对象的声明。

```js
function buildUrl() {
  var qs = "?debug=true";
  with(location){
    var url = href + qs;  // var url = location.href + qs
  }
  return url;
}
```

在此，`with` 语句接收的是 `location` 对象，因此其变量对象中就包含了 `location` 对象的所有属性和方法，而这个变量对象被添加到了作用域链的前端。`buildUrl()` 函数中定义了一个变量 `qs`。当在 `with` 语句中引用变量 `href` 时（实际引用的是 `location.href`），可以在当前执行环境的变量对象中找到。当引用变量 `qs` 时，引用的则是在 `buildUrl()` 中定义的那个变量，而该变量位于函数环境的变量对象中。至于 `with` 语句内部，则定义了一个名为 `url` 的变量，因而 `url` 就成了函数执行环境的一部分，所以可以作为函数的值被返回。

#### 没有块级作用域

在 ECMAScript 中，除了函数以外，任何花括号代码块都不会产生新的作用域。

使用 `var` 声明的变量会自动被添加到最接近的环境中。在函数内部，最接近的环境就是函数的局部环境；在 `with` 语句中，最接近的环境是函数环境。如果初始化变量时没有使用 `var` 声明，该变量会自动被添加到全局环境。

在 Web 浏览器中可以用 `window.variable` 的形式访问全局 `variable` 变量。

### 引用类型

虽然 ECMAScript 的引用类型与类看起来类似，但它们并不是相同的概念。

#### Object 类型

创建 `Object` 实例的方式有两种。第一种是使用 `new` 操作符后跟 `Object` 构造函数：

```js
var person = new Object();
person.name = "Nicholas";
person.age = 29;
```

另一种方式是使用对象字面量表示法。对象字面量是对象定义的一种简写形式，目的在于简化创建包含大量属性的对象的过程。下面的例子定义了与前面那个例子中相同的 `person` 对象：

```js
var person = {
  name: "Nicholas",  // 使用逗号来分隔不同的属性
  age: 29            // 属性名也可以用字符串 "age"
};
```

出现在表达式上下文中的 `{` 表示对象字面量的开始，而出现在语句上下文中的 `{` 表示一个语句块的开始。

> 表达式上下文（expression context）：指该上下文期待一个值（表达式）

使用对象字面量语法来定义对象的方式更为常见。实际上，对象字面量也是向函数传递大量可选参数的首选方式：

```js
function displayInfo(args) {
  var output = "";
  if (typeof args.name == "string") {
    output += "Name: " + args.name + "\n";  // 检测属性是否存在
  }
  if (typeof args.age == "number") {
    output += "Age: " + args.age + "\n";
  }
  alert(output);
}

displayInfo({
  name: "Nicholas",
  age: 29
});

displayInfo({
  name: "Greg"
});
```

> 一般来讲，命名参数虽然容易处理，但在有多个可选参数的情况下就会显示不够灵活。最好的做法是对那些必需值使用命名参数，而使用对象字面量来封装多个可选参数。

一般来说，访问对象属性时使用的都是点表示法。不过，在JavaScript也可以使用方括号表示法来访问对象的属性。在使用方括号语法时，应该将要访问的属性以字符串的形式放在方括号中：

```js
​​​​​​​​​alert(person["name"]);  //"Nicholas"￼​​​​​​​​alert(person.name);     //"Nicholas"​​
```

从功能上看，这两种访问对象属性的方法没有任何区别。但方括号语法的主要优点是可以通过变量来访问属性，例如：

```js
​​​​​​​​​var propertyName = "name";￼​​​​​​​​alert(person[propertyName]);  //"Nicholas"​​
```

如果属性名中包含会导致语法错误的字符，或者属性名使用的是关键字或保留字，也可以使用方括号表示法。例如：

```js
​​​​​​​​​person["first name"] = "Nicholas";​​
```

由于 `"first name"` 中包含一个空格，所以不能使用点表示法来访问它。然而，属性名中是可以包含非字母非数字的，这时候就可以使用方括号表示法来访问它们。

> 通常，除非必须使用变量来访问属性，否则我们建议使用点表示法。

#### Array 类型

和 Object 一样，Array 也有两种创建方法。第一种是使用 Array 构造函数：

```js
var colors = new Array();
var colors = new Array(20);  // 数组长度为 20
var colors = new Array("red", "blue", "green");
var names = Array("Greg");  // 也可以省略 new 操作符
```

第二种是使用数组字面量表示法：

```js
var colors = ["red", "blue", "green"];
var colors = [];
```

> 与对象一样，在使用数组字面量表示法时，也不会调用 `Array` 构造函数。

数组的 `length` 属性很有特点——它不是只读的。因此，通过设置这个属性，可以从数组的末尾移除项或向数组中添加新项：

```js
var colors = ["red", "blue", "green"];
colors.length = 2;
alert(colors[2]);   // undefined

colors.length = 3;  // 新增的每一项都会取得 undefined 值
alert(colors[3]);   // undefined
```

##### 检测数组

对于一个网页，或者一个全局作用域而言，使用 `instanceof` 操作符就能得到满意的结果：

```js
if (value instanceof Array) {
  // TODO
}
```

`instanceof` 操作符的问题在于，它假定只有一个全局执行环境。如果网页中包含多个框架，那实际上就存在两个以上不同的全局执行环境，从而存在两个以上不同版本的 `Array` 构造函数。如果你从一个框架向另一个框架传入一个数组，那么传入的数组与在第二个框架中原生创建的数组分别具有各自不同的构造函数。

为了解决这个问题，ECMAScript 5 新增了 `Array.isArray()` 方法。这个方法的目的是最终确定某个值到底是不是数组，而不管它是在哪个全局执行环境中创建的。这个方法的用法如下。

```js
​​​​​​​​​​​if (Array.isArray(value)){￼​​​​​​​​​​  // TODO​​​​​​​​​​}​​
```

##### 转换数组

可以使用 `toString()` 或 `join()` 方法来将数组转换为字符串。`toString()` 使用逗号分隔数组元素，而 `join()` 则使用指定的分隔字符串来分隔数组元素。

```js
var colors = ["red", "green", "blue"];
alert(colors.toString());  // red,green,blue
alert(colors.join("||"));  // red||green||blue
```

> 如果数组中的某一项的值是 `null` 或 `undefined`，那么该值在 `join()`，`toLocaleString()`，`toString()` 和 `valueOf()` 方法返回的结果中以空字符串表示。

##### 栈方法

ECMAScript 为数组专门提供了 `push()` 和 `pop()` 方法，以便实现类似栈的行为。

`push()` 方法可以接收任意数量的参数，把它们逐个添加到数组末尾，并返回修改后数组的长度。而 `pop()` 方法则从数组末尾移除最后一项，减少数组的 `length` 值，然后返回移除的项。

##### 队列方法

`push()` 已经实现了向数组末尾添加项的方法，而从数组前端取得项的方法是 `shift()`，它能够移除数组中的第一个项并返回该项，同时将数组长度减 1。

ECMAScript 还为数组提供了一个 `unshift()` 方法，它能够在数组前端添加任意个项并返回新数组的长度。

##### 重排序方法

`reverse()` 可以反转数组项的顺序，`sort()` 可以为数组排序。

为了实现排序，`sort()` 方法会调用每个数组项的 `toString()` 转型方法，然后比较得到的字符串，即使数组中的每一项都是数值：

```js
var values = [0, 1, 5, 10, 15];
values.sort();
alert(values);  // 0,1,10,15,5
```

不用说，这种排序方式在很多情况下都不是最佳方案。因此 `sort()` 方法可以接收一个比较函数作为参数：

```js
function compare(val1, val2) {
  if (val1 < val2) {
    return -1;
  } else if (val1 > val2) {
    return 1;
  } else {
    return 0;
  }
}

var values = [0, 1, 5, 10, 15];
values.sort(compare);
alert(values);  // 0,1,5,10,15
```

对于数值类型或者其 `valueOf()` 方法会返回数值类型的对象类型，可以使用一个更简单的比较函数：

```js
function compare(val1, val2) {
  return val2 - val1;  // 比较函数通过返回一个小于零、等于零或大于零的值来影响排序结果
}
```

##### 操作方法

`concat()`：拼接数组

```js
var colors = ["red", "green", "blue"];
var colors2 = colors.concat("yellow", ["black", "brown"]);  // 将 "yellow", "black", "brown" 拼接到 colors 末尾
```

`slice()`：取出数组的一个范围

```js
var colors = ["red", "green", "blue", "yellow", "purple"];
var colors2 = colors.slice(1);     // 获取 [1, 4] 的元素
var colors3 = colors.slice(1, 4);  // 获取 [1, 4) 的元素
```

`splice()`：向数组的中部删除及插入项

`splice()` 方法始终都会返回一个数组，该数组中包含从原始数组中删除的项。

```js
var colors = ["red", "green", "blue"];
var removed = colors.splice(0, 1);  // 从第 0 项开始删除 1 项
alert(colors);   // green,blue
alert(removed);  // red

removed = colors.splice(1, 0, "yellow", "orange");  // 从第 1 项开始删除 0 项，并插入 2 项
alert(colors);   // green,yellow,orange,blue
alert(removed);  // 空数组

removed = colors.splice(1, 1, "red", "purple");  // 从第 1 项开始删除 1 项，并插入 2 项
alert(colors);   // green,red,purple,orange,blue
alert(removed);  // yellow
```

##### 位置方法

`indexOf()`：从数组的开头开始向后查找

`lastIndexOf()`：从数组的末尾开始向前查找

两个方法都返回要查找的项在数组中的位置或 -1。比较时使用全等操作符。

```js
var numbers = [1,2,3,4,5,4,3,2,1];

alert(numbers.indexOf(4));       // 3
alert(numbers.lastIndexOf(4));   // 5

alert(numbers.indexOf(4,4));     // 5, 第二个参数表示查找起点的索引
alert(numbers.lastIndexOf(4,4))  // 3
```

##### 迭代方法

ECMAScriopt 5 为数组定义了 5 个迭代方法。每个方法都接收两个参数：要在每一项上运行的函数和（可选的）运行该函数的作用域对象——影响 `this` 的值。传入这些方法中的函数会接收三个参数：数组项的值、该项在数组中的位置和数组对象本身。根据使用的方法不同，这个函数执行后的返回值可能会也可能不会影响方法的返回值。

- `every()`: 对数组中的每一项运行给定函数，如果该函数对每一项都返回 `true`，则方法返回 `true`。
- `filter()`: 对数组中的每一项运行给定函数，返回该函数会返回 `true` 的项组成的数组。
- `forEach()`: 对数组中的每一项运行给定函数。无返回值。
- `map()`: 对数组中的每一项运行给定函数，返回每次函数调用的结果组成的数组。
- `some()`: 对数组中的每一项运行给定函数，如果该函数对任意项返回 `true`，则返回 `true`。

以上方法都不会修改数组中包含的值。

```js
var numbers = [1,2,3,4,5,4,3,2,1];

var everyResult = numbers.every(function(item, index, array) {
  return (item > 2);
});  // false

var someResult = numbers.some(function(item, index, array) {
  return (item > 2);
});  // true

var filterResult = numbers.filter(function(item, index, array) {
  return (item > 2);
});  // [3,4,5,4,3]

var mapResult = numbers.map(function(item, index, array) {
  return item * 2;
});  // [2,4,6,8,10,8,6,4,2]

numbers.forEach(function(item, index, array) {
  // 对数组元素要执行的操作
}});
```

##### 归并方法

ECMAScript 5 还新增了两个归并数组的方法：`reduce()` 和 `reduceRight()`。这两个方法都会迭代数组的所有项，然后构建一个最终返回的值。其中，`reduce()`方法从数组的第一项开始，逐个遍历到最后。而`reduceRight()` 则从数组的最后一项开始，向前遍历到第一项。

这两个方法都接收两个参数：一个在每一项上调用的函数和（可选的）作为归并基础的初始值。传给 `reduce()` 和 `reduceRight()` 的函数接收4个参数：前一个值、当前值、项的索引和数组对象。这个函数返回的任何值都会作为第一个参数自动传给下一项。第一次迭代发生在数组的第二项上，因此第一个参数是数组的第一项，第二个参数就是数组的第二项。

使用 `reduce()` 方法可以执行求数组中所有值之和的操作，比如：

```js
var values = [1,2,3,4,5];
var sum = values.reduce(function(prev, cur, index, array) {
  return prev + cur;
}});  // 15
```
