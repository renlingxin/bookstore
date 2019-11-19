<template>
  <!--我的  -->
  <div class="box">
    <!-- 名片 -->
    <div class="business">
      <div class="myInfo tantan">
        <!-- 头像-默认 -->
        <div class="headImg tantan">
          <img src="../../../static/img/男女.jpg" alt />
        </div>
        <!-- 登录-注册 -->
        <div class="login" @click="goLogin">
          <span>{{heatitle}}</span>
          <span v-if="noshow">{{addtime | converTime('YYYY-MM-DD')}}{{alret}}</span>
        </div>
      </div>
      <!-- 礼券显示 -->
      <ul class="memPage tantan">
        <li>
          <router-link :to="{name:'myCoupon'}">
            <p>{{notNum.myCoupon}}</p>
            <span>礼券</span>
          </router-link>
        </li>
        <li>
          <router-link :to="{name:'payment'}">
            <p>{{notNum.noPayment}}</p>
            <span>待付款</span>
          </router-link>
        </li>
        <li>
          <router-link :to="{name:'evaluated'}">
            <p>{{notNum.noEvaluated}}</p>
            <span>待收货</span>
          </router-link>
        </li>
        <li>
          <router-link :to="{name:'received'}">
            <p>{{notNum.noReceived}}</p>
            <span>待评价</span>
          </router-link>
        </li>
        <li>
          <router-link :to="{name:'myBalance'}">
            <p>{{notNum.myBalance}}</p>
            <span>余额</span>
          </router-link>
        </li>
      </ul>
    </div>
    <!-- 导航栏 -->

    <ul class="nav public tantan">
      <li>
        <router-link :to="{name:'collection'}">
          <img src="../../../static/img/我的/收藏.png" alt />
          <p>收藏</p>
        </router-link>
      </li>
      <li>
        <router-link :to="{}">
          <img src="../../../static/img/我的/物流.png" alt />
          <p>物流</p>
        </router-link>
      </li>
      <li>
        <router-link :to="{name:'follow'}">
          <img src="../../../static/img/我的/关注店铺.png" alt />
          <p>关注</p>
        </router-link>
      </li>
    </ul>

    <!-- 热门促销1 -->
    <div class="promotion public tantan">
      <p>热门促销</p>
      <!-- 活动详情 -->
      <div class="detail tantan">
        <img src="../../../static/img/我的/抢.png" alt />
        <span>三体今日爆降99元，限时今天，快来抢购</span>
        <img src="../../../static/img/分类/back.png" alt />
      </div>
      <div class="detail tantan">
        <img src="../../../static/img/我的/抢.png" alt />
        <span>阅读丈量世界，每满100减50，戳</span>
        <img src="../../../static/img/分类/back.png" alt />
      </div>
      <div class="detail tantan">
        <img src="../../../static/img/我的/抢.png" alt />
        <span>学生文具，五折封顶</span>
        <img src="../../../static/img/分类/back.png" alt />
      </div>
    </div>
    <!-- 热门促销2 -->
    <div class="promotion public tantan">
      <p>今日优惠</p>
      <!-- 活动详情 -->
      <div class="detail tantan">
        <img src="../../../static/img/我的/抢.png" alt />
        <span>百丽集团童鞋大牌日，限时99元两双</span>
        <img src="../../../static/img/分类/back.png" alt />
      </div>
      <div class="detail tantan">
        <img src="../../../static/img/我的/抢.png" alt />
        <span>全球最美的地方 图说天下 国家地理</span>
        <img src="../../../static/img/分类/back.png" alt />
      </div>
      <div class="detail tantan">
        <img src="../../../static/img/我的/抢.png" alt />
        <span>成语大词典 彩色本 今天折扣200元</span>
        <img src="../../../static/img/分类/back.png" alt />
      </div>
    </div>
    <!-- 退出登录 -->
    <div class="remolve">
      <button @click="remolve">退出登录</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      heatitle: "登录/注册>",
      addtime: "",
      alret: "",
      noshow: false,
      notNum: {
        noPayment: 0,
        noEvaluated: 0,
        noReceived: 0,
        myCoupon: 0,
        myBalance: 0
      }
    };
  },
  created() {
    this.getPersonInfo();
    this.getMemPage();
  },
  methods: {
    // 个人数据
    getPersonInfo() {
      //  获取本地存储的个人用户信息
      if (localStorage.getItem("user")) {
        let userinfo = JSON.parse(localStorage.getItem("user"));
        // console.log(userinfo);
        // 改变我的页面部分样式
        this.noshow = true;
        this.heatitle = userinfo.name;
        this.addtime = userinfo.addtime;
        this.alret = "这一天你来到了书园";
      }
    },
    // 获取待付款/待收货/待评价数量
    getMemPage() {
      // 获取未付款商品数据
      this.$axios
        .get(`shop/getpay`)
        .then(res => {
          this.notNum.noPayment = res.data.length;
        })
        .catch(console.log);
      // 获取未收货商品数据
      this.$axios
        .get(`shop/getstar`)
        .then(res => {
          this.notNum.noReceived = res.data.length;
        })
        .catch(console.log);
      // 获取未收货商品数据
      this.$axios
        .get(`shop/gethade`)
        .then(res => {
          this.notNum.noEvaluated = res.data.length;
        })
        .catch(console.log);
    },
    // 退出登录
    remolve() {
      localStorage.removeItem("user");
      if (!localStorage.getItem("user")) {
        this.$toast("退出成功");
        this.$router.push({
          name: "Home"
        });
      }
    },
    // 跳转登录界面
    goLogin() {
      this.$router.push({
        name: "login"
      });
    }
  }
};
</script>

<style scoped>

.box{
  height: 100%;
  background-color: #f7f7f7;
}
/* 公共css */
.public {
  width: 97%;
  border-radius: 10px;
  margin: 10px auto;
  background-color: #fff;
}
/* 名片 */
.business {
  width: 97%;
  height: 160px;
  border-radius: 10px;
  margin: 3px auto;
  background-color: #709bfe;
  overflow: hidden;
}
/* 名片-个人信息 */
.myInfo {
  overflow: hidden;
  align-items: center;
  margin: 10px 0 0 10px;
}
.headImg {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  border: 1px solid #e0e0e0e0;
  align-items: center;
  justify-content: center;
}
.headImg img {
  border-radius: 50%;
  width: 55px;
  height: 55px;
}
.login {
  color: #fff;
  font-size: 20px;
  margin-left: 14px;
}
.login span:nth-of-type(2) {
  display: block;
  font-size: 12px;
}
/* 名片-礼券 */
.memPage {
  justify-content: center;
  align-items: center;
  margin-top: 25px;
}
.memPage li {
  width: 20%;
  text-align: center;
  font-size: 15px;
}
.memPage li a {
  color: #fff;
}
.memPage li a p {
  margin-bottom: 5px;
}
/* 导航 */
.nav {
  justify-content: center;
  align-items: center;
  height: 75px;
  font-size: 15px;
}
.nav li {
  width: 33.3%;
  text-align: center;
}
.nav a {
  width: 100%;
}
.nav p {
  margin-top: 3px;
}
.nav img {
  width: 35px;
  height: 35px;
}
/* 促销 */
.promotion {
  height: 175px;
  justify-content: center;
  overflow: hidden;
}
.promotion p {
  font-size: 16px;
}
/* 促销-活动详情 */
.detail {
  width: 90%;
  height: 30px;
  align-items: center;
  justify-content: space-around;
  font-size: 13px;
  border-bottom: 1px solid #e0e0e0;
}
.detail span {
  display: inline-block;
  width: 85%;
}
.detail img {
  width: 20px;
  height: 20px;
}
/* 退出登录 */
.remolve {
  width: 70%;
  margin: 50px auto;
}
.remolve button {
  width: 100%;
  border: none;
  height: 40px;
  border-radius: 8px;
  background-color: red;
  color: #fff;
  opacity: 0.5;
  text-align: center;
  line-height: 40px;
}
</style>
