<template>
  <!--我的  -->
  <div class="box">
    <!-- 名片 -->
    <div class="business">
      <div class="myInfo tantan">
        <!-- 头像-默认 -->
        <div class="headImg tantan">
          <img src="../../../static/img/我的/收藏.png" alt />
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
            <p>0</p>
            <span>礼券</span>
          </router-link>
        </li>
        <li>
          <router-link :to="{name:'payment'}">
            <p>0</p>
            <span>待付款</span>
          </router-link>
        </li>
        <li>
          <router-link :to="{name:'evaluated'}">
            <p>0</p>
            <span>待收货</span>
          </router-link>
        </li>
        <li>
          <router-link :to="{name:'received'}">
            <p>0</p>
            <span>待评价</span>
          </router-link>
        </li>
        <li>
          <router-link :to="{name:'myCoupon'}">
            <p>0</p>
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

    <!-- 热门促销 -->
    <div class="promotion public">
      <p>热门促销</p>
      <!-- 活动详情 -->
      <div class="detail tantan">
        <img src="../../../static/img/我的/抢.png" alt />
        <span>三体今日爆降99元，限时今天，快来抢购 ></span>
      </div>
      <div class="detail">
        <img src="../../../static/img/我的/抢.png" alt />
        <span>三体今日爆降99元，限时今天，快来抢购 ></span>
      </div>
      <div class="detail">
        <img src="../../../static/img/我的/抢.png" alt />
        <span>三体今日爆降99元，限时今天，快来抢购 ></span>
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
      noshow: false
    };
  },
  methods: {
    // 退出登录
    remolve() {
      localStorage.removeItem("user");
      if (!localStorage.getItem("user")) {
        this.$toast("退出成功");
        this.$router.push({
          name:'Home'
        })
      }
    },
    // 跳转登录界面
    goLogin() {
      this.$router.push({
        name: "login"
      });
    }
  },
  created() {
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
  }
};
</script>

<style>
/* 外层大盒子 */
.box {
  width: 100%;
  height: 100%;
  background-color: #f7f7f7;
}
/* 公共css */
.public {
  width: 97%;
  border-radius: 10px;
  margin: 8px auto;
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
  width: 50px;
  height: 50px;
}
.login {
  color: #fff;
  font-size: 20px;
  margin-left: 14px;
}
.login span:nth-of-type(2) {
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
  text-align: center;
  overflow: hidden;
}
.promotion p {
  font-size: 18px;
  margin: 5px;
}
/* 促销-活动详情 */
.detail {
  width: 90%;
  height: 30px;
  margin: 0 auto;
  justify-content: center;
  font-size: 15px;
  margin-top: 15px;
  border-bottom: 1px solid #e0e0e0;
}
.detail img {
  width: 20px;
  height: 20px;
}
/* 退出登录 */
.remolve {
  width: 70%;
  margin: 185px auto;
}
.remolve button {
  width: 100%;
  border: none;
  height: 40px;
  border-radius: 10px;
  background-color: red;
  color: #fff;
  opacity: 0.5;
  text-align: center;
  line-height: 40px;
}
</style>
