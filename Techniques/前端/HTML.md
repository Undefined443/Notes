# HTML

## Introduction To HTML

### 命名格式

- 全部小写
- 用短横线作为分隔符，而不是空格或下划线

### 目录结构

最基本、最常见的结构：

- `index.html` 主页
- `images` 图片文件夹
- `styles` 样式表文件夹
- `scripts` 脚本文件夹

### 配置本地服务器

```bash
# 进入网站所在目录
python -m http.server 7800 # 默认端口为 8000
```

现在可以通过浏览器转到 `localhost:7800` 来访问此服务器。

### 通过 GitHub 发布网站

在 GitHub 新建库，命名为 `yourname.github.io`（全小写），并将网站文件加入库即可。此时可通过 `yourname.github.io` 访问你的网站。

### HTML 标签的语法格式

```html
<开始标签 属性="xxx">内容</结束标签>
```

> HTML 标签也称为 HTML **元素**

#### 自闭合标签

有些 HTML 标签没有单独的结束标签，而是在开始标签中添加 `/` 来进行闭合。

> 自闭合标签也称为“空元素”（empty elements）

```html
<img src="./IMG.png" />
<hr />
<br />
<input type="text" placeholder="xxx" />
```

#### 块级元素

块级元素最主要的特点是它们自己独占一行。块级元素最具代表性的就是 `<div>`，此外还有 `<p>`, `<nav>`, `<aside>`, `<header>`, `<footer>`, `<section>`, `<article>`, `<ul>`, `<address>`, `<h1>` ~ `<h6>` 等。

块级元素的主要特征如下所示：

- 不管是否使用换行标签，块级元素总是在新行上开始；
- 块级元素的宽度、高度以及外边距和内边距等都可以控制；
- 如果省略块级元素的宽度，那么它的宽度默认为当前浏览器窗口的宽度；
- 块级元素中可以包含其它的内联元素和块级元素。

#### 内联元素

内联元素也可以称为行内元素，内联元素中最常用的是 `<span>`，此外还有 `<b>`, `<i>`, `<u>`, `<em>`, `<strong>`, `<sup>`, `<sub>`, `<big>`, `<small>`, `<li>`, `<ins>`, `<del>`, `<code>`, `<cite>`, `<dfn>`, `<kbd>` 和 `<var>` 等。

内联元素的主要特征如下所示：

- 内联元素和其他元素会在同一行上显示；
- 内联元素的宽、高以及外边距和内边距都不可以改变；
- 内联元素的宽度就是其中内容的宽度，且不可以改变；
- 内联元素中只能容纳文本或者其他内联元素。

对于内联元素的使用，需要注意如下几点：

- 设置宽度 `width` 无效；
- 设置高度 `height` 无效，但可以通过 `line-height` 来设置行高；
- 可以设置 `margin` 外边距，但只对左右外边距有效，上下无效；
- 设置 `padding` 内边距时，只有左右 `padding` 有效，上下则无效，需要注意的是元素范围是增大了，但是对元素周围的内容是没影响的；
- 可以通过 `display` 属性将元素在内联元素和块级元素之间进行切换。

#### 无语义元素

有时候你可能只想将一组元素作为一个单独的实体来使用。为了应对这种情况，HTML 提供了 `<div>` 和 `<span>` 元素。应配合使用 `class` 属性提供一些标签，使这些元素能易于查询。

> 警告：`<div>` 非常便利但容易被滥用。由于它们没有语义值，会使 HTML 代码变得混乱。要小心使用，只有在没有更好的语义方案时才选择它，而且要尽可能少用， 否则文档的升级和维护工作会非常困难。

### HTML 通用属性

`id`
: 用来赋予某个标签唯一的标识符。当我们用 CSS 或者 JavaScript 来操作这个标签时，可以通过 id 属性来找到这个标签。

`class`
: 同样是为标签定义一个标识符，不过这个标识符可以不唯一。我们可以为多个标签定义相同的 class 属性，也可以为一个标签定义多个 class 属性。

```html
<div class="class1 class2 class3"></div>
<p class="content">some text</p>
<div class="content">xxx</div>
```

`title`
: 当鼠标移动到标签上时，就会显示 title 的值。

`style`
: 使用 style 属性我们可以在 HTML 标签内部为标签定义 CSS 样式，例如设置文本的颜色、字体等。

```html
<p style="color:red;">red text</p>
<img src="xxx" style="height:50px;">
<div style="paddding:10px;border:2px solid #999;text-align:center;">some text</div>
```

### 布尔属性

有时你会看到没有值的属性，它是合法的。这些属性被称为布尔属性，他们只能有跟它的属性名一样的属性值。例如 `disabled` 属性，它们可以标记表单输入使之变为不可用。

```html
<input type="text" disabled>

<!-- 相当于下面 -->
<input type="text" disabled="disabled">
```

### 实体引用

|原义字符|等价字符引用|
|:--------:|:-------------:|
|<|`&lt;`|
|>|`&gt;`|
|"|`&quot;`|
|'|`&apos;`|
|&|`&amp;`|
|空格|`&nbsp;`|

### \<head\> 里有什么

#### \<meta\> 元素

Metadata——元数据
: 用于描述数据的数据

##### 添加作者和描述

许多 `<meta>` 元素包含了 `name` 和 `content` 属性：

- `name` 指定了 meta 元素的类型； 说明该元素包含了什么类型的信息。
- `content` 指定了实际的元数据内容。

```html
<!-- 添加作者和描述 -->
<meta name="author" content="Chris Mills">
<meta name="description" content="The MDN Learning Area aims to provide complete beginners to the Web with all they need to know to get started with developing web sites and applications.">
```

description 也被使用在搜索引擎显示的结果页中。

可以在 [Google's webmaster toos](https://www.google.com/webmasters/tools/) 中进行配置使你的站点对搜索引擎更友好。

许多网站有自己编写的元数据协议，用于向某些网站提供可使用的特定信息。

#### 为你的站点增加自定义图标

```html
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
```

大多数浏览器也支持 `.gif` 或 `.png` 格式的图标

### 为文档设置主语言

```html
<html lang="zh-CN">

<!-- 也可以为文档的分段设置不同的语言 -->
<p>日语实例: <span lang="jp">ご飯が熱い。</span>.</p>
```

### HTML 超链接

```html
<a href="xxx" title="xxx" target="_blank">显示内容</a>

<a href="#">回到顶部</a>

<!-- 将图像转换为链接 -->
<a href="https://www.mozilla.org/zh-CN/">
  <img src="mozilla-image.png" alt="链接至 Mozilla 主页的 Mozilla 标志">
</a>

<!-- 链接到文档片段 -->
<!-- 先给要链接到的元素分配一个 id 属性 -->
<h2 id="Mailing_address">邮寄地址</h2>

<!-- 然后在 URL 的结尾使用哈希标记 '#' 指向该 id -->
<p>要提供意见和建议，请将信件邮寄至 <a href="contacts.html#Mailing_address">我们的地址</a>。</p>

<!-- 在同一文档下可以省略 URL -->
<p>本页面底部可以找到 <a href="#Mailing_address">公司邮寄地址</a>。</p>
```

`target` 属性
: 指明新页面的打开方式。绝大部分情况下，target 属性要么不写，保持默认的 \_self（在当前标签页打开），要么将它的值设置为 \_blank（在新标签页打开）。

`download` 属性
: 指示浏览器下载 URL。若提供了属性值，则属性值将作为预填充文件名。

#### 电子邮件链接

使用 mailto 协议的 URL

```html
<a href="mailto:nowhere@mozilla.org">向 nowhere 发邮件</a>
```

当点击该链接时，将创建一个新的电子邮件并将收件人预设为 nowhere@mozilla.org

除了电子邮件地址，您还可以提供其他信息。事实上，任何标准的邮件头字段都可以被添加到你提供的邮件 URL。 其中最常用的是主题 (subject)、抄送 (cc) 和主体 (body) 。每个字段及其值被指定为查询项。

```html
<a href="mailto:nowhere@mozilla.org?cc=name2@rapidtables.com&bcc=name3@rapidtables.com&subject=The%20subject%20of%20the%20email&body=The%20body%20of%20the%20email">
  Send mail with cc, bcc, subject and body
</a>
```

> 使用 `?` 来分隔主 URL 与参数值，以及使用 `&` 来分隔 mailto: 中的各个参数。这是标准的 URL 查询标记方法。

 ### 文本格式

 [C 语言中文网：文本格式化](http://c.biancheng.net/view/9386.html)

 根据 HTML5 的规范，标题应该用 `<h1>`~`<h6>` 标签定义，被强调的文本应该用 `<em>` 标签定义，重要的文本应该用 `<strong>` 标签定义，被标记的或者高亮显示的文本应该用 `<mark>` 标签定义。

只用于改变字体样式而没有特定语义的元素称为表象元素，应尽量避免使用这类元素。

#### 列表

##### 有序列表

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

##### 定义列表

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

[C 语言中文网：使用 CSS 修改列表样式](http://c.biancheng.net/view/9389.html)


#### 引用

##### 块引用

使用 `<blockquote>` 元素将引用内容包裹起来，并且在 cite 属性里用 URL 来指向引用的资源。

```html
<blockquote cite="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/blockquote">
  <p>The <strong>HTML <code>&lt;blockquote&gt;</code> Element</strong> (or <em>HTML Block
  Quotation Element</em>) indicates that the enclosed text is an extended quotation.</p>
</blockquote>
```

##### 行内引用

使用 `<q>` 元素将引用内容包裹起来，并且在 cite 属性里用 URL 来指向引用的资源。

```html
<p>The quote element — <code>&lt;q&gt;</code> — is <q cite="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/q">intended
  for short quotations that don't require paragraph breaks.</q></p>
```

浏览器会将其作为普通文本放入引号内表示引用。

`<q>` 元素旨在用于不需要分段的短引用。

##### 引文

cite 属性的内容不会被浏览器显示。若想要确保用户可以找到引用来源，更好的方法是为 `<cite>` 元素附上链接：

```html
<p>quotation</q> -- <a href="URL"><cite>MDN q page</cite></a>.</p>
```

#### 缩写

```html
<p>我们使用 <abbr title="超文本标记语言（Hyper text Markup Language）">HTML</abbr> 来组织网页文档。</p>

<p>第 33 届 <abbr title="夏季奥林匹克运动会">奥运会</abbr> 将于 2024 年 8 月在法国巴黎举行。</p>
```

#### 标记联系方式

```html
<address>
  <p>Chris Mills, Manchester, The Grim North, UK</p>
</address>

<!-- 这种形式也可以 -->
<address>
  <p>Page written by <a href="../authors/chris-mills/">Chris Mills</a>.</p>
</address>
```

#### 展示计算机代码

- `<code>`：用于标记计算机通用代码。
- `<pre>`：用于保留空白符。
- `<var>`：用于标记具体变量名。
- `<kbd>`：用于标记键盘（或其他类型）输入。
- `<samp>`：用于标记计算机程序的输出。

```html
<pre><code>const para = document.querySelector('p');

para.onclick = function() {
  alert('噢，噢，噢，别点我了。');
}</code></pre>

<p>在上述的 JavaScript 示例中，<var>para</var> 表示一个段落元素。</p>

<p>请不要使用 <code>&lt;font&gt;</code> 、 <code>&lt;center&gt;</code> 等表象元素。</p>

<pre>$ ping mozilla.org
<samp>PING mozilla.org (63.245.215.20): 56 data bytes
64 bytes from 63.245.215.20: icmp_seq=0 ttl=40 time=158.233 ms</samp></pre>
```

#### 标记时间和日期

```html
<time datetime="2016-01-20">2016年1月20日</time>
```

[MDN：标记日期和时间][marking up times and dates]

### HTML 文档结构

```html
<!-- 文档类型声明 -->
<!DOCTYPE html>

<!-- HTML 页面的根标签 -->
<html lang="zh-cn">

  <!-- 保存页面的一些元数据 -->
  <head>

    <!-- 指明网页的编码，可省略 -->
    <meta charset="UTF-8">

    <!-- 定义网页的标题 -->
    <title>HTML 演示</title>
  </head>

  <!-- 定义网页的内容 -->
  <body>
  
    <!-- 页眉 -->
    <header>
      <!-- 导航栏 -->
      <nav>

      </nav>
    </header>

    <!-- 主内容 -->
    <main>
      <article>

      </article>

      <!-- 边栏 -->
      <aside>

      </aside>
    </main>

    <footer>

    </footer>
  </body>
</html>
```

#### 布局元素

- `<header>`：页眉。
- `<nav>`：导航栏。
- `<main>`：主内容。主内容中还可以有各种子内容区段，可用 `<article>`、`<section>` 和 `<div>` 等元素表示。
- `<aside>`：侧边栏，经常嵌套在 `<main>` 中。
- `<footer>`：页脚。

[MDN：文档与网站结构](https://developer.mozilla.org/zh-CN/docs/Learn/HTML/Introduction_to_HTML/Document_and_website_structure)

### 注释规范

#### 单行注释

注释内容前后各一个空格，注释位于要注释代码的上面，独占一行。

```html
<!-- Comment Text -->
<div>...</div>
```

#### 模块注释

用于描述模块开始与结束的位置。模块与模块之间空一行。

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

#### 嵌套模块注释

当模块注释内再出现模块注释时，为了突出主要模块，嵌套模块不再使用，而只在内部模块结束的位置进行单行注释。

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

## 多媒体与嵌入

### 图片

```html
<img src="./IMG.png" alt="description" width="150" height="100">

<!-- 使用 CSS 来改变图片尺寸 -->
<img src="./IMG.png" alt="description" style="width:150px; height:100px;">
```

关于 `width` 和 `height` 属性的建议：

- 一般建议为图片设置 `width` 和 `height` 属性，以便浏览器可以在加载图片之前为其分配足够的空间，否则图片加载过程中可能会导致您的网站布局失真或闪烁。
- 但是您不应该使用 HTML 属性来改变图片的大小。如果要改变图片的尺寸，请使用 CSS。
- 如果您的页面使用响应式布局（自适应布局），建议在上传图片之前裁剪好尺寸，而不要设置 `width` 和 `height` 属性，这样图片能够跟随屏幕宽度自动改变尺寸，从而不会变形，或者超出屏幕宽度。

> **警告：** 大多数图片是有版权的。不要在你的网页上使用一张图片，除非：
>
> - 你是图片版权所有者
> - 你有图片版权所有者明确的、书面上的使用授权
> - 你有充分的证据证明这张图片是公共领域内的
> 
> 侵犯版权是违法并且不道德的。此外，在得到授权之前永远不要把你的 src 属性指向其他人网站上的图片。这被称为"盗链（hotlinking）"。同样，盗取其他人的带宽也是违法的。而且这会降低你的页面的加载速度，而且图片可能会在不受你控制的情况下被移走或用别的令人尴尬的东西替换掉。

#### 为图片搭配说明文字

```html
<figure>
  <img src="https://raw.githubusercontent.com/mdn/learning-area/master/html/multimedia-and-embedding/images-in-html/dinosaur_small.jpg"
     alt="一只恐龙头部和躯干的骨架，它有一个巨大的头，长着锋利的牙齿。"
     width="400"
     height="341">
  <figcaption>曼彻斯特大学博物馆展出的一只霸王龙的化石</figcaption>
</figure>
```

`<figcaption>` 元素告诉浏览器和其他辅助的技术工具这段说明文字描述了 `<figure>` 元素的内容.

`<figure>` 里不一定要是一张图片，也可以是几张图片、一段代码、音视频、方程、表格或别的。

#### CSS 背景图片

为页面中的所有段落设置一个背景图片：

```css
p {
  background-image: url("images/dinosaur.jpg");
}
```

#### 响应式图片

##### 分辨率切换：不同的尺寸

我们想要显示相同的图片内容，仅仅依据设备来显示更大或更小的图片。

```html
<img srcset="elva-fairy-320w.jpg 320w,
             elva-fairy-480w.jpg 480w,
             elva-fairy-800w.jpg 800w"
     sizes="(max-width: 320px) 280px,
            (max-width: 480px) 440px,
            800px"
     src="elva-fairy-800w.jpg" alt="Elva dressed as a fairy">
```

`srcset` 属性
: 定义可选择的图像集，以及每个图像的宽度（像素）。注意宽度的单位是 w。

`sizes` 属性
: 定义了一组媒体条件，以及当媒体条件为真时图像将填充的槽的宽度。最后一个槽的宽度是默认值，没有媒体条件。槽的宽度的单位可以是 `px`，`em` 或 `vw`。

##### 分辨率切换：相同的尺寸

```html
<img srcset="elva-fairy-320w.jpg,
             elva-fairy-480w.jpg 1.5x,
             elva-fairy-640w.jpg 2x"
     src="elva-fairy-640w.jpg" alt="Elva dressed as a fairy">
```

```css
img {
  width: 320px;
}
```

浏览器将计算显示器的分辨率，然后选择 `srcset` 提供的最适合的图像。如果显示器具有标准/低分辨率，一个显示器像素表示一个 CSS 像素，将加载 320w 版本图像（1x 是默认值，不用写出来）。如果显示器有高分辨率，两个或更多的显示器像素表示一个 CSS 像素，将加载 640w 版本的图像。

通过 [tinypng.com](https://tinypng.com/) 优化图片大小

[MDN：分辨率切换][resolution switching]

##### 美术设计

当网站在狭窄的屏幕上观看时，显示一幅图片的包含了重要细节的裁剪版本，第二个被裁剪的图片会在像平板电脑这样的中等宽度的屏幕设备上显示，这就是众所周知的美术设计问题。

```html
<picture>
  <source media="(min-width: 1000px)" srcset="logo-large.png">
    <source media="(max-width: 500px)" srcset="logo-small.png">
    <img src="logo-default.png" alt="默认Logo">
</picture>
```

在 `<picture>` 标签中包含零个或多个 `<source>` 标签，通过 `<source>` 标签中的 `media` 属性设定匹配条件（允许哪个版本的图片显示），通过 `srcset` 属性定义图片的路径。另外，在 `<picture>` 标签的最后还需要定义一个 `<img>` 标签，表示默认选项。

[MDN：美术设计][art direction]

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

### 视频和音频

视频使用 `<video>` 标签，音频使用 `<audio>` 标签。两者的使用方法是类似的。

```html
<video src="rabbit320.webm" controls>
  <p>你的浏览器不支持 HTML5 视频。可点击<a href="rabbit320.mp4">此链接</a>观看</p>
</video>
```

`controls` 属性
: 为音视频添加浏览器提供的控件界面

`<video>` 标签内的内容
: 这个叫做后备内容。当浏览器不支持 `<video>` 标签的时候，就会显示这段内容。

#### 使用多个播放源以提高兼容性

```html
<video controls>
  <source src="rabbit320.mp4" type="video/mp4">
  <source src="rabbit320.webm" type="video/webm">
  <p>你的浏览器不支持 HTML5 视频。可点击<a href="rabbit320.mp4">此链接</a>观看</p>
</video>
```

浏览器将会检查 `<source>` 标签，并且播放第一个与其自身 codec 相匹配的媒体。你的视频应当包括 WebM 和 MP4 两种格式，这两种在目前已经足够支持大多数平台和浏览器。如果不指定 `type` 属性，浏览器会尝试加载每一个文件，直到找到一个能正确播放的格式，这样会消耗掉大量的时间和资源。

#### 其他 \<video\> 属性

```html
<video controls width="400" height="400"
       autoplay loop muted
       poster="poster.png">
  <source src="rabbit320.mp4" type="video/mp4">
  <source src="rabbit320.webm" type="video/webm">
  <p>你的浏览器不支持 HTML5 视频。可点击<a href="rabbit320.mp4">此链接</a>观看</p>
</video>
```

[MDN：其他 \<video\> 属性][other video features]

[MDN：显示音轨文本][displaying video text tracks]


### 其他嵌入技术

通过 `<iframe>` 元素，可以将一个 web 页嵌入到另一个网页。很多视频网站，如 YouTube，Bilibili，以及 Google Map 都支持嵌入。通常在分享界面可以找到需要的代码。可通过 `width` 和 `height` 属性设置 iframe 的大小。

通过 `<object>` 元素嵌入 PDF 文件：

```html
<object data="mypdf.pdf" type="application/pdf"
        width="800" height="1200" typemustmatch>
  <p>You don't have a PDF plugin, but you can <a href="myfile.pdf">download the PDF file.</a></p>
</object>
```

[MDN：其他嵌入技术][other embedding technologies]

## HTML 表格

```html
<!-- 认情况下，表格是没有边框的。这里将边框宽度设置为 1px，同时利用 CSS 设置边框塌陷，使双边框变为单边框 -->
<table border="1" style="border-collapse:collapse;">
  <caption>表格标题</caption>

  <!-- table row -->
  <tr>

    <!-- table header -->
    <th>名称</th>
    <th>官网</th>
    <th>性质</th>
  </tr>
  <tr>

    <!-- table data -->
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

`<th>` 用法和 `<td>` 是一样的，除了它表示为标题，不是普通的单元格。

### 定义列的样式

在 `<table>` 标签下，使用 `<colgroup>` 和 `<col>` 标签来定义列的样式：

```html
<table>
  <colgroup>
    <col>
    <col style="background-color: yellow">
  </colgroup>
  <tr>
    <th>Data 1</th>
    <th>Data 2</th>
  </tr>
  <tr>
    <td>Calcutta</td>
    <td>Orange</td>
  </tr>
  <tr>
    <td>Robots</td>
    <td>Jazz</td>
  </tr>
</table>
```

一个 `<col>` 对应一列，这个表格有两列，因此这里有两个 `<col>`。

#### 将样式应用到多列

使用 `span` 属性，指定要将样式应用到表格多少列。

```html
<colgroup>
  <col style="background-color: yellow" span="2">
</colgroup>
```

#### 添加表格标题

在 `<table>` 标签下插入 `<caption>` 标签：

```html
<table>
  <caption>Dinosaurs in the Jurassic period</caption>

  ...
</table>
```

#### 表格结构化

使用 `<thead>`，`<tbody>`，和 `<tfoot>` 标签包围表头，内容和表尾。

表格结构化有利于更好地将 CSS 应用到表格上。

> `<tbody>` 是隐式包含在表格中的。

#### scope 属性

为了帮助屏幕阅读器更好地理解标题单元格，应该为 `<th>` 元素增加 `scope` 属性，说明该标题是列标题还是行标题。屏幕阅读设备会识别这种结构化的标记，并一次读出整列或整行。

你可以这样定义列标题：

```html
<thead>
  <tr>
    <th scope="col">Purchase</th>
    <th scope="col">Location</th>
    <th scope="col">Date</th>
    <th scope="col">Evaluation</th>
    <th scope="col">Cost (€)</th>
  </tr>
</thead>
```

以及这样的行标题：

```html
<tr>
  <th scope="row">Haircut</th>
  <td>Hairdresser</td>
  <td>12/09</td>
  <td>Great idea</td>
  <td>30</td>
</tr>
```

`scope` 属性还有两个可选的值：`colgroup` 和 `rowgroup`。这些用于多个列或行的标题。

#### id 和 header 属性

`scope` 属性也可以用 `id` 和 `header` 属性替换：

1. 为每个 `<th>` 元素添加一个 `id` 属性
2. 为每个 `<td>` 元素添加一个 `header` 属性，属性值包含它从属的所有标题的 `id`，用空格分隔。

```html
<thead>
  <tr>
    <th id="purchase">Purchase</th>
    <th id="location">Location</th>
    <th id="date">Date</th>
    <th id="evaluation">Evaluation</th>
    <th id="cost">Cost (€)</th>
  </tr>
</thead>
<tbody>
<tr>
  <th id="haircut">Haircut</th>
  <td headers="location haircut">Hairdresser</td>
  <td headers="date haircut">12/09</td>
  <td headers="evaluation haircut">Great idea</td>
  <td headers="cost haircut">30</td>
</tr>

  ...

</tbody>
```

这会给表格中每个单元格的位置一个明确的定义。像一个电子表格一样，通过 headers 属性来定义单元格属于哪些行或列。为了让它工作良好，表格同时需要列和行标题。

### 表单

```html
<!-- 表单中其他标签 -->
<form action="URL" method="GET|POST">
</form>
```

- action 属性指明将表单提交到哪个页面（跳转到哪个页面）
- method 属性表示使用哪个方式提交数据
  - GET：用户点击提交按钮后，提交的信息会被显示在地址栏中。如果提交的信息中包含密码，则不建议这种方式。
  - POST：数据会传到后台，不显示在地址栏中。

[C 语言中文网：表单控件](http://c.biancheng.net/view/7564.html)

*[href]: Hypertext Reference
*[codec]: 编解码器（从“coder-decoder”派生的混合词）

[marking up times and dates]: https://developer.mozilla.org/zh-CN/docs/Learn/HTML/Introduction_to_HTML/Advanced_text_formatting#%E6%A0%87%E8%AE%B0%E6%97%B6%E9%97%B4%E5%92%8C%E6%97%A5%E6%9C%9F

[resolution switching]: https://developer.mozilla.org/zh-CN/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images#%E5%88%86%E8%BE%A8%E7%8E%87%E5%88%87%E6%8D%A2%EF%BC%9A%E4%B8%8D%E5%90%8C%E7%9A%84%E5%B0%BA%E5%AF%B8

[art direction]: https://developer.mozilla.org/zh-CN/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images#%E7%BE%8E%E6%9C%AF%E8%AE%BE%E8%AE%A1

[other embedding technologies]: https://developer.mozilla.org/zh-CN/docs/Learn/HTML/Multimedia_and_embedding/Other_embedding_technologies

[other video features]: https://developer.mozilla.org/zh-CN/docs/Learn/HTML/Multimedia_and_embedding/Video_and_audio_content#%E5%85%B6%E4%BB%96_%3Cvideo%3E_%E7%89%B9%E6%80%A7

[displaying video text tracks]: https://developer.mozilla.org/zh-CN/docs/Learn/HTML/Multimedia_and_embedding/Video_and_audio_content#%E6%98%BE%E7%A4%BA%E9%9F%B3%E8%BD%A8%E6%96%87%E6%9C%AC