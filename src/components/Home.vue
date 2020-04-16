<template>
  <div class="publicShoe">
    <div class="name">
      <!-- 顶部标题 -->
      <div class="tantan topp">
        <div class="list">
          <img
            src="../../static/img/列表1.png"
            alt
          />
        </div>
        <div class="sea" @click="goFind">
          <img src="../../static/img/搜索.png" alt />
          <input type="text" placeholder="三体" />
        </div>
        <div class="dong">
          <img
            src="//m.360buyimg.com/babel/jfs/t1/72848/32/5797/12615/5d3fc252Eebfe8617/a6581c914f563f93.gif"
            alt
          />
        </div>
      </div>
    </div>

    <!-- <mt-header title="书园"></mt-header> -->
    <!-- 轮播图组件  url 为传递的 数据请求路径-->
    <my-swipe url="swipe" />

    <!-- 九宫格（列表） -->
    <div class="grid">
      <my-ui>
        <my-li v-for="(module,index) in modules" :key="index">
          <router-link :to="module.route">
            <span :class="module.className"></span>
            <div>{{module.title}}</div>
          </router-link>
        </my-li>
      </my-ui>
    </div>
    <!-- 灰色边框 -->
    <div class="toto"></div>
    <!-- 活动图片 -->
    <div class="active">
      <img src="../../static/img/首页/领劵1.png" alt />
      <img src="../../static/img/首页/领劵2.png" alt />
    </div>
    <div class="toto"></div>
    <!-- 商品详情导航栏 -->
    <div class="nav">*为你推荐*</div>
    <div class="toto"></div>
    <!--推荐商品 -->
    <shopsShow></shopsShow>
  </div>
</template>

<script>
export default {
  name: "Home",
  data() {
    return {
      value: "",
      modules: [
        {
          title: "书文快看",
          className: "back-news",
          route: { name: "NewsList" }
        },
        {
          title: "图文分享",
          className: "back-pic",
          route: { name: "PhotoList", query: { categoryId: 0 } }
        },
        {
          title: "今日上新",
          className: "back-goods",
          route: { name: "shopsShow" }
        },
        {
          title: "留言反馈",
          className: "back-feed",
          route: { name: "feedBack" }
        },
        {
          title: "领券中心",
          className: "back-search",
          route: { name: "coupon" }
        },
        { title: "联系我们", className: "back-callme", route: { name: "call" } }
      ]
    };
  },
  created() {},
  methods: {
    // 进入搜索页面
    goFind() {
      this.$router.push({
        name: "find"
      });
    }
  }
};
</script>
<style scoped>

.name{
   width: 100%;
  height: 50px;
  overflow: hidden;
}
/* 头部搜索框 */
.topp {
  width: 100%;
  height: 50px;
  align-items: center;
  justify-content: space-around;
  position: fixed;
  top: 0;
  background-color: #9c93de;
}
.topp img {
  width: 100%;
  height: 100%;
}
.list {
  width: 7%;
  height: 30px;
}

.sea {
  width: 70%;
  height: 30px;
  border-radius: 30px;
  background-color: #fff;
  padding-left: 15px;
}
.sea img {
  width: 12px;
  height: 12px;
}
.sea input {
  width: 90%;
  height: 30px;
  border: none;
  /* background-color: #f7f7f7f0; */
}
.dong {
  width: 8%;
  height: 30px;
}

/* 其他样式 */
.grid span {
  display: inline-block;
  margin: 10px 0;
  width: 50px;
  height: 50px;
  background-repeat: round;
}
.back-news {
  background-image: url(../../static/img/首页/新闻资讯.png);
}
.back-pic {
  background-image: url(../../static/img/首页/分享.png);
}
.back-goods {
  background-image: url(../../static/img/首页/新.png);
}
.back-feed {
  background-image: url(../../static/img/首页/留言.png);
}
.back-search {
  background-image: url(../../static/img/首页/优惠劵.png);
}
.back-callme {
  background-image: url(../../static/img/首页/联系我们.png);
}
.grid {
  margin-bottom: 20px;
}
.toto {
  width: 100%;
  height: 10px;
  background-color: #f7f7f7;
}
/* 领券 */
.active {
  width: 100%;
  height: 135px;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-around;
  align-items: center;
}
.active img {
  width: 48%;
  height: 125px;
}
/* 商品显示导航栏 */
.nav {
  width: 100%;
  height: 40px;
  border: 1px solid #e0e0e0e0;
  text-align: center;
  line-height: 40px;
  color: #396bde;
}
</style>

