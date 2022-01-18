# CSS

## CSS 基础

[MDN：CSS 基础](https://developer.mozilla.org/zh-CN/docs/Learn/CSS/First_steps/How_CSS_is_structured)

层叠样式表（Cascading Style Sheet）

### 在 HTML 里应用 CSS 样式

#### 外部样式表

```html
<link rel="stylesheet" href="styles.css">
```

#### 内部样式表

不使用外部 CSS 文件，而是将 CSS 放在 HTML 文件 `<head>` 标签里的 `<style>` 标签之中。

```html
<style>
  p {
    color: red;
  }
</style>
```

#### 内联样式

内联样式表存在于 HTML 元素的 `style` 属性之中。其特点是每个CSS表只影响一个元素：

```html
<p style="color:red;">
```

> 除非有充足的理由，否则不要使用内联样式。

### CSS 规则集

![](https://media.prod.mdn.mozit.cloud/attachments/2019/02/10/16483/0b162bb3014591dbb741d7d905afc70f/css-declaration.png)

这个整体称作规则（集）。

#### 选择器的类型

| 选择器名称                | 选择的内容                               | 示例                                                                   |
| ------------------------- | ---------------------------------------- | ---------------------------------------------------------------------- |
| 元素选择器  | 所有指定类型的 HTML 元素                 | `p`<br />选择 `<p>`                                                    |
| ID 选择器                 | 具有指定 ID 的元素                       | `#my-id`<br />选择 `<p id="my-id">`                |
| 类选择器                  | 具有特定类的元素                         | `.my-class` 或 `p.my-class`<br />选择 `<p class="my-class">` |
| 属性选择器                | 拥有特定属性的元素                       | `img[src]` 或 `img[src=myimage.png]`<br />选择 `<img src="myimage.png">`         |
| 伪类选择器      | 特定状态下的特定元素（比如鼠标指针悬停） | `a:hover`<br />仅在鼠标指针悬停在链接上时选择 `<a>`                    |
| 伪元素选择器 |一个元素的某个部分|`p::first-line`<br />选择 `<p>` 中的第一行|

选择器的种类远不止于此，更多信息请参阅 [MDN：选择器参考表][reference table of selectors]。

#### 选择器列表

```css
h1, .special {
  color: blue;
} 

/* 如果每个选择器都独占一行，会更易读 */
h1,
.special {
  color: blue;
} 
```

如果任何一个选择器无效（存在语法错误），那么整条规则都会被忽略。

#### 根据元素在文档中的位置确定样式

##### 使用包含选择符

包含选择符是一个空格

选择 `<li>` 内部的所有 `<em>` 元素：

```css
li em {
  color: rebeccapurple;
}
```

##### 使用相邻选择符

相邻选择符是 `+`

选择直接出现在 `<h1>` 后面并且与 `<h1>` 具有相同层级的 `<p>`：

```css
h1 + p {
  font-size: 200%;
}
```

#### 根据状态确定样式

```css
/* 没有被访问的链接的样式 */
a:link {
  color: pink;
}

/* 访问过的链接的样式 */
a:visited {
  color: green;
}

/* 链接被鼠标悬停的时候的样式 */
a:hover {
  text-decoration: none;
}
```

### 冲突规则

#### Cascade（层叠）

当应用两条同级别的规则到一个元素的时候，写在后面的就是实际使用的规则。

#### Specificity（优先级）

当多个规则有不同选择器对应相同的元素时，优先级高的规则会被使用。

优先级排序：

1. 内联样式的声明优先级最高
2. ID 选择器
3. 类选择器、属性选择器或伪类选择器
4. 元素选择器、伪元素选择器

通用选择器 `*`，组合符 `+`，`>`，`~`，` ` 和否定伪类 `:not` 不会影响优先级。

[MDN：优先级计算规则][specificity]

#### !important

`!important` 可以用来覆盖所有上面所有优先级计算，不过需要很小心的使用。`!important` 用于修改特定属性的值， 能够覆盖普通规则的层叠。

```css
border: none !important
```

#### Inheritance（继承）

一些设置在父元素上的 css 属性是可以被子元素继承的，有些则不能。CSS 为控制继承提供了四个特殊的通用属性值。每个 css 属性都接收这些值。

`inherit`
: 设置该属性会使子元素属性和父元素相同。实际上，就是“开启继承”。

`initial`
: 设置属性值和浏览器默认样式相同。如果浏览器默认样式中未设置且该属性是自然继承的，那么会设置为 `inherit`。

`unset`
: 将属性重置为自然值，也就是如果属性是自然继承那么就是 `inherit`，否则和 `initial` 一样

`revert`
: 见 [MDN: revert](https://developer.mozilla.org/en-US/docs/Web/CSS/revert)

#### 重设所有属性值

CSS 的 shorthand 属性 `all` 可以用于同时将这些继承值中的一个应用于（几乎）所有属性。它的值可以是其中任意一个（`inherit`，`initial`，`unset`，或 `revert`）。这是一种撤销对样式所做更改的简便方法，以便回到之前已知的起点。

### 函数

[MDN：函数][functions]

### @规则

#### 将额外的样式表导入主样式表

```css
@import 'styles2.css';
@import url(style3.css);
```

#### @media

在下面的 CSS 中，我们给 `<body>` 元素一个粉红色的背景色。但是，我们随后使用 `@media` 创建样式表的一个部分，该部分仅适用于窗口大于 30em 的浏览器。如果浏览器的宽度大于 50em，则背景色将为蓝色。

```css
body {
  background-color: pink;
}

@media (min-width: 50em) {
  body {
    background-color: blue;
  }
}
```

### 速记属性

一些属性，如 `font`，`background`，`padding`，`border`，以及 `margin` 等属性称为速记属性——这是因为它们允许您在一行中设置多个属性值，从而节省时间并使代码更整洁。

```css
/* 在像 padding 和 margin 这样的 4 值速记中，数值的应用顺序是上、右、下、左（从顶部顺时针）。也有其他的速记类型，例如 2 值速记，先上/下，然后是左/右。 */
padding: 10px 15px 15px 5px;

/* 等价于 */
padding-top: 10px;
padding-right: 15px;
padding-bottom: 15px;
padding-left: 5px;

/* ------------------------------------------------------------------------- */

background: red url(bg-graphic.png) 10px 10px repeat-x fixed;

/* 等价于 */
background-color: red;
background-image: url(bg-graphic.png);
background-position: 10px 10px;
background-repeat: repeat-x;
background-attachment: fixed;
```

### 注释规范

#### 单行注释

注释内容第一个字符和最后一个字符都是一个空格，独占一行，行与行之间相隔一行：

```css
/* Comment Text */
.jdc {}

/* Comment Text */
.jdc {}
```

#### 模块注释

注释内容第一个字符和最后一个字符都是一个空格，`/*` 与 模块信息描述占一行，多个横线分隔符 `-` 与 `*/` 占一行，行与行之间相隔两行：

```css
/* Module A
---------------------------------------------------------------- */
.mod_a {}


/* Module B
---------------------------------------------------------------- */
.mod_b {}
```

#### 文件信息注释

在样式文件编码声明 `@charset` 语句下面注明页面名称、作者、创建日期等信息：

```css
@charset "UTF-8";
/**
 * @desc File Info
 * @author Author Name
 * @date 2015-10-10
 */
```

### 当浏览器遇到无法解析的 CSS 代码时会发生什么

浏览器会直接跳过无法解析的部分，继续解析剩下的部分。正是由于这个原因，我们可以为同一个元素指定多个 CSS 样式来解决有些浏览器不兼容新特性的问题。举例来说，一些老的浏览器不接收 `calc()` 作为一个值。我可能使用它结合像素为一个元素设置了动态宽度，老式的浏览器由于无法解析忽略这一行；新式的浏览器则会把这一行解析成像素值，并且覆盖第一行指定的宽度。

```css
.box {
  width: 500px;
  width: calc(100% - 50px);
}
```

### 字体和文本

要选择一种字体，打开 Google Fonts，选择一个 font family，选择其中具体的 style，然后在右侧边栏中拷贝 Google 给出的代码片段分别加入 HTML 和 CSS 文件。

[Google Fonts](https://www.google.com/fonts)

[阿里字体素材平台](https://www.taobao.com/markets/fuwu/fontmarket_freefonts)

> 中文字体文件较大，不适合直接用于 Web Font 。

#### 常用属性

`font-family`

`font-size`

`text-align`：文本对齐，`center`

`line-height`：行高。当值为数字 n 时行高就是字体大小乘 n。

`letter-spacing`：字间距

`font-style`：设置斜体 `italic`

`color`

`border-bottom`

`font-weight`：设置粗体 `bold`

`text-decoration`：设置波浪线 `underline wavy green`

### CSS 的盒模型布局

每个占据页面空间的块级元素都有这样的属性：

- `padding`：内边距，围绕着内容（比如段落）的空间。
- `border`：边框，紧接着内边距的线。
- `margin`：外边距，围绕元素外部的空间。

![](https://media.prod.mdn.mozit.cloud/attachments/2014/11/18/9443/63d72109948ccedb5e0f0dd5f9cb3716/box-model.png)

```css
/* 更改页面颜色 */
html {
  background-color: #00539F;      /* 设置页面背景色 */
}

/* 文档体格式设置 */
body {
  width: 600px;                   /* 强制页面保持 600px 宽 */
  margin: 0 auto;                 /* 设置上边和下边的外边距为 0，左边和右边的外边距为 auto（居中） */
  background-color: #FF9500;      /* body 的背景色 */
  padding: 0 20px 20px 20px;      /* 设置上、右、下、左内边距 */
  border: 5px solid black;        /* 设置 5 像素的黑色实线边框 */
}

/* 定位页面主标题并添加样式 */
h1 {
  margin: 0;
  padding: 20px 0;
  color: #00539F;
  text-shadow: 3px 3px 1px black; /* 文本阴影；阴影右移 3px，下移 3px，模糊半径 1px，阴影基色为黑色。 */
}

/* 图像居中 */
img {
  display: block;                 /* 图片是内联元素，需要先给予其块级行为 */
  margin: 0 auto;                 /* 图像居中 */
}
```

[reference table of selectors]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/Selectors#%E9%80%89%E6%8B%A9%E5%99%A8%E5%8F%82%E8%80%83%E8%A1%A8

[functions]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/First_steps/How_CSS_is_structured#%E5%87%BD%E6%95%B0

[specificity]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/Cascade_and_inheritance#%E4%BC%98%E5%85%88%E7%BA%A7_2