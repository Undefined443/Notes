# JavaScript

https://developer.mozilla.org/zh-CN/docs/Learn/JavaScript/First_steps

在 `.html` 文件中引入 JavaScript

```html
<!-- 在 </body> 标签前的新行添加以下代码 -->
<script> src="scripts/main.js" defer></script>
```

> 浏览器会按照代码在文件中的顺序加载 HTML。如果先加载的 JavaScript 想要修改其下方的 HTML，那么它可能由于 HTML 尚未被加载而失效。因此，将 JavaScript 代码放在 HTML 页面的底部附近通常是最好的策略。

**注意：**`<script>` 元素看起来像一个空元素，但它并不是，因此需要一个结束标记。你还可以选择将脚本放入 `<script>` 元素中，而不是指向外部脚本文件。

[文档对象模型(DOM)](https://developer.mozilla.org/zh-CN/docs/Web/API/Document_Object_Model)

[安装 Node.js](https://docs.microsoft.com/zh-cn/windows/dev-environment/javascript/nodejs-on-windows)

## 变量

使用关键字 `let` 或 `var` 声明变量。

```js
let myVariable; // 只有在单行内需要分割多条语句时，这个分号才是必须的
```

| 变量    | 解释                                                                    | 示例                                                                                           |
| ------- | ----------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| String  | 字符串（一串文本）：字符串的值必须用引号（单双均可，必须成对）扩起来。  | let myVariable = '李雷';                                                                       |
| Number  | 数字：无需引号。                                                        | let myVariable = 10;                                                                           |
| Boolean | 布尔值（真 / 假）： true/false 是 JS 里的特殊关键字，无需引号。         | let myVariable = true;                                                                         |
| Array   | 数组：用于在单一引用中存储多个值的结构。                                | let myVariable = [1, '李雷', '韩梅梅', 10];<br />元素引用方法：myVariable[0], myVariable[1] …… |
| Object  | 对象：JavaScript 里一切皆对象，一切皆可储存在变量里。这一点要牢记于心。 | let myVariable = document.querySelector('h1');<br />以及上面所有示例都是对象。                 |

可以使用 `typeof` 操作符来获取变量的数据类型。

### Object 与 Array

```js
let person = {
  name: 'Bob',
  age: 20,
  tags: ['js', 'web', 'mobile'],
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
console.log(a == b);  // 输出 true
console.log(a === b); // 输出 false
```

[表达式和运算符](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators)

## 函数

```js
function add(num1, num2 = 0) { // 可以使用参数默认值
  let result = num1 + num2;
  return result;
}
```

```js
// 函数可以存储在变量，对象，数组中
let fun = function() { // 这也叫做函数表达式
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

JavaScript 中的 if else，while，for 语句都和 Java 相同。除此之外，JavaScript 还拥有 for in 和 for of 语句。

### for in

for in 循环用来遍历 Object，在每次循环中，会将 object 中的一个属性的 key 赋给循环变量。

```js
let person = {"name": "Clark", "surname": "Kent", "age": "36"};

for (var prop in person) {
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

JavaScript 中的 break 和 continue 也和 Java 的用法一样（可以使用 label）

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

如果使用 readFile 输入，需要注意其有一个回调函数异步调用的问题：用于接受输入内容的回调函数并不会立即执行，最先执行的语句是 readFile 下面的语句。而回调函数则是等系统调用完成以后才执行。

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

### npm

[npm install 安装的四种用法 --save 和 --save-dev](https://blog.csdn.net/weixin_42260975/article/details/106253250?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1-106253250-blog-121209404.pc_relevant_default&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-1-106253250-blog-121209404.pc_relevant_default&utm_relevant_index=2)

[node 安装依赖时带 --save-exact 是为什么](https://blog.csdn.net/aaqingying/article/details/121209404)

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