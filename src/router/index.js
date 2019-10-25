import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  routes: [{
      path: '/',
      name: 'Home',
      component: resolve => require(['@/components/Home.vue'], resolve),
      meta: {
        keepAlive: true //导航栏在该页面显示(表示该组件需要被缓存)
      }
    },
    {
      path: '/member',
      name: 'Member',
      component: resolve => require(['@/components/Member/Member.vue'], resolve),
      meta: {
        keepAlive: true
      }
    },
    {
      path: '/shopcart',
      name: 'Shopcart',
      component: resolve => require(['@/components/Shopcart/Shopcart'], resolve),
      meta: {
        keepAlive: true,
        requireLogin: true
      }
    },
    {
      path: '/search',
      name: 'Search',
      component: resolve => require(['@/components/Search/Search.vue'], resolve),
      meta: {
        keepAlive: true
      }
    },
    {
      path: '/news/list',
      name: 'NewsList',
      component: resolve => require(['@/components/News/NewsList'], resolve)
    },
    {
      path: '/news/detail/:id',
      name: 'NewsDetail',
      component: resolve => require(['@/components/News/NewsDetail'], resolve)
    },
    {
      path: '/photo/list',
      name: 'PhotoList',
      component: resolve => require(['@/components/Photo/PhotoList'], resolve)
    },
    {
      path: '/photo/detail/:id',
      name: 'PhotoDetail',
      component: resolve => require(['@/components/Photo/PhotoDetail'], resolve)
    },
    {
      path: '/shops/list',
      name: 'shopsShow',
      component: resolve => require(['@/components/shops/shopShow'], resolve)
    },
    {
      path: '/shops/detail',
      name: 'shopsDetail',
      component: resolve => require(['@/components/shops/shopsDetail'], resolve),
      meta: {
        keepAlive: true
      }
    },
    {
      path: '/shops/comment',
      name: 'shopComment',
      component: resolve => require(['@/components/shops/shopComment'], resolve)
    },
    {
      path: '/back/type',
      name: 'feedBack',
      component: resolve => require(['@/components/index/feedBack'], resolve)
    },
    {
      path: '/back/list',
      name: 'feedList',
      component: resolve => require(['@/components/index/feedList'], resolve)
    },
    {
      path: '/coupon',
      name: 'coupon',
      component: resolve => require(['@/components/index/coupon'], resolve)
    },
    {
      path: '/search/mycoupon',
      name: 'myCoupon',
      component: resolve => require(['@/components/Search/myCoupon'], resolve)
    },
    {
      path: '/order',
      name: 'order',
      component: resolve => require(['@/components/order/order'], resolve),
      children: [{
        // 待付款
        path: '/order/payment',
        name: 'payment',
        component: resolve => require(['@/components/order/payment'], resolve)
      }, {
        // 待收货
        path: '/order/evaluated',
        name: 'evaluated',
        component: resolve => require(['@/components/order/evaluated'], resolve)
      }, {
        // 待评价
        path: '/order/received',
        name: 'received',
        component: resolve => require(['@/components/order/received'], resolve)
      }]
    },
    {
      path: '/search/follow',
      name: 'follow',
      component: resolve => require(['@/components/Search/follow'], resolve)
    },
    {
      path: '/search/collection',
      name: 'collection',
      component: resolve => require(['@/components/Search/collection'], resolve)
    },
    {
      path: '/member/find',
      name: 'find',
      component: resolve => require(['@/components/Member/find'], resolve)
    },
    {
      path: '/shopcart/settlement',
      name: 'settlement',
      component: resolve => require(['@/components/Shopcart/settlement'], resolve)
    },
    {
      path: '/login',
      name: 'login',
      component: resolve => require(['@/components/Search/login'], resolve)
    },
    {
      path: '/404',
      name: '404',
      component: resolve => require(['@/components/404'], resolve),
    },
    {
      path: '*',
      redirect: '/404'
    }
  ]
})
