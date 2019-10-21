import Vue from 'vue'
import Router from 'vue-router'
import Home from '@/components/Home'
import Member from '@/components/Member/Member'
import Shopcart from '@/components/Shopcart/Shopcart'
import Search from '@/components/Search/Search'
import NewsList from '@/components/News/NewsList'
import NewsDetail from '@/components/News/NewsDetail'
import PhotoList from '@/components/Photo/PhotoList'
import PhotoDetail from '@/components/Photo/PhotoDetail'
import shopsShow from '@/components/shops/shopShow'
import shopsDetail from '@/components/shops/shopsDetail'
import shopComment from '@/components/shops/shopComment'
import feedBack from '@/components/index/feedBack'
import feedList from '@/components/index/feedList'
import coupon from '@/components/index/coupon'
import myCoupon from '@/components/Search/myCoupon'
import order from '@/components/order/order'
import payment from '@/components/order/payment'
import evaluated from '@/components/order/evaluated'
import received from '@/components/order/received'
import collection from '@/components/Search/collection'
import follow from '@/components/Search/follow'
import find from '@/components/Member/find'
import settlement from '@/components/Shopcart/settlement'
import login from '@/components/Search/login'
Vue.use(Router)

export default new Router({
  routes: [{
      path: '/',
      name: 'Home',
      component: Home,
      meta: {
        keepAlive: true //导航栏在该页面显示(表示该组件需要被缓存)
      }
    },
    {
      path: '/member',
      name: 'Member',
      component: Member,
      meta: {
        keepAlive: true
      }
    },
    {
      path: '/shopcart',
      name: 'Shopcart',
      component: Shopcart,
      meta: {
        keepAlive: true,
        requireLogin:true
      }
    },
    {
      path: '/search',
      name: 'Search',
      component: Search,
      meta: {
        keepAlive: true
      }
    },
    {
      path: '/news/list',
      name: 'NewsList',
      component: NewsList
    },
    {
      path: '/news/detail/:id',
      name: 'NewsDetail',
      component: NewsDetail
    },
    {
      path: '/photo/list',
      name: 'PhotoList',
      component: PhotoList
    },
    {
      path: '/photo/detail/:id',
      name: 'PhotoDetail',
      component: PhotoDetail
    },
    {
      path: '/shops/list',
      name: 'shopsShow',
      component: shopsShow
    },
    {
      path: '/shops/detail',
      name: 'shopsDetail',
      component: shopsDetail,
      meta: {
        keepAlive: true
      }
    },
    {
      path: '/shops/comment',
      name: 'shopComment',
      component: shopComment
    },
    {
      path: '/back/type',
      name: 'feedBack',
      component: feedBack
    },
    {
      path: '/back/list',
      name: 'feedList',
      component: feedList
    },
    {
      path: '/coupon',
      name: 'coupon',
      component: coupon
    },
    {
      path: '/search/mycoupon',
      name: 'myCoupon',
      component: myCoupon
    },
    {
      path: '/order',
      name: 'order',
      component: order,
      children: [{
        // 待付款
        path: '/order/payment',
        name: 'payment',
        component: payment
      }, {
        // 待收货
        path: '/order/evaluated',
        name: 'evaluated',
        component: evaluated
      }, {
        // 待评价
        path: '/order/received',
        name: 'received',
        component: received
      }]
    },
    {
      path: '/search/follow',
      name: 'follow',
      component: follow
    },
    {
      path: '/search/collection',
      name: 'collection',
      component: collection
    },
    {
      path: '/member/find',
      name: 'find',
      component: find
    },
    {
      path: '/shopcart/settlement',
      name: 'settlement',
      component: settlement
    },
    {
      path: '/login',
      name: 'login',
      component: login
    }
  ]
})
