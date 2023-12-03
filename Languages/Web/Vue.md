# Vue.js

Vue 常用官网

[vue.js](https://cn.vuejs.org)

[v-charts](https://v-charts.js.org)  （图表，地图）

[webpack](https://www.webpackjs.com)

[vue-router](https://router.vuejs.org/zh)

[axios](http://www.axios-js.com)

[vue-cli](https://cli.vuejs.org/zh)

[Element-Plus](https://element-plus.org/zh-CN)

[白卷](https://learner.blog.csdn.net/article/details/88926242)

```sh
npm install -g vue-cli  # 安装 vue 2 脚手架

vue init webpack wj-vue  # 初始化项目，一路回车

npm run dev  # 启动项目
```

[Vue CLI](https://cli.vuejs.org/): Vue 官方提供的脚手架工具

```sh
npm install @vue/cli -g
vue create hello-vue  # 创建 Vue 项目
```

页面上使用 Vue，CDN 导入 js 可以用。

[从这里开始——创建一个 Vue 实例](https://cn.vuejs.org/guide/essentials/application.html#the-application-instance)

1. 创建 Vue 应用实例

```js
// main.js
import { createApp } from 'vue'  // 从 vue 包中解构出 createApp 函数

const app = Vue.createApp({  // 调用 createApp 函数获得一个 Vue 应用实例。传入 createApp 的对象是一个组件
  data: function() {
    return {
      message: 'HelloWorld'  // 我们用到的变量都放在这里
    }
  }
});
```

2. 挂载应用

```js
app.mount('#app');  // 把 app 应用实例挂载到容器元素上，这里提供的是一个 CSS 选择器字符串
```

## 模板语法

> `v-` 开头的是指令，指令的值是变量名或者表达式，指令的作用是将变量的值渲染到视图上

```html
<!-- 文本插值 -->
<span>{{ msg }}</span>  <!-- 显示变量 msg 的值 -->

<!-- 原始 HTML -->>
<span v-html="rawHTML"></span>  <!-- 将变量 rawHTML 的值作为 span 标签的 innerHTML 属性值 -->

<!-- 属性绑定 -->
<a v-bind:href="msg">This is a link</a>  <!-- 将 msg 的值作为 href 属性的值 -->
<a :href="msg">This is a link</a>  <!-- 属性绑定的简写形式 -->
<div v-bind="objectOfAttrs"></div>  <!-- 将对象的属性绑定到元素上 -->

<!-- 条件渲染 -->
<span v-if="sex === 'man'">This is a man</span>
<span v-else-if="sex === 'woman'">This is a woman</span>
<span v-else>This is not a human</span>

<!-- 列表渲染（循环） -->
<li v-for="i in items">{{ i.attr }}</li>
<li v-for="(item, index) in items"></li>  <!-- 可以在拿到变量的同时拿到索引 -->

<!-- 事件绑定 -->
<input type="button" v-on:click="function"></input>
<input type="checkbox" @click="function"></input>

<!-- 双向绑定 -->
<!-- 双向绑定意味着，变量的值变了会影响到视图，而视图变了也可以反过来影响变量 -->
<input type="text" v-model="variable"></input>

<!-- 动态参数 -->
<a v-bind:[attrName]="url"></a>  <!-- attrName 是一个变量，假如它的值为 href，那么作用就相当于 v-bind:href="url" -->
```

## Vue 组件化开发

写一个自定义组件：

MyComponent.vue

```html
<!-- 视图 -->
<template>
  <!-- 你要在组件中添加的内容 -->
</template>

<!-- 模型 -->
<script>
// 导入其他组件
import comp1 from './components/comp1.vue'

// 声明组件
export default {
  name: 'MyComponent',  // 组件名
  components: {  // 要使用到的其他组件
    comp1
  },
  props: {  // 需要父组件传进来的值。父组件在调用子组件时通过属性传递该值：<MyComponent msg="abc">
    msg: String
  },
  methods: {
    func() {
      // 你要在组件中使用的方法
    }
  }
}
</script>

<!-- 样式 -->
<style>

</style>
```

## 第三方组件 UI

Vue 2: Element UI

Vue 3: Element Plus

## Axios 网络请求

[Axios 中文网](http://axios-js.com/)

Axios 是一个 HTTP 库

首先下载 `axios`，也可以使用 CDN。

```sh
npm install axios
```

在主类中导入 `axios`

```js
import axios from 'axios'  // 哪一个组件用到了 axios 再导入 axios
```

使用 `axios` 发送请求

```js
let tableData = ref([]);  // 让 Vue 追踪 tableData 的变化并触发组件的重新渲染

axios.get("http://localhost:8081/api")  // 发送 GET 请求
  .then((response) => {  // 处理成功情况
    console.log(response);
    tableData.value = response.data;  // 将接收的内容赋值给变量
  })
  .catch(err => {  // 处理失败情况
    console.log(err);
  })
  .then(function() {
    // 总会执行
  })
```

> 如果要在处理函数中使用 `this` 指针的话，

### 跨域请求

由于同源策略，默认禁止跨域访问。需要在后端 Controller 类上添加 `@CrossOrigin` 注解以允许跨域。

```java
@RestController
@CrossOrigin  // 使该类中的方法都允许跨域访问
public class HelloController {
```

## 路由

[Vue Router](https://router.vuejs.org/zh/guide/)

路由可以根据 URL 地址，在不同组件之间切换。

安装 Vue Router

```sh
npm install vue-router@4
```

> Vue 3 对应 Vue Router 4，Vue 2 对应 Vue Router 3

在主类中导入并使用

```js
import router from 'vue-router'
// 创建 Vue 应用实例……
app.use(router);
```

在大型项目中一般会把路由规则放到单独的文件中

```js
// router/index.js
import { createRouter, createWebHashHistory } from "vue-router";  // 必须使用解构的方法导入两个函数
import Home from '@/components/Home'  // @ 表示 src 目录
import News from '@/components/News'

// 路由表
const routes = [
  {
    path: '/',
    redirect: '/home'
  },
  {
    path: '/home',  // 路径
    component: Home  // 对应的组件
  },
  {
    path: '/news',
    name: 'News',  // 可以指定路由名称
    component: News
  }
];

// 创建路由实例
const router = VueRouter.createRouter({
  history: VueRouter.createWebHashHistory(),
  routes,  // routes: routes 的简写
});

export default router;  // 导出路由实例
```

现在可以开始使用啦

```html
<!-- component/MyComponent.vue -->
<template>
  <div>
    <router-link to="/home">首页</router-link>&nbsp;  <!-- Vue Router 特有的链接 -->
    <router-link to="/news">新闻</router-link>&nbsp;
    <hr>
    <router-view></router-view>  <!-- Vue Router 的显示窗口 -->
  </div>
</template>
```

可以在 `<script>` 中使用 `this.$router.push('/home')` 来跳转路由。

## 响应式基础

```html
<script setup>
import { ref } from 'vue'

const count = ref(0);  // ref 函数可以把一个变量变成响应式变量并返回

function increment() {
  count.value++;  // 在 JavaScript 中需要 .value，在模板中不需要；count 的变化会影响到模板
}
```

## 样例

