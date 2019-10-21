<template>
  <div>
    <!-- 搜索头部 -->
    <div class="top tantan">
      <img src="../../../static/img/分类/back.png" alt @click="goBack" />
      <input type="text" placeholder="余华" v-model="value" />
      <span @click="showvalue">搜索</span>
    </div>
    <!-- 提示框 -->
    <p class="tishi">
      您要搜索的是
      <span>{{value}}</span>
    </p>
    <!--显示结果 -->
    <ul v-if="isnull  === 1" class="tantan">
      <li v-for="(goods,index) in detail" :key="index">
        <router-link :to="{name:'shopsDetail',query:{id:goods.id}}">
          <img :src="goods.img_url" alt />
          <div class="titles">{{goods.title | Wordcontrol(20)}}</div>
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

    <!-- 列表为空时 -->
    <div class="cartnull" v-if="isnull  === 2">
      <img src="../../../static/img/购物车/暂无.png" alt />
      <h3>您想要的暂时还没有呢</h3>
      <p>换个别的搜一搜，说不定会更好呢~</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      value: "",
      detail: [],
      isnull: ""
    };
  },
  methods: {
    //   返回上一页
    goBack() {
      this.$router.go(-1);
    },
    //   根据搜索结果请求数据
    showvalue() {
      let res = this.value.split("");
      // console.log(res);
      this.$axios
        .post("member/find", {
          name: res
        })
        .then(res => {
          // console.log(res);
          if (res.data.length === 0) {
            this.isnull = 2;
          } else {
            this.isnull =1
            this.detail = res.data;
          }
        })
        .catch(console.log);
    }
  },
  created() {}
};
</script>

<style scoped>
/* 头部搜索 */
.top {
  width: 100%;
  height: 45px;
  background-color: #e0e0e0e0;
  justify-content: space-around;
  align-items: center;
}
.top img {
  width: 20px;
  height: 20px;
}
.top input {
  width: 80%;
  height: 30px;
  border: none;
  padding-left: 5px;
}
/* 提示 */
.tishi {
  width: 100%;
  height: 50px;
  line-height: 50px;
  margin-left: 8px;
}
.tishi span {
  color: red;
  font-size: 18px;
}
/* 显示内容 */
ul {
  width: 97%;
  margin: 15px auto;
  justify-content: space-between;
}
li {
  width: 47%;
  margin: 5px;
  border: 1px solid silver;
  background-color: #fff;
}
li img {
  width: 100%;
  height: 180px;
}
.titles {
  width: 100%;
  height: 44px;
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
}
.count {
  display: inline-block;
  float: right;
}
/* 购物车为空时的样式 */
.cartnull {
  margin-top: 35px;
  text-align: center;
}
.cartnull img {
  width: 110px;
  height: 110px;
  margin-bottom: 30px;
}
.cartnull p {
  color: silver;
  margin-top: 10px;
}
</style>
