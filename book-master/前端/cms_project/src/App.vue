<template>
  <div>
    <!--out-in 代表的是元素先离开再进入  默认的是同进同出 -->
   <transition name="fade" mode="out-in">
    <router-view/>
   </transition>
    <!-- 底部 -->

    <mt-tabbar v-model="selected" v-if="$route.meta.keepAlive">
      <mt-tab-item id="Home">
        <img slot="icon" src="../static/img/底部导航/首页.png" />
        首页
      </mt-tab-item>
      <mt-tab-item id="Member">
        <img slot="icon" src="../static/img/底部导航/分类.png" />
        分类
      </mt-tab-item>
      <mt-tab-item id="Shopcart">
        <img slot="icon" src="../static/img/底部导航/购物车.png" />
        购物车
        <!-- mint ui 中的样式 购物数量 -->
        <mt-badge type="error" size="small">{{totalNum}}</mt-badge>
      </mt-tab-item>
      <mt-tab-item id="Search">
        <img slot="icon" src="../static/img/底部导航/我的.png" />
        我的
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>
<script>
import Middle from "./Middle";
export default {
  name: "App",
  created() {
    // 通过中间件 接收传递的参数（购物数量）
    Middle.$on("addBuyCart", num => {
      this.totalNum += num;
    });
  },
  data() {
    return {
      headShow:true,
      selected: "",
      totalNum: 0 //默认的数量
    };
  },
  watch: {
    //底部导航监听跳转 不能使用箭头函数，因为this会向上级绑定
    selected: function(newV, oldV) {
      // console.log(newV);
      this.$router.push({
        name: newV
      });
    },
    // 判断是否显示顶部标题组件
    // $route(to,from){
    //   // console.log(to);
    //   // console.log(from)
    //   if(to.name === "Shopcart" || "Search" || "Member"){
    //     this.headShow = false
    //   }else{
    //     this.headShow = true
    //   }
    // }
  }
};
</script>
<style>

/* 淡入淡出的动画效果 */
.fade-enter-active, .fade-leave-active {
  transition: opacity .3s;
}
.fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  opacity: 0;
}
.mint-tabbar {
  position: fixed;
  bottom: 0;
}
</style>
