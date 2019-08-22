<template>
  <div :style="{height:wrapperHeight + 'px'}" ref="wrapper">
    <mt-loadmore
      :auto-fill="autoFill"
      :bottom-method="loadBottom"
      @bottom-status-change="handleBottomChange"
      :bottom-all-loaded="allLoaded"
      ref="loadmore"
    >
      <ul>
        <li v-for="(goods,index) in goodsList" :key="index">
          <router-link :to="{name:'shopsDetail',query:{id:goods.id}}">
            <img :src="goods.img_url" alt />
            <div class="title">{{goods.title | Wordcontrol(18)}}</div>
            <div class="desc">
              <div class="sell">
                <span>￥{{goods.sell_price}}</span>
                <s>￥{{goods.market_price}}</s>
              </div>
              <div class="detail">
                <div class="hot">热卖中...</div>
                <div class="count">还剩{{goods.stock}}</div>
              </div>
            </div>
          </router-link>
        </li>
      </ul>
    </mt-loadmore>
    <button class="back" v-if="isTop" @click="backTop">回到顶部</button>
    <p v-if="isMore" class="more">没有更多了</p>
  </div>
</template>

<script>
export default {
  name: "shopsShow",
  data() {
    return {
      isTop: false,
      isMore: false,
      goodsList: [], //商品数据
      allLoaded: false, //为true是禁止拉动
      autoFill: false, //自动调用
      page: 1,
      wrapperHeight: 0, //父容器高度
      scrollTop: 0
    };
  },
  methods: {
    loadBottom() {
      // console.log('上拉调用');
      this.loadGoodsByPage();
      // 通知状态改变
      this.$refs.loadmore.onBottomLoaded();
    },
    handleBottomChange(status) {
      // console.log(status);
    },
    loadGoodsByPage() {
      // 拼接url 发起请求
      // 使用es6的模板字符串 优点： 1. 任意换行 2.添加变量
      this.$axios
        .get(`shop/getcommodity?pageindex=${this.page}`)
        .then(res => {
          // console.log(res.data);
          if (res.data.length === 0) {
            this.$toast("暂时没有更多了哦");
            allLoaded: true; //禁止拉动
            this.isMore = true;
            return;
          }
          if (this.page === 1) {
            this.goodsList = res.data;
          } else {
            // 追加    concat 字符串拼接
            this.goodsList = this.goodsList.concat(res.data);
          }
          this.page++; //页码自增
        })
        .catch(console.log);
    },
    // 滚动监听事件    监听当前页面的scrollTop
    scrollToTop() {
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
        // 将监听到的scrollTop赋值给data
      this.scrollTop = scrollTop;
      if (scrollTop > 60) {
        this.isTop = true;
      } else {
        this.isTop = false;
      }
    },
    // 点击按钮返回顶部
    backTop() {
      // const that = this;
      let timer = setInterval(() => {
        let ispeed = Math.floor(-this.scrollTop / 5);
        // console.log(ispeed)
        document.documentElement.scrollTop = document.body.scrollTop =
          this.scrollTop + ispeed;
        if (this.scrollTop === 0) {
          clearInterval(timer);
        }
      }, 15);
    }
  },
  created() {
    this.loadGoodsByPage();
  },
  mounted() {
    // 给当前window添加滚动监听事件
    window.addEventListener("scroll", this.scrollToTop);
    // 父容器高度（可视化区域）= 设备高度 - 父容器的top(当前页面是头部‘信息管理系统’)
    this.wrapperHeight =
      document.documentElement.clientHeight -
      this.$refs.wrapper.getBoundingClientRect().top;
  },
  destroyed() {
    // 离开当前页面时移除监听事件
    window.removeEventListener("scroll", this.scrollToTop);
  }
};
</script>

<style scoped>
ul {
  width: 97%;
  margin: 15px auto;
  background-color: #f9f9f9;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between;
}
li {
  width: 47%;
  margin: 5px;
  /* 四周阴影效果 */
  /* box-shadow: silver 0px 0px 5px; */
  background-color: #fff;
}
li img {
  width: 100%;
  height: 180px;
}
.title {
  width: 100%;
  height: 50px;
  font-size: 17px;
  color: #000;
  margin: 5px 0 5px 0;
}
/* 信息样式 */
.desc {
  width: 100%;
}
/* 价格 */
.sell span {
  color: red;
  font-size: 18px;
}
.sell s {
  color: silver;
}
/* 存量 */
.detail {
  width: 100%;
  margin-top: 5px;
  color: cornflowerblue;
}
.hot {
  display: inline-block;
  color: red;
}
.count {
  display: inline-block;
  float: right;
}
/* 页面底部提示 */
.more {
  color: silver;
  width: 100%;
  text-align: center;
}
/* 回到顶部按钮 */
.back {
  position: fixed;
  bottom: 70px;
  right: 20px;
  width: 49px;
  height: 49px;
  border-radius: 50%;
  background-color: #fff;
  border: 1px solid silver;
color: rgb(187, 187, 187);
  font-size: 16px;
}
</style>
