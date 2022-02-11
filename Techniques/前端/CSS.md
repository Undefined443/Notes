# CSS

## CSS 第一步

[MDN：如何构建 CSS](https://developer.mozilla.org/zh-CN/docs/Learn/CSS/First_steps/How_CSS_is_structured)

层叠样式表（Cascading Style Sheet）

### 在 HTML 里应用 CSS 样式

#### 外部样式表

```html
<link href="style.css" rel="stylesheet" type="text/css">
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

内联样式表存在于 HTML 元素的 `style` 属性之中。其特点是每个 CSS 表只影响一个元素：

```html
<p style="color:red;">
```

> 除非有充足的理由，否则不要使用内联样式。

### CSS 规则集

![](https://media.prod.mdn.mozit.cloud/attachments/2019/02/10/16483/0b162bb3014591dbb741d7d905afc70f/css-declaration.png)

这个整体称作规则（集）。

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

#### 全局选择器

全局选择器可以让选择器更易读：

```css
/* 容易和 article:first-child 混淆 */
article :first-child {
  ...
}

/* 避免混淆 */
article *:first-child {
  ...
}
```

#### 类选择器

```css
/* 选择属于指定类的所有元素 */
.special

/* 选中属于指定类的指定元素 */
p.special

/* 选择同时属于多个类的所有元素 */
.note.warning
```

#### ID 选择器

```css
/* 选择具有指定 ID 的元素 */
#heading

/* 选择元素类型和 ID 都匹配的元素 */
h1#heading
```

> ID 选择器的优先级较高，不太方便处理。大多数情况下使用类选择器会更好。

#### 属性选择器

```css
/* 选择具有指定属性的元素 */
a[title]

/* 选择具有指定属性及属性值的元素 */
a[href="https://example.com"]

/* 选择具有指定属性及属性值的元素，或多个属性值中有一个与给定值匹配的元素 */
p[class~="special"]

/* 选择具有指定属性及属性值的元素，或属性值的开始为给定值，后面紧随着一个连字符的元素 */
div[lang|="zh"]
```

##### 子字符串匹配选择器

```css
/* 选择属性值前缀为给定值的元素 */
li[class^="box-"]

/* 选择属性值后缀为给定值的元素 */
li[class$="-box"]

/* 选择属性值包含给定子串的元素 */
li[class*="box"]
```

##### 大小写不敏感

在闭合括号之前使用 `i` 值。

```css
/* Case-insensitivity */
li[class^="a" i]
```

> 还有一个 `s` 值，会强制要求大小写敏感。不过 HTML 文档默认就是大小写敏感的。

#### 伪类选择器

伪类选择器用于选择处于特定状态的元素。它们选中你的文档中处于某种状态的元素，表现得就像是你已经给它们设定了类一样。

伪类就是开头为冒号的关键字：

```css
:pseudo-class-name
```

```css
/* 选择 <article> 下的第一个 <p> 元素 */
/* 作用相当于给第一个 <p> 元素设定类 */
article p:first-child

/* 其他伪类 */
:last-child
:only-child
:nth-child(an+b)
:nth-last-child(an+b)

:first-of-type
:last-of-type
:only-of-type
:nth-of-type
:nth-last-of-type
```

[MDN: Pseudo-classes][pseudo-classes]

##### 用户行为伪类

```css
/* 没有被访问的链接的样式 */
a:link

/* 访问过的链接的样式 */
a:visited

/* 当元素获得焦点时的样式 */
a:focus

/* 链接被鼠标悬停的时候的样式 */
a:hover

/* 连接被点击时的样式 */
a:active
```

#### 伪元素选择器

伪元素以类似的方式表现，不过表现得是像你往标记文本中加入新的 HTML 元素一样，而不是向现有的元素设定类。伪元素开头为双冒号 `::`：

```css
::pseudo-element-name
```

```css
/* 选中某一段的第一行 */
/* 作用相当于使用 <span> 包围第一行 */
article p::first-line

/* 其他常见伪元素 */
::first-letter
::selection /* 当前光标双击选中的文本 */
```

##### 通过 ::before 和 ::after 生成内容

有一组特殊的伪元素，它们和 `content` 属性一同使用，将内容插入到你的文档中。

这些伪元素更推荐的用法是插入一个图标，比如加入一个小箭头，作为一个视觉性的提示，而且我们并不希望屏幕阅读器读出它：

```css
.box::after {
  content: " ➥"
}
```

这些伪元素也经常被用于插入空字符串，然后像页面中的其他元素一样样式化：

```css
/* 插入一个链接图标 */
a::after {
  content: "";
  display: inline-block;
  width: 13px;
  height: 13px;
  background-image: url(img.png);
  background-size: contain;
}
```

[MDN：Generating content with ::before and ::after][generating content with ::before and ::after]

[伪类和伪元素 Reference][reference section]

#### 关系选择器

##### 后代选择器

选择作为某元素后代的元素。

```css
li em
```

##### 子代选择器

选择指定元素的第一代子元素。

```css
div > span
```

##### 邻接兄弟选择器

当第二个元素紧跟在第一个元素之后，并且两个元素都是属于同一个父元素的子元素时，第二个元素将被选中。

```css
h1 + p
```

##### 通用兄弟选择器

位置无须紧邻，只须同层级且第二个元素在第一个元素之后。

```css
p ~ span
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

### 盒模型

![图片](https://media.prod.mdn.mozit.cloud/attachments/2019/03/19/16558/29c6fe062e42a327fb549a081bc56632/box-model.png)

Content box
: 用来显示内容，大小可以通过 `width` 和 `height` 设置。

Padding box
: 包围在内容区域外部的空白区域大小可以通过 `padding` 设置。

Border box
: 边框盒包裹内容和内边距。大小可以通过 `border` 设置。

Margin box
: 盒子和其他元素之间的空白区域。大小通过 `margin` 设置。

#### 标准盒模型

![图片](https://media.prod.mdn.mozit.cloud/attachments/2019/03/19/16559/d7dbf772b414a2c96d8ac362c15ed352/standard-box-model.png)

标准盒模型中 `width` 和 `height` 设置的是 *content* 的大小。盒子的实际大小是 padding 加 border 再加 content。

标准盒模型的属性值就是 `content-box`。

#### 替代（IE）盒模型

![图片](https://media.prod.mdn.mozit.cloud/attachments/2019/03/19/16557/3e3f8c74c68f5c1fdc6779d7388bc099/alternate-box-model.png)

替代盒模型中 `width` 和 `height` 设置的是盒子的大小。Content box 的大小是盒子大小减去 border 和 padding。

浏览器默认使用标准模型。可以通过 `box-sizing: border-box` 来使用替代模型。如果你希望所有元素都使用替代模型，可以设置在 `<html>` 元素上设置 `box-sizing`，然后设置所有元素继承该属性：

```css
html {
  box-sizing: border-box;
}
*, *::before, *::after {
  box-sizing: inherit;
}
```

#### 外边距，内边距，边框

[MDN：外边距，内边距，边框][margins, padding, and borders]

常见属性：

分别设置各边：`border-top`, `border-right`, `border-bottom`, `border-right`

设置所有边的宽度、样式或颜色：`border-width`, `border-style`, `border-color`

最细粒度的普通属性：`border-top-style`

#### 块级盒子和内联盒子

##### 块级盒子

- 盒子会在内联的方向上扩展并占据父容器在该方向上的所有可用空间，在绝大数情况下意味着盒子会和父容器一样宽；
- 每个盒子都会换行；
- `width` 和 `height` 属性可以发挥作用；
- 内边距，外边距和边框会将其他元素从当前盒子周围 “推开”；

诸如标题 `<h1>` 和段落 `<p>` 默认情况下都是块级盒子。

##### 内联盒子

- 盒子不会产生换行；
- `width` 和 `height` 属性将不起作用；
- 垂直方向的内边距、外边距以及边框会被应用但是不会把其他处于 `inline` 状态的盒子推开；
- 水平方向的内边距、外边距以及边框会被应用且会把其他处于 `inline` 状态的盒子推开；

用做链接的 `<a>` 元素、 `<span>`、 `<em>` 以及 `<strong>` 都是默认处于 `inline` 状态的。

#### 使用 display: inline-block

inline-block 在内联和块之间提供了一个中间状态。这对于以下情况非常有用：您不希望一个项切换到新行，但希望它可以设定宽度和高度，并避免内联元素可能出现的重叠。

当您想要通过添加内边距使链接具有更大的命中区域时，这是很有用的。`<a>` 是像 `<span>` 一样的内联元素；你可以使用 `display: inline-block` 来设置内边距，让用户更容易点击链接。

### 背景样式

#### 背景颜色

```css
background-color: red;
background-color: #567895;
background-color: rgba(255,255,255,.5);
```

#### 背景图像

```css
background-image: url(star.png);
```

#### 控制图像平铺

```css
/* 默认值是 repeat */
background-repeat: repeat-x;
background-repeat: repeat-y;
background-repeat: norepeat;
```


#### 调整背景图像大小

```css
background-size: cover;      /* 内接 */
background-size: contain;    /* 外接 */
background-size: 100px 10em;
```

#### 背景图像定位

```css
background-position: top right;
background-position: 20px 10%;
background-position: top 20px right 10px; /* 从顶部偏移 20px，从右侧偏移 10px */
```

#### 渐变背景

可以通过 [CSS 渐变生成器](https://cssgradient.io/) 创建渐变。

#### 多个背景图像

```css
background-image: url(image1.png), url(image2.png), url(image3.png), url(image1.png); /* 写在最前面的图片将出现在顶层 */
background-repeat: no-repeat, repeat-x, repeat;
background-position: 10px 20px, top right;
```

不同属性的每个值，将与其他属性中相同位置的值匹配。

当属性值的数量不匹配时，数量较小的值会循环。

> 渐变可以与常规的背景图像很好地混合在一起。

#### 背景附加

```css
background-attachment: scroll; /* 背景随页面滚动，实际表现为页面固定 */
background-attachment: fixed;  /* 背景固定在窗口上 */
background-attachment: local;  /* 背景固定在元素上 */
```

#### 使用 background 速记属性

`background` 属性可以让你一次设置所有不同的背景属性。使用多重背景时，使用逗号分隔各背景的属性值。使用 `background` 速记属性时的规则：

- `background-color` 只能在最后一个逗号之后指定。
- `background-size` 只能在 `background-position` 之后指定，并用 `/` 分隔，例如：`center / 80%`。

```css
.box {
  background:   
    linear-gradient(105deg, rgba(255,255,255,.2) 39%, rgba(51,56,57,1) 96%) center center / 400px 200px no-repeat, /* 第一层背景是一个线性渐变 */
    url(big-star.png) center no-repeat, /* 第二层背景是一个图像 */
    rebeccapurple; /* 第三层背景是纯色背景，必须放在最后 */
}
```

#### 背景的可访问性考虑

如果指定了一个背景图像，你还应该指定一个 `background-color`，以便在图像未加载时文本也足够清晰。

### 圆角

```css
border-radius: 10px 5px; /* 分别指定水平半径和垂直半径，应用到盒子的四角 */
border-radius: 10px;

border-top-right-radius: 1em 10%; /* 指定特定角的圆角半径 */
```

### 书写模式

**property**

`writing-mode`

**Values**

`horizontal-tb`
: 块流向从上至下，对应的文本方向是横向的。

`vertical-rl`
: 块流向从右向左，对应的文本方向是纵向的。

`vertical-lr`
: 块流向从左向右，对应的文本方向是纵向的。

#### 书写模式、块级布局和内联布局

当我们切换书写模式时，我们也在改变块和内联文本的方向。`horizontal-tb` 书写模式下块的方向是从上到下的横向的，而 `vertical-rl` 书写模式下块的方向是从右到左的纵向的。因此，块维度指的总是块在页面书写模式下的显示方向。而内联维度指的总是文本方向。

水平书写模式下的两种维度：

![图片](https://media.prod.mdn.mozit.cloud/attachments/2020/03/18/17148/62e403b26b1d5dfd83bcd3bd67103f71/horizontal-tb-zh.png)

纵向书写模式下的两种维度：

![图片](https://media.prod.mdn.mozit.cloud/attachments/2020/03/18/17149/3820ee48cbd374006fbde6b9b91d8263/vertical-zh.png)

#### 逻辑属性

CSS中布满了**物理位置**的关键词，比如 `top`、`right`、`bottom` 和 `left`。把这些关键词称为**物理属性**，是因为它们与你看到的屏幕紧密相关，左永远是左，不管文本流动的方向如何。

当我们改变书写模式，比如当我们从 `horizontal-tb` 改为 `vertical-rl` 时，原来在上边的元素就应该被放到右边。这意味着如果我们改变书写模式，往往还要一同改变所有相关的物理属性以适合新的排版布局。在开发有多种语言的网站时，这是一个令人头疼的问题。因此，CSS 推出了逻辑属性，它们不受书写模式的影响，在任何书写模式下都保持同样的相对位置。

横向书写模式下，映射到 `width` 的属性被称作内联尺寸（`inline-size`）——内联维度的尺寸。而映射 `height` 的属性被称为块级尺寸（`block-size`），这是块级维度的尺寸。

`margin-top` 属性的映射是 `margin-block-start`——总是指向块级维度开始处的边距。

`padding-left` 属性映射到 `padding-inline-start`，这是应用到内联开始方向（这是该书写模式文本开始的地方）上的内边距。`border-bottom` 属性映射到的是 `border-block-end`，也就是块级维度结尾处的边框。

### 溢出

overflow 属性用来控制一个元素溢出的方式。

`visible`——默认
: 元素直接挤出盒子

`hidden`
: 将溢出的内容隐藏

`scroll`
: x 轴和 y 轴滚动条将永远显示在盒子中，不论是否有溢出。可以使用 `overflow-y` 属性，设置 `overflow-y: scroll` 来仅在 y 轴方向滚动。也可以使用速记属性：`overflow: hidden scroll`。

`auto`
: 只有在发生溢出时才显示滚动条。

### CSS 的值与单位

CSS 值倾向于使用尖括号表示：`<color>`，CSS 值也被称为数据类型。

如果属性接受多种 CSS 值，则一般这样表示：`<length-percent>`

|数值类型|描述|
|:---:|:---------|
|`<integer>`|`<integer>` 是一个整数，比如 1024 或 -55。|
|`<number>`|`<number>` 表示一个小数——它可能有小数点后面的部分，也可能没有，例如 0.255、128 或 -1.2。|
|`<dimension>`|`<dimension>` 是一个 `<number>`，它有一个附加的单位，例如 45deg、5s 或 10px。`<dimension>` 是一个伞形类别，包括 `<length>`、`<angle>`、`<time>` 和 `<resolution>` 类型。|
|`<percentage>`|`<percentage>` 表示一些其他值的一部分，例如 50%。百分比值总是相对于另一个量，例如，一个元素的长度相对于其父元素的长度。|

#### length

##### 绝对长度单位

绝对长度单位一般在用于打印机时更有用，如 cm，mm。唯一一个您常用的值，估计就是 px。

##### 相对长度单位

|单位|相对于|
|:---:|:---|
|`em`|在 font-size 中使用是相对于父元素的字体大小，在其他属性中使用是相对于自身的字体大小，如 width。|
|`x`|字符“x”的高度|
|`ch`|数字“0”的宽度|
|`rem`|根元素的字体大小|
|`lh`|元素的 line-height|
|`vw`|视窗宽度的百分比|
|`vh`|视窗高度的百分比|
|`vmin`|视窗较小尺寸的百分比|
|`vmax`|视图大尺寸的百分比|

###### em 和 rem

在排版属性中 em 单位的意思是“父元素的字体大小”（font size of the element）。而 rem 单位的意思是“根元素的字体大小”（font size of the root element）即 `<html>` 元素的字体大小（默认为 16px）。

#### percentage

许多时候，百分数是长度单位，它们常常可与长度互换。当使用百分数时，你需要清楚，它是**什么**东西的百分数。对于一个处于另外一个容器当中的盒子，如果你给予了子盒子一个百分数作为宽度，那么它指的是父容器宽度的百分数。如果将元素的字体大小设置为百分比，那么它将是元素父元素字体大小的百分比。

这是因为百分数是以**包含盒子的块**为根据解析的。如果我们的 `<div>` 没有被指定百分数的值，那么它会占据 100% 的可用空间，因为它是块级别的元素。如果我们给了它一个百分数作为宽度，那么这就是它原来情况下可以占据空间的百分数。

##### 把百分数作为内外边距

使用百分比作为元素外边距 `margin` 和内边距 `padding` 的单位时，值都是以包含块的**内联尺寸**为标准进行计算的，即它俩的标准是相同的。

#### number

有些值接受数字，不添加任何单位。比如不透明度 `opacity`，它接受 0 和 1 之间的数字。

#### color

##### 颜色关键词

你可以在这里找到更多[颜色关键字][color keywords]

##### 十六进制 RGB 值

每个十六进制值由一个散列号 `#` 和六个十六进制数字组成。每对值表示一个通道——红色、绿色和蓝色，并允许我们为每个通道指定 256 个可用值中的任意一个。

##### RGB 和 RGBA

RGB 值是一个函数——`rgb()`，它接受三个 0 到 255 的十进制数，分别表示红色、绿色和蓝色通道值。

`rgba()` 则接受第四个参数表示颜色的 alpha 通道。在现代浏览器中，`rgb()` 和 `rgba()` 以及 `hsl()` 和 `hsla()` 成为彼此的纯别名并开始表现完全相同。即 `rgb()` 也可以接受第四个参数表示 alpha 通道值。

> alpha 通道值接受的 0 ~ 1 数字常表示为 .3 这样的形式。

##### HSL 和 HSLA

`hsl()` 函数接受色调、饱和度和亮度值作为参数，而不是红色、绿色和蓝色值，这些值的不同组合方式，可以区分 1670 万种颜色（和 RGB 一样）。

- 色调： 颜色的底色。这个值在 0 和 360 之间，表示色轮周围的角度。
- 饱和度： 颜色有多饱和？ 它的值为 0% ~ 100%，其中 0% 为无颜色（它将显示为灰色阴影），100% 为全色饱和度。
- 亮度：颜色有多亮？ 它从 0% ~ 100% 中获取一个值，其中 0% 表示没有光（它将完全显示为黑色），100% 表示完全亮（它将完全显示为白色）。

#### image

`<image>` 可以是一个通过 `url()` 函数指向的实际图像文件，也可以是一个渐变（gradient）。

#### position

`<position>` 数据类型表示一组 2D 坐标，用于定位一个元素。它可以使用关键字（如 `top`, `left`, `bottom`, `right`, 以及 `center`）将元素与 2D 框的特定边界对齐，或者使用表示框的顶部和左侧边缘偏移量的长度。一个典型的位置值由两个值组成——第一个值水平地设置位置，第二个值垂直地设置位置。如果只指定一个轴的值，另一个轴将默认为 `center`。

#### 字符串和标识符

在 CSS 中，一些关键词可以作为特殊值被使用，如 red，这些关键词被称为**标识符**，它们是 CSS 可以理解的特殊值，不用被引号括起来。

而用引号括起来的则是字符串。

#### 函数

函数通常与 JavaScript、Python 或 C++ 等语言相关联，但它们也以属性值的形式存在于 CSS 中。我们已经在颜色部分看到了函数的作用——`rgb()`、`hsl()` 等。用于从文件返回图像的值——`url()`——也是一个函数。

行为更类似于传统编程语言的值是 `calc()` 函数。这个函数使您能够在 CSS 中进行简单的计算。如果您希望计算出在为项目编写 CSS 时无法定义的值，并且需要浏览器在运行时为您计算出这些值，那么它特别有用。

### min- 和 max- 尺寸

通过 `min-height` 可以设置盒子的最小高度，这在避免溢出的同时处理变化容量的内容的时候是很有用的。

`max-width` 的常见用法为，在没有足够空间以原有宽度展示图像时，让图像缩小。比如，如果使用 `width: 100%` 设置图像的宽度，当图像的原始宽度小于容器时，图像会被拉伸。如果它的原始宽度大于容器，则它会溢出。但是如果使用 `max-width: 100%`，那么图像可以变得比原始尺寸更小，但不会大于原始尺寸。

这个技术是用来让图片**可响应**的，所以在更小的设备上浏览的时候，它们会合适地缩放。

### 图像、媒体和表单元素

#### 替换元素

图像和视频被描述为替换元素。

#### 调整图像大小

常用技术是将图片的 `max-width` 设为 100%（调整图片盒子的大小）。这个技术也会对其他替换元素（例如 `<video>`，或者 `<iframe>`）起作用。

或者，使用 `object-fit` 属性（调整图片填充图片盒子的方式）。如果使用值 `cover`，则图像会被内接填充。如果使用值 `contain`，图像会被外接填充。如果使用值 `fill`，则图像会被非比例填充（默认）。

#### form 元素 {#form-element}

##### 继承和表单元素

在一些浏览器中，表单元素默认不会继承字体样式，因此如果你想要确保你的表单填入区域使用 body 中或者一个父元素中定义的字体，你需要向你的 CSS 中加入这条规则：

```css
button,
input,
select,
textarea {
  font-family : inherit;
  font-size : 100%;
}
```

##### form 元素与 box-sizing

跨浏览器的表单元素对于不同的组件使用不同的 box sizing 规则。在样式化表单时候，可以使用 `box-sizing` 属性，确保在给 form 元素设定宽度和高度时可以有统一的体验。

为了保证统一，将所有元素的内外边距均设为 0 是个好主意，然后在单独进行样式化控制的时候将这些加回来。

```css
button,
input,
select,
textarea {
  box-sizing: border-box; /* 使用替代盒模型 */
  padding: 0;
  margin: 0;
}
```

##### 其他有用的设置

除了上面提到的规则以外，你也应该在 `<textarea>` 上设置 `overflow: auto` 以避免 IE 在不需要滚动条的时候显示滚动条：

```css
textarea {
  overflow: auto;
}
```

你可以将 [form 元素](#form-element)这一节的规则放在一起，成为以下的“表单重置”。

```css
button,
input,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
  box-sizing: border-box;
  padding: 0; margin: 0;
}

textarea {
  overflow: auto;
} 
```

> 通用样式表做了和上面相似的事情，它确保了跨浏览器的任何东西都被默认设定为统一样式。不过由于浏览器显著地要比以往更加统一，它们不像以往那么重要了。你可以查看这个例子：[Normalize.css](http://necolas.github.io/normalize.css/)，它被许多项目用作基础，是非常流行的样式表。

### 样式化表格

#### 间距和布局

```css
/* spacing */

table {
  table-layout: fixed; /* 控制列的宽度由列标题决定 */
  width: 100%;
  border-collapse: collapse;
  border: 3px solid purple;
}


/* 分别控制各列的宽度 */
thead th:nth-child(1) {
  width: 30%;
}

thead th:nth-child(2) {
  width: 20%;
}

thead th:nth-child(3) {
  width: 15%;
}

thead th:nth-child(4) {
  width: 35%;
}

/* 设置 padding */
th, td {
  padding: 20px;
}
```

#### 斑马条纹图案

```css
tbody tr:nth-child(odd) {
  background-color: #ff33cc;
}

tbody tr:nth-child(even) {
  background-color: #e495e4;
}

table {
  background-color: #ff33cc;
}
```

#### 样式化标题

```css
caption-side: bottom; /* 设置标题的位置 */
font-style: italic;
text-align: center;
letter-spacing: 1px;
```

### 调试 CSS

[MDN：调试 CSS](https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/Debugging_CSS)

有时，当您停止思考问题时，解决方案就会神奇地出现，即使没有出现，在感到清爽的时候解决起问题来要容易很多。

[HTML 验证器](https://validator.w3.org/)

[CSS 验证器](https://jigsaw.w3.org/css-validator/)

### 组织 CSS

[MDN：组织 CSS](https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/Organizing)

## 样式化文字

### 字体

#### 网页安全字体

有些字体在几乎任何机器上都可用，它们叫做网页安全字体（Web Safe Fonts）：

|字体名称|范型|注意|
|:---:|:---:|:---|
|Arial|sans-serif|建议同时添加 Helvetica 作为优于 Arial 的首选字体，它们的字体几乎相同，但 Helvetica 有更好的形状，而 Arial 应用更广泛。|
|Courier New|monospace|一些操作系统有 Courier New 的替代（可能是更老的）版本叫 Courier。建议同时使用两种字体，并将 Courier New 作为首选。|
|Georgia|serif||
|Times New Roman|serif|一些操作系统有 Times New Roman 的替代（可能是更老的）版本叫 Times。建议同时使用两种字体，并将 Times New Roman 作为首选|
|Trebuchet MS|sans-serif|这种字体在移动操作系统上并不广泛|
|Verdana|sans-serif||

[cssfontstack.com](https://www.cssfontstack.com) 维护了一个可用在 Windows 和 MacOS 上的网页安全字体的列表

#### 默认字体

CSS 定义了 5 个通用字体名称：serif（有衬线），sans-serif（无衬线），monospace（等宽），cursive（手写）和 fantasy（装饰）。当使用这些通用名称时，不同的浏览器在不同的系统上使用的实际字体会有所不同。serif，sans-serif 和 monospace 比较好预测，而 cursive 和 fantasy 不太好预测。

> sans 是法语，意为 “无” 。

#### 字体栈

```css
font-family: "Trebuchet MS", Verdana, sans-serif;
```

为 `font-family` 属性提供一系列字体，浏览器将从第一个字体开始，逐个检查可用的字体。在字体栈的最后应该提供一个通用字体名，这样即使栈中的字体都不可用，浏览器也能选择一个相对合适的选择。

> 有些字体名包含不止一个单词，这时需要用引号包裹。

#### 字体样式，字体粗细，文本转换和文本装饰

`font-style`
: 打开和关闭文本 italic。将属性值设置为 italic 来打开斜体。

`font-weight`
: 设置文字的粗细。
: normal, bold, light, extrabold, black
: lighter, bolder：比父元素更细，更粗
: 100-900:数值粗体值

`text-transform`
: 允许你设置要转换的字体
: none：防止任何转型
: uppercase：将所有文本转为大写
: capitalize：所有单词首字母大写
: full-width：将所有字形转换成全角，即固定宽度的正方形，允许拉丁字符和亚洲语言字形对齐。

`text-decoration`
: none：取消文本装饰
: underline 下划线
: line-through 删除线

`text-decoration` 可以一次接受多个值。注意 `text-decoration` 是 `text-decoration-line`，`text-decoration-style`，`text-decoration-color` 的速记形式。因此你可以使用这样的属性值：

```css
text-decoration: line-through red wavy;
```

#### 文字阴影

```css
text-shadow: 4px 4px 5px red; /* 水平偏移 垂直偏移 模糊半径 阴影颜色 */
```

前两个值必须指定，可以使用大多数 CSS 长度与大小单位，但是 px 是比较合适的。偏移值可以为负。

##### 多重阴影

```css
text-shadow: -1px -1px 1px #aaa,
             0px 4px 1px rgba(0,0,0,.5),
             4px 4px 5px rgba(0,0,0,.7),
             0px 0px 7px rgba(0,0,0,.4);
```

### 文本布局

#### 文本对齐

`text-align`
: 控制文本如何和它所在的内容盒子对齐
: left：左对齐
: center：居中
: justify：等宽，一般结合 `hyphens` 属性使用

#### 行高

`line-height` 可以接受大多数 CSS 长度与大小单位，也可以设置一个无单位值作为倍数（推荐）。推荐的行高是 1.5~2 倍。

#### 字母和单词间距

`letter-spacing` 和 `word-spacing` 可以接受大多数 CSS 长度与大小单位。

[其他一些值得看一下的属性][other properties]

[Font 速记][font shorthand]

```css
text-indent: 4ch; /* 缩进 */
```

### 样式化 lists

#### list 的默认样式

- `<ul>`， `<ol>` 和 `<dl>` 元素有 1em 的顶部和底部 margin，以及 `<ul>` 和 `<ol>` 还有 2.5em 的左 padding。
- `<li>` 元素没有默认间距
- `<dd>` 元素有 2.5em 的左 margin
- `<p>` 元素也有 1em 的顶部和底部 margin

`list-style-type`
: 设置 `<ol>` 和 `<ul>` 的项目符号（bullets）类型
: 无序列表：`disc`, `square`, `circle`, `"\1F44D"`
: 有序列表：`decimal`, `simp-chinese-informal`, `upper-roman`, `lower-alpha`

`list-style-position`
: 设置项目符号放置在项目前（对齐项目）还是项目中（对齐序号）
: `outside`, `inside`

`list-style-image`
: 允许你使用自定义图片作为项目符号。注意，该属性在控制项目符号位置，大小等方面比较受限，最好使用 `background` 系列属性。

```css
/* 使用 list-style-image 属性 */
ul {
  list-style-image: url(star.svg);
}

/* 使用 background 属性的替代方案 */
ul {
  padding-left: 2rem; /* 将默认的 4rem 缩进减为 2rem，为图片腾位置 */
  list-style-type: none;
}

ul li {
  padding-left: 2rem; /* 给图片的 2rem 缩进 */
  background-image: url(star.svg);
  background-position: 0 0;
  background-size: 1.6rem 1.6rem; /* 图片大小为 16px，留下 4px 空隙 */
  background-repeat: no-repeat;
}
```

#### list-style 速记属性

```css
list-style: square url(example.png) inside;
```

属性值可以任意顺序排列，你可以设置一个，两个或三个值。如果同时提供 `type` 和 `image`，则 `type` 用作 `image` 无法加载时的回退。

#### 管理列表计数

##### start

```html
<!-- 列表从 4 开始计数 -->
<ol start="4">
  <li>item1</li>
  <li>item2</li>
  <li>item3</li>
</ol>
```

##### reversed

```html
<!-- 列表从 3 开始倒数 -->
<ol start="3" reversed>
  <li>item3</li>
  <li>item2</li>
  <li>item1</li>
</ol>
```

##### value

```html
<!-- 单独指定列表项数值 -->
<ol>
  <li value="2">item2</li>
  <li value="4">item4</li>
  <li value="6">item6</li>
</ol>
```

> 即便你使用非数字的 `list-style-type`，你依然需要为 `value` 属性赋予等价的数值。

#### See also

CSS 计数器提供用于自定义列表计数和样式的高级工具：

[@counter-style][@counter-style]

[counter-increment][counter-increment]

[counter-reset][counter-reset]

### 样式化 links

link 的不同状态及对应的伪类：

- link：有目标地址的 link（即不是仅有一个名字的 anchor）
- visited：被访问过的 link 
- hover：被鼠标指针悬停的 link
- focus：获焦的 link（比如通过键盘的 <kbd>Tab</kbd> 移动到这个 link 的时候，或者使用 `HTMLElement.focus()` 等编程方法聚焦）
- active：被激活的 link（被点击）

> 通过键盘聚焦链接：使用 <kbd>Tab</kbd> 键将焦点前移，<kbd>Shift</kbd> + <kbd>Tab</kbd> 将焦点后移（Mac 上按下 <kbd>Option</kbd> + <kbd>Tab</kbd>，或者通过 <kbd>Ctrl</kbd> + <kbd>F7</kbd> 启用 Full Keyboard Access: All controls 选项）

`cursor`
: 修改鼠标指针的样式。

`outline`
: 文字的轮廓。outline 和 border 很像，唯一的区别是 border 占用了盒模型的空间，而 outline 只是放置在背景的顶部。

典型的 link 规则集（**L**o**V**e **F**ears **HA**te）：

```css
a {
  outline: none;
  text-decoration: none;
  padding: 2px 1px 0;
}

a:link {
  color: #265301;
}

a:visited{
  color: #437A16;
}

a:focus {
  border-bottom: 1px solid; /* 使用 border-bottom 避免下划线穿过字母 g 和 y 底部；不设置 border-bottom 的颜色，使其采用元素文本的颜色（链接在不同状态下文本颜色不同） */
  background: #BAE498;
}

a:hover {
  border-bottom: 1px solid;
  background: #CDFEAA;
}

a:active {
  background: #265301;
  color: #CDFEAA;
}
```

这几个规则的顺序很重要，不要搞混。

#### 在链接中加入图标

[icons8.com](https://icons8.com/icon/741/external-link) 上的链接图标

```css
a[href*="http"] {
  background: url('external-link-52.png') no-repeat 100% 0; /* 100% 0 将图像位置指定在右上角，也可以使用 right top */
  background-size: 16px 16px;
  padding-right: 19px;
}
```

#### 将 link 样式化为按钮

```css
ul {
  padding: 0; /* 移除 ul 默认的 2.5em 左 padding */
  width: 100%; /* 设置宽度是外部容器的 100% */
}

li {
  display: inline; /* 创建水平导航栏，因此改变 display 属性 */
}

a {
  /* 先去掉 <a> 的默认样式 */
  outline: none;
  text-decoration: none;
  /* 设置 <a> 的大小，同时避免 <a> 独占一行 */
  display: inline-block;
  /* 5 个按钮平分 100% 的宽度 */
  width: 19.5%;         /* 5 个按钮宽度占据 97.5% 的宽度 */
  margin-right: 0.625%; /* 4 个 margin 占据 2.5% 的宽度 */
  text-align: center;
  line-height: 3; /* 给按钮一些高度，同时有文本垂直居中的效果 */
  color: black;
}

/* 移除最后一个按钮的右 margin 避免溢出到下一行 */
li:last-child a {
  margin-right: 0;
}

a:link, a:visited, a:focus {
  background: yellow;
}

a:hover {
  background: orange;
}

a:active {
  background: red;
  color: white;
}
```

参考：[MDN: Styling Links as Buttons][styling links as buttons]

### Web 字体

关于 Web 字体：

- 大部分字体都是收费的，你必须为字体付费，或者遵循其他许可条款，比如在代码中（或你的网站上）注明字体创建者的名字。
- 所有主流浏览器都支持 WOFF/WOFF2。
- WOFF2 支持所有 TrueType 和 OpenType 规范，包括可变字体，彩色字体，以及字体集。
- 在一个字体的 @font-face 中，如果你给浏览器提供多个可下载的字体文件，浏览器会选择第一个可用的下载。因此你应该把新的、更好的格式比如 WOFF2 放在前面，把偏老的，不太好的格式比如 TTF 放在后面（WOFF > OTF > TTF > SVG）。
- 如果你需要支持传统浏览器，则应该提供 EOT，TTF，以及 SVG 网络字体。

*[WOFF]: Web 开放字体格式（Web Open Font Format）

*[EOT]: Embedded Open Type

> 你可以使用 FireFox 开发者工具中的 Font Editor 来检视并调整网页中使用的字体

#### 使用下载的字体

三种获取字体的网站：

- 免费字体经销商（可能包含许可条款）：[Font Squirre][font squirre]，[dafont][dafont]，[Everything Fonts][everything fonts]
- 付费字体经销商：[fonts.com][fonts.com], [myfonts.com][myfonts.com]，以及字体铸造厂(?😂)：[Linotype][linotype]，[Monotype][monotype]，[Exljbris][exljbris]
- 在线字体服务：[Typekit][typekit]，[Cloud.typography][cloud.typography]，[Google Fonts][google fonts]

首先下载字体压缩包并解压，将需要的字体文件（同一字体可能有粗体、斜体等变体）上传到 [Fontsquirrel Webfont Generator][fontsquirrel webfont generator] 生成需要的 Webfont 套件压缩包。解压 Webfont 套件并重命名为 `fonts`，打开 `stylesheet.css` 文件，将里面的 `@font-face` 规则集拷贝到你的 CSS 文件的最顶部，并在每个 `url()` 路径的开头加上 `fonts/`。

现在，你就可以在 CSS 中使用刚刚导入的字体了。

**说明**

如果需要支持传统浏览器，则在生成 Webfont 套件前选择 "Expert" 选项，并选择 SVG，EOT，TTF 格式。

字体生成网站通常限制上传文件大小，在这种情况下，考虑使用以下转换工具：

- ttf 转换 woff：[sfnt2woff-zopfli][sfnt2woff-zopfli]
- ttf 转换 woff2：[woff2][woff2]
- ttf 转换 svg：[fontforge][fontforge]，[batik ttf2svf][batik ttf2svf]

```css
@font-face {
  /* 你给这个字体起的名字。同一字体的变体可以使用同一名字，通过下面的 font-weight 和 font-style 来区分 */
  font-family: 'DroidSerif'; 
  /* 指定文件路径及文件类型，文件类型可以帮助浏览器更快地判断哪些文件可用 */
  src: url('DroidSerif-Italic-webfont.woff2') format('woff2'), 
       url('DroidSerif-Italic-webfont.woff') format('woff'),
       url('DroidSerif-Italic-webfont.ttf') format('truetype');
  font-weight: normal; /* 指定这个字体是否为粗体 */
  font-style: italic; /* 指定这个字体是否为斜体 */
}
```

#### 使用在线字体服务

打开 Google Fonts，选择一个 font family，选择其中具体的 style，然后在右侧边栏中拷贝 Google 给出的代码片段分别加入 HTML 和 CSS 文件。

> 如果无法访问 Google Fonts，也可以使用[阿里字体素材平台](https://www.taobao.com/markets/fuwu/fontmarket_freefonts)

> 中文字体文件较大，不适合直接用于 Web Font 。

#### 示例

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

------

[reference table of selectors]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/Selectors#%E9%80%89%E6%8B%A9%E5%99%A8%E5%8F%82%E8%80%83%E8%A1%A8

[functions]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/First_steps/How_CSS_is_structured#%E5%87%BD%E6%95%B0

[specificity]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/Cascade_and_inheritance#%E4%BC%98%E5%85%88%E7%BA%A7_2

[generating content with ::before and ::after]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/Selectors/Pseudo-classes_and_pseudo-elements#%E7%94%9F%E6%88%90%E5%B8%A6%E6%9C%89before%E5%92%8Cafter%E7%9A%84%E5%86%85%E5%AE%B9

[reference section]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/Selectors/Pseudo-classes_and_pseudo-elements#%E5%8F%82%E8%80%83%E8%8A%82

[pseudo-classes]: https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes

[margins, padding, and borders]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/The_box_model#%E5%A4%96%E8%BE%B9%E8%B7%9D%EF%BC%8C%E5%86%85%E8%BE%B9%E8%B7%9D%EF%BC%8C%E8%BE%B9%E6%A1%86

[block box and inline box]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/The_box_model#%E5%9D%97%E7%BA%A7%E7%9B%92%E5%AD%90%EF%BC%88block_box%EF%BC%89_%E5%92%8C_%E5%86%85%E8%81%94%E7%9B%92%E5%AD%90%EF%BC%88inline_box%EF%BC%89

[color keywords]: https://developer.mozilla.org/zh-CN/docs/Web/CSS/color_value#%E9%A2%9C%E8%89%B2%E5%85%B3%E9%94%AE%E5%AD%97

[other properties]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Styling_text/Fundamentals#%E5%85%B6%E4%BB%96%E4%B8%80%E4%BA%9B%E5%80%BC%E5%BE%97%E7%9C%8B%E4%B8%80%E4%B8%8B%E7%9A%84%E5%B1%9E%E6%80%A7

[font shorthand]: https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Styling_text/Fundamentals#font_%E7%AE%80%E5%86%99

[@counter-style]: https://developer.mozilla.org/zh-CN/docs/Web/CSS/@counter-style

[counter-increment]: https://developer.mozilla.org/zh-CN/docs/Web/CSS/counter-increment

[counter-reset]: https://developer.mozilla.org/zh-CN/docs/Web/CSS/counter-reset

[styling links as buttons]: https://developer.mozilla.org/en-US/docs/Learn/CSS/Styling_text/Styling_links#styling_links_as_buttons

[font squirre]: https://www.fontsquirrel.com
[dafont]: https://www.dafont.com
[everything fonts]: https://everythingfonts.com
[fonts.com]: https://www.fonts.com
[myfonts.com]: https://www.myfonts.com
[linotype]: https://www.linotype.com
[monotype]: https://www.monotype.com
[exljbris]: https://www.exljbris.com
[typekit]: https://fonts.adobe.com
[cloud.typography]: https://www.typography.com/webfonts
[google fonts]: https://fonts.google.com

[fontsquirrel webfont generator]: https://www.fontsquirrel.com/tools/webfont-generator

[sfnt2woff-zopfli]: https://github.com/bramstein/sfnt2woff-zopfli
[woff2]: https://github.com/google/woff2
[fontforge]: https://fontforge.org/
[batik ttf2svf]: https://people.apache.org/~clay/batik/ttf2svg.html