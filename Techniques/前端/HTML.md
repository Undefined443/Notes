# HTML

### HTML 文档结构

```html
<!-- 文档类型声明 -->
<!DOCTYPE html>

<!-- HTML 页面的根标签 -->
<html lang="zh-cn">

  <!-- 用来定义 HTML 文档的一些信息 -->
<head>

  <!-- 指明网页的编码，可省略 -->
  <meta charset="UTF-8">

  <!-- 定义网页的标题 -->
  <title>HTML 演示</title>
</head>

<!-- 定义网页的内容 -->
<body>
  <h1>这是一个标题</h1>
  <p>这是一个段落</p>
  <p>这是另一个段落</p>
  <a href="http://c.biancheng.net/" target="_blank">这是一个链接，指向 C 语言中文网首页</a>
  <ul>
    <li>HTML教程</li>
    <li>CSS教程</li>
    <li>JavaScript教程</li>
  </ul>

  <input type="text" placeholder="请输入内容" />
</body>
</html>
```

### HTML 标签的语法格式

```html
<开始标签 属性="xxx">内容</结束标签>
```

> HTML 标签也称为 HTML 元素

#### 自闭合标签

有些 HTML 标签没有单独的结束标签，而是在开始标签中添加 `/` 来进行闭合。

```html
<img src="./IMG.png" />
<hr />
<br />
<input type="text" placeholder="xxx" />
```

### HTML 通用属性

 `id`：用来赋予某个标签唯一的标识符。当我们用 CSS 或者 JavaScript 来操作这个标签时，可以通过 id 属性来找到这个标签。

 `class`：同样是为标签定义一个标识符，不过这个标识符可以不唯一。我们可以为多个标签定义相同的 class 属性，也可以为一个标签定义多个 class 属性。

 ```html
<div class="class1 class2 class3"></div>
<p class="content">some text</p>
<div class="content">xxx</div>
 ```

 `title`：当鼠标移动到标签上时，就会显示 title 的值。

 `style`：使用 style 属性我们可以在 HTML 标签内部为标签定义 CSS 样式，例如设置文本的颜色、字体等。

 ```html
<p style="color:red;">red text</p>
<img src="xxx" style="height:50px;">
<div style="paddding:10px;border:2px solid #999;text-align:center;">some text</div>
 ```

 ### HTML 标题

 ```html
<h1>h1 标题</h1>
<h2>h2 标题</h2>
<h3>h3 标题</h3>
<h4>h4 标题</h4>
<h5>h5 标题</h5>
<h6>h6 标题</h6>
 ```

 ### HTML 段落

 ```html
<p>段落 1</p>
<p>段落 2</p>
 ```

 ### HTML 文本格式化

 [C 语言中文网](http://c.biancheng.net/view/9386.html)

 根据 HTML5 的规范，标题应该用 `<h1>`~`<h6>` 标签定义，被强调的文本应该用 `<em>` 标签定义，重要的文本应该用 `<strong>` 标签定义，被标记的或者高亮显示的文本应该用 `<mark>` 标签定义。

 ### HTML 超链接

 ```html
<a href="http://xxx" target="_blank">显示内容</a>
 ```

 herf 属性指定链接的文件，target 属性指名新页面的打开方式。

 | 属性值 |                    说明                     |
 |:-------:|---------------------------------|
 |  _self   |在当前标签页中打开                 |
 | _blank |在新标签页中打开                    |
 |_parent|在当前框架的上一层打开新页面|
 |  _top   |在顶层框架中打开新页面          |

 > 绝大部分情况下，target 属性要么不写，保持默认的 _self，要么将它的值设置为 _blank。

 ### HTML 图片

 ```html
<img src="./IMG.png" alt="description" width="150" height="100">
<img src="./IMG.png" alt="description" style="width:150px; height:100px;">
 ```

 关于 width 和 height 属性的两点建议：

- 一般建议为图片设置 width 和 height 属性，以便浏览器可以在加载图片之前为其分配足够的空间，否则图片加载过程中可能会导致您的网站布局失真或闪烁。
- 如果您的页面使用响应式布局（自适应布局），建议在上传图片之前裁剪好尺寸，而不要设置 width 和 height 属性，这样图片能够跟随屏幕宽度自动改变尺寸，从而不会变形，或者超出屏幕宽度。

#### HTML5 中的图片属性

有时我们需要按照比例来放大或缩小图片的尺寸以适应不同的设备，避免图片过大超出屏幕的范围，为此 HTML5 中增加了 `<picture>` 标签，该标签允许您针对不同类型的设备定义多个版本的图片。

```html
<picture>
    <source media="(min-width: 1000px)" srcset="logo-large.png">
    <source media="(max-width: 500px)" srcset="logo-small.png">
    <img src="logo-default.png" alt="默认Logo">
</picture>
```

在 `<picture>` 标签中包含零个或多个 `<source>` 标签，通过 `<source>` 标签中的 `media` 属性设定匹配条件（允许哪个版本的图片显示），通过 `srcset` 属性定义图片的路径。另外，在 `<picture>` 标签的最后还需要定义一个 `<img>` 标签，表示默认选项。

#### 图像映射

图像映射允许您在一个图片中定义超链接，实现思想就是在图像中划分一些区域，并在这些区域中定义超链接。

```html
<img src="logo.png" usemap="#objects" alt="C语言中文网 Logo">

<!-- map 标签的 name 属性对应的是 img 标签的 usemap 属性 -->
<map name="objects">
  <area shape="rect" coords="x1,y1,x2,y2" href="http://xxx" alt="description">
  <area shape="circle" coords="x,y,radius" href="http://xxx" alt="description">
  <area shape="poly" coords="x1,y1,x2,y2,...,xn,yn" href="http://xxx" alt="description">
</map>
```

###  HTML 表格

```html
<!-- 认情况下，表格是没有边框的。这里将边框宽度设置为 1px，同时利用 CSS 设置边框塌陷，使双边框变为单边框 -->
<table border="1" style="border-collapse:collapse;">
  <caption>表格标题</caption>

  <!-- table row -->
  <tr>

    <!-- table heading -->
    <th>名称</th>
    <th>官网</th>
    <th>性质</th>
  </tr>
  <tr>

    <!-- table datacell（单元格） -->
    <td>百度</td>
    <td>https://www.baidu.com/</td>
    <td>搜索</td>
  </tr>
  <tr>

    <!-- 行合并 -->
    <td rowspan="2">谷歌</td>
    <td>https://www.google.com/</td>
    <td rowspan="2">搜索</td>
  </tr>
  <tr>
    <td>https://www.google.com.hk/</td>
  </tr>
  <tr>

    <!-- 列合并 -->
    <td colspan="3">谷歌是全世界最好的搜索引擎</td>
  </tr>
</table>
```

### HTML 列表

#### 有序列表

```html
<!-- ordered list -->
<ol>

  <!-- list item -->
  <li>item1</li>
  <li>itme2</li>
</ol>
```

- 不建议在 `<ol>` 中直接使用除 `<li>` 之外的其他标签。
- 无序列表只需用 `<ul>` 替换 `<ol>` 即可。

#### 定义列表

```html
<!-- definition list -->
<dl>

  <!--definition term，用于定义一个术语-->
  <dt>标题 1</dt>

  <!-- definition description，用于解释术语 -->
  <dd>描述文本 1</dd>
  <dt>标题 2</dt>
  <dd>描述文本 2</dd>
</dl>
```

![](../assets/定义列表.png)

[使用 CSS 修改列表样式](http://c.biancheng.net/view/9389.html)

### HTML 表单

```html
<!-- 表单中其他标签 -->
<form action="URL" method="GET|POST">
</form>
```

- action 属性指明将表单提交到哪个页面（跳转到哪个页面）
- method 属性表示使用哪个方式提交数据
  - GET：用户点击提交按钮后，提交的信息会被显示在地址栏中。如果提交的信息中包含密码，则不建议这种方式。
  - POST：数据会传到后台，不显示在地址栏中。

[表单控件](http://c.biancheng.net/view/7564.html)

### HTML 注释规范

单行注释：注释内容前后各一个空格，注释位于要注释代码的上面，独占一行。

```html
<!-- Comment Text -->
<div>...</div>
```

模块注释：用于描述模块开始与结束的位置。模块与模块之间空一行。

```html
<!-- S Comment Text A -->
<div class="mod_a">
  ...
</div>
<!-- E Comment Text A -->

<!-- S Comment Text B -->
<div class="mod_b">
  ...
</div>
<!-- E Comment Text B -->
```

嵌套模块注释：当模块注释内再出现模块注释时，为了突出主要模块，嵌套模块不再使用，而只在内部模块结束的位置进行单行注释。

```html
<!-- S Comment Text A -->
<div class="mod_a">

  <div class="mod_b">
    ...
  </div>
  <!-- /mod_b -->

  <div class="mod_c">
    ...
  </div>
  <!-- /mod_c -->

</div>
```

### HTML 嵌入 CSS 样式

```html
<!-- 内联样式 -->
<p style="color:red;">some text</p>

<!-- 内嵌样式 -->
<head>
  <style type="text/css">
  p{
      color:red;
  }
  </style>
</head>

<!-- 导入样式 -->
<head>
  <style type="text/css">
    @import theme1.css;
    @import url(theme2.css);
    body { background-color: #e4e929; }
  </style>
</head>

<!-- 链接式 -->
<head>
  <link href="theme.css" type="text/css" rel="stylesheet" />
</head>
```

### HTML 块级元素和内联元素

#### 块级元素

块级元素最主要的特点是它们自己独占一行。块级元素最具代表性的就是 `<div>`，此外还有 `<p>`, `<nav>`, `<aside>`, `<header>`, `<footer>`, `<section>`, `<article>`, `<ul>`, `<address>`, `<h1>` ~ `<h6>` 等。

块级元素的主要特征如下所示：

- 不管是否使用换行标签，块级元素总是在新行上开始；
- 块级元素的宽度、高度以及外边距和内边距等都可以控制；
- 如果省略块级元素的宽度，那么它的宽度默认为当前浏览器窗口的宽度；
块级元素中可以包含其它的内联元素和块级元素。

##### div 标签

通过 `<div>` 标签可以将网页分割成不同的板块。



#### 内联元素

内联元素也可以称为行内元素，内联元素中最常用的是 `<span>`，此外还有 `<b>`, `<i>`, `<u>`, `<em>`, `<strong>`, `<sup>`, `<sub>`, `<big>`, `<small>`, `<li>`, `<ins>`, `<del>`, `<code>`, `<cite>`, `<dfn>`, `<kbd>` 和 `<var>` 等。

内联元素的主要特征如下所示：

- 内联元素和其他元素会在同一行上显示；
- 内联元素的宽、高以及外边距和内边距都不可以改变；
- 内联元素的宽度就是其中内容的宽度，且不可以改变；
- 内联元素中只能容纳文本或者其他内联元素。

对于内联元素的使用，需要注意如下几点：

- 设置宽度 width 无效；
- 设置高度 height 无效，但可以通过 line-height 来设置行高；
- 可以设置 margin 外边距，但只对左右外边距有效，上下无效；
- 设置 padding 内边距时，只有左右 padding 有效，上下则无效，需要注意的是元素范围是增大了，但是对元素周围的内容是没影响的；
- 可以通过 display 属性将元素在内联元素和块级元素之间进行切换。

*[href]: Hypertext Reference