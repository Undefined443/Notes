# CSS

层叠样式表（Cascading Style Sheet）

https://developer.mozilla.org/zh-CN/docs/Learn/CSS/First_steps/How_CSS_is_structured

在 `.html` 文件中引入 CSS

```html
<!-- 将以下代码添加到文档头 -->
<script> src="scripts/main.js" defer></script>
```

## 注释规范

### 单行注释

注释内容第一个字符和最后一个字符都是一个空格，独占一行，行与行之间相隔一行：

```css
/* Comment Text */
.jdc {}

/* Comment Text */
.jdc {}
```

### 模块注释

注释内容第一个字符和最后一个字符都是一个空格，`/*` 与 模块信息描述占一行，多个横线分隔符 `-` 与 `*/` 占一行，行与行之间相隔两行：

```css
/* Module A
---------------------------------------------------------------- */
.mod_a {}


/* Module B
---------------------------------------------------------------- */
.mod_b {}
```

### 文件信息注释

在样式文件编码声明 `@charset` 语句下面注明页面名称、作者、创建日期等信息：

```css
@charset "UTF-8";
/**
 * @desc File Info
 * @author Author Name
 * @date 2015-10-10
 */
```

## CSS 规则集

![](https://media.prod.mdn.mozit.cloud/attachments/2019/02/10/16483/0b162bb3014591dbb741d7d905afc70f/css-declaration.png)

这个整体称作规则集。

### 选择器的类型

| 选择器名称 | 选择的内容 |	示例 |
|-------------|-------------|------|
| 元素选择器 （标签选择器）| 所有指定类型的 HTML 元素 | `p`<br />选择 `<p>` |
| ID 选择器 | 具有指定 ID 的元素 | `#my-id`<br />选择 `<p id="my-id">` 或 `<a id="my-id">`|
| 类选择器 | 具有特定类的元素 | `.my-class`<br />选择 `<p class="my-class">` 和 `<a class="my-class">` |
| 属性选择器 | 拥有特定属性的元素 | `img[src]`<br />选择 `<img src="myimage.png">` 而不是 `<img>` |
| 伪（Pseudo）类选择器 | 特定状态下的特定元素（比如鼠标指针悬停）| `a:hover`<br />仅在鼠标指针悬停在链接上时选择 `<a>` |

选择器的种类远不止于此，更多信息请参阅 [选择器](https://developer.mozilla.org/zh-CN/docs/Learn/CSS/Building_blocks/Selectors)。

## 字体和文本

> 中文字体文件较大，不适合直接用于 Web Font 。
> 
[Google Fonts](https://www.google.com/fonts)

[阿里字体素材平台](https://www.taobao.com/markets/fuwu/fontmarket_freefonts)

要选择一种字体，打开 Google Fonts，选择一个 font family，选择其中具体的 style，然后在右侧边栏中拷贝 Google 给出的代码片段分别加入 .html 和 .css 文件。

### 常用规则

```css
html {
  font-size: 14px;     /* 字号 */
  text-align: center;  /* 文本对齐 */
  line-height: 2;      /* 行高；当值为数字 n 时行高就是字体大小乘 n */
  letter-spacing: 1px; /* 字间距 */
}
```

## CSS 的盒模型布局

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