// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

// 引入自定义全局样式
import '../static/css/global.css';

// 引入 vue-preview （图片预览插件）开始
import VuePreview from 'vue-preview'
Vue.use(VuePreview)
// 引入 vue-preview结束

// 引入mint-ui 开始
import MintUI from 'mint-ui'
// 引入mint-ui css
import 'mint-ui/lib/style.css'
// 里面其实就是注册所有的全局组件，和给Vue
// prototype挂载一些对象，方便使用     组件内this.xxx就能用了
Vue.use(MintUI)
// 引入mint-ui结束


// 引入axios 开始
import Axios from 'axios';
// 给vue原型挂载$axios对象
Vue.prototype.$axios = Axios;
// 默认的公共的头
Axios.defaults.baseURL = 'http://localhost:8888/';
// 定义拦截器
// 1. 请求发起前显示Loading open();
Axios.interceptors.request.use(function (config) {
  // 不变配置  可变，可以设置公共的请求头操作
  MintUI.Indicator.open({
    text: '玩命加载中...',
    spinnerType: 'fading-circle'
  });
  // console.log(config);
  return config; // config:{headers}
})
// 2. 响应回来后关闭Loading close()
Axios.interceptors.response.use(function (response) {
  // reponse : { config:{},data:{},headers}
  //  接收响应头或者响应体中的数据，保存起来，供请求的拦截器中使用头信息操作
  MintUI.Indicator.close();
  // console.log(response);
  return response;
})
// 引入axios结束


// 引入自己的插件安装器 开始
import Installer from '@/plugins/Installer';
Vue.use(Installer);
// 引入自己的插件安装器 结束


// 注册全局组件 开始
import MyUI from './components/common/MyUI';
Vue.component(MyUI.name, MyUI);
import MyLI from './components/common/MyLI';
Vue.component(MyLI.name, MyLI);
import NavBar from './components/common/NavBar';
Vue.component(NavBar.name, NavBar);
import Comment from './components/common/comment';
Vue.component(Comment.name, Comment);
import Swipe from './components/common/swipe';
Vue.component(Swipe.name, Swipe);
import publicShow from './components/common/publicShow';
Vue.component(publicShow.name, publicShow);

// 注册全局组件 结束

// 定义全局过滤器  开始
import Moment from 'moment';
Moment.locale('zh-cn');
// 定义时间格式转换过滤器
Vue.filter('converTime', function (data, formatStr) {
  // moment语法
  return Moment(data).format(formatStr);
});
// 定义相对时间过滤器
Vue.filter('relTime', function (data) {
  // moment语法
  return Moment(data).fromNow();
});
// 控制字数显示的过滤器
Vue.filter('Wordcontrol',function(str,num){
  // 如果当前字符串小于num,返回原值
  if(str.length <= num){
    return str;
  }
  // 如果当前字符串大于num 截取0-num位
  if(str.length > num){
    return str.substr(0,num) + '...'
  }
})
// 定义全局过滤器  结束


// 全局路由配置

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requireLogin)){  // 判断该路由是否需要登录权限
    if (localStorage.getItem('user')) {  // 判断当前用户的登录信息loginInfo是否存在
      next();
    } else {
      next({
        name:'login'
      })
    }
  }else {
    next();
  }

})

// 全局路由配置结束

// 阻止启动生产消息，常用作指令
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: {
    App
  },
  template: '<App/>'
})
