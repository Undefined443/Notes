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

## 变量

使用关键字 `let` 或 `var` 声明变量。

```js
let myVariable; // 只有在单行内需要分割多条语句时，这个分号才是必须的
```

|变量|解释|示例|
|---|---|-----|
|String|字符串（一串文本）：字符串的值必须用引号（单双均可，必须成对）扩起来。|let myVariable = '李雷';|
|Number|数字：无需引号。|let myVariable = 10;|
|Boolean|布尔值（真 / 假）： true/false 是 JS 里的特殊关键字，无需引号。|let myVariable = true;|
|Array|数组：用于在单一引用中存储多个值的结构。|let myVariable = [1, '李雷', '韩梅梅', 10];<br />元素引用方法：myVariable[0], myVariable[1] ……|
|Object|对象：JavaScript 里一切皆对象，一切皆可储存在变量里。这一点要牢记于心。|let myVariable = document.querySelector('h1');<br />以及上面所有示例都是对象。|

## 运算符

全等 `===`

非全等 `!==`

[表达式和运算符](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators)

## 函数

```js
function multiply(num1, num2) {
  let result = num1 * num2;
  return result;
}
```