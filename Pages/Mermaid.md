# Mermaid

## flowchart

### 流程图方向

- TB - top to bottom
- TD - top-down/ same as top to bottom
- BT - bottom to top
- RL - right to left
- LR - left to right

### 结点形状

```mermaid
flowchart TD
1(圆角矩形)
2([体育馆])
3[[子例程]]
4[(数据库)]
5((圆))
6[方]
7>旗帜]
8{菱形}
9{{六边形}}
10[/平行四边形/]
11[\反平行四边形\]
12[/梯形\]
13[\反梯形/]
```

### 连线

```mermaid
flowchart TD
A --- B
A --> B
C --连线文字--> D
C -->|连线文字| D
E -.- F
E -.-> F
G -.连线文字.-> H
G -.->|连线文字| H
I === J
I ==> J
K ==连线文字==> L
K ==>|连线文字| L
```

> 可以将文本放在 "双引号" 内，防止文本中的特殊字符破坏语法。

### 连线方式

```mermaid
flowchart TD
1A --> 1B & 1C --> 1D
2A & 2B --> 2C & 2D
3A --> 3C
3A --> 3D
3B --> 3C
3B --> 3D
```

### 特殊箭头

```mermaid
flowchart LR
A --o B --x C
```

### 双向箭头

```mermaid
flowchart LR
A <--> B x--x C o--o D
```

### 连线的长度

流程图中的每个结点都根据其连接到的结点获得一个等级，你可以通过在连线定义中添加额外的短划线来使其比常规连线多跨越一些等级（使连线更长）。下面的示例中，从结点 `B` 到结点 `E` 的连线添加了两个额外的短划线，因此它比常规连线多跨越两个等级。

```mermaid
flowchart TD
    A[Start] --> B{Is it?};
    B -->|Yes| C[OK];
    C --> D[Rethink];
    D --> B;
    B ---->|No| E[End];
```

> 对于虚线和粗线，要添加的字符分别是点和等号。

### 转义字符

```mermaid
flowchart TD
A(双引号&quot) %% 使用 HTML 字符名称
B(桃心&#9829) %% 十进制代码
```

### 子图

```
subgraph title
    graph definition
end
```

```mermaid
flowchart TB
    c1-->a2
    subgraph one
    a1-->a2
    end
    subgraph two
    b1-->b2
    end
    subgraph three [3] %% 为子图设置显式 ID
    c1-->c2
    end
```

#### 子图间的连线

```mermaid
flowchart TB
    c1-->a2
    subgraph one
    a1-->a2
    end
    subgraph two
    b1-->b2
    end
    subgraph three
    c1-->c2
    end
    one --> two
    three --> two
    two --> c2
```

#### 设置子图的方向

```mermaid
flowchart LR
  subgraph TOP
    direction TB %% 使用 direction 语句设置子图的方向
    subgraph B1
        direction RL
        i1 -->f1
    end
    subgraph B2
        direction BT
        i2 -->f2
    end
  end
  A --> TOP --> B
  B1 --> B2
```

### 互动

[Interaction](https://mermaid-js.github.io/mermaid/#/flowchart?id=interaction)

### 注释

```mermaid
flowchart TD
%% comment
A %% comment
```

### 样式化与类

#### 样式化链接

[Styling links](https://mermaid-js.github.io/mermaid/#/flowchart?id=styling-links)

#### 样式化结点

```mermaid
flowchart LR
    id1(Start) --> id2(Stop)
    style id1 fill:#f9f,stroke:#333,stroke-width:4px %% 设置填充颜色，边框颜色，边框宽度
    style id2 fill:#bbf,stroke:#f66,stroke-width:2px,color:#fff,stroke-dasharray: 5 5 %% 设置文本颜色，边框片段长度
```

#### 类

你可以为样式定义一个类，并将类应用到多个结点上来样式化多个结点。

定义类：

```
 classDef className fill:#f9f,stroke:#333,stroke-width:4px;
```

将类应用到多个结点：

```
class nodeId1,nodeId2 className;
```

另一种将类添加到结点的简化形式是使用 `:::` 运算符：

```mermaid
flowchart LR
    A:::someclass --> B
    classDef someclass fill:#f96;
```

#### 使用 CSS 类

[Css classes](https://mermaid-js.github.io/mermaid/#/flowchart?id=css-classes)

#### default 类

如果将类命名为 `default`，则它会被应用到所有没有指定类的结点。

```mermaid
flowchart LR
A --> B
classDef default fill:#f9f,stroke:#333,stroke-width:4px;
```

### 对 fontawesome 的支持

[Basic support for fontawesome](https://mermaid-js.github.io/mermaid/#/flowchart?id=basic-support-for-fontawesome)

### 配置

[Configuration](https://mermaid-js.github.io/mermaid/#/flowchart?id=configuration)

> 参考：
>
> [帮助文档](https://mermaid-js.github.io/mermaid/#/flowchart)
>
> [知乎：Mermaid 从入门到入土](https://zhuanlan.zhihu.com/p/355997933)

[Mermaid 在线渲染器](https://mermaid-js.github.io/mermaid-live-editor/edit/)