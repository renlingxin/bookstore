// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

// 引入全局自定义样式
import '../static/css/public.css';

import VueI18n from 'vue-i18n'
Vue.use(VueI18n)
const i18n = new VueI18n({
  locale: 'en', // 语言标识
  messages: {
    'zh': require('./assets/lang/zh'),
    'en': require('./assets/lang/en')
  }

})





// 引入element-ui   开始
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI);

// 引入element-ui  结束

// 全局路由配置

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.Login)){  // 判断该路由是否需要登录权限
    if (localStorage.getItem('admin')) {  // 判断当前用户的登录信息loginInfo是否存在
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


// 引入axios 开始
import Axios from 'axios';
// 给vue原型挂载$axios对象
Vue.prototype.$axios = Axios;
// 默认的公共的头
Axios.defaults.baseURL = 'http://localhost:9999/';
// 引入axios结束

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




Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  i18n,
  components: { App },
  template: '<App/>'
})
