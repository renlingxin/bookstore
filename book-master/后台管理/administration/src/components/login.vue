<template>
  <div class="hello">
    <div class="atap">
      <!-- 导航 -->
      <ul class="navbato tantan">
        <li @click="isShow = 1" :class="isShow === 1 ? 'active' : ''">{{$t('m.acc')}}</li>
        <li @click="isShow = 2" :class="isShow === 2 ? 'active' : ''">{{$t('m.pass')}}</li>
      </ul>
      <!-- 登录 -->
      <div class="login" v-if="isShow === 1">
        <!-- 输入 -->
        <div class="usermake">
          <input
            type="text"
            v-model="loginuser"
            :placeholder="$t('m.pone')"
            @change="userver(loginuser)"
          />
          <input
            type="text"
            v-model="loginpass"
            :placeholder="$t('m.qpass')"
            @change="passver(loginpass)"
          />
        </div>
        <!-- 登录 -->
        <button @click="goSeach">{{$t('m.login')}}</button>
      </div>
      <!-- 忘记密码 -->
      <div class="login" v-if="isShow === 2">
        <!-- 输入 -->
        <div class="usermake">
          <input type="text" v-model="nickname" :placeholder="$t('m.name')" @change="nickver" />
          <input type="text" v-model="phone" :placeholder="$t('m.pone')" @change="userver(phone)" />
          <input type="text" v-model="password" :placeholder="$t('m.keyword')" @change="passver(password)" />
        </div>
        <!-- 登录 -->
        <button>{{$t('m.code')}}</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "login",
  data() {
    return {
      // 登录账号密码
      loginuser: "",
      loginpass: "",
      //   注册账号密码
      nickname: "",
      phone: "",
      password: "",
      //   控制显示
      isShow: 1,
      or: 0,
      fa: 0
    };
  },
  created() {},
  methods: {
    // 用户名验证
    nickver() {
      if (this.nickname.length >= 6) {
        this.$message("用户名不得超过六位");
      }
    },
    // 手机号判断
    userver(data) {
      // 判断手机号格式  13,17,15,18开头   11位
      let regs = /^((13[0-9])|(17[0-1,6-8])|(15[^4,\\D])|(18[0-9]))\d{8}$/;
      if (!regs.test(data)) {
        this.$message("您输入的手机号格式不正确");
        this.or = 0;
      } else {
        this.or = 1;
      }
    },
    // 密码判断
    passver(data) {
      let reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,30}$/;
      if (!reg.test(data)) {
        this.$message("请输入八位以上，包含数字字母的密码！");
        this.fa = 0;
      } else {
        this.fa = 1;
      }
    },
    //   登录验证
    goSeach() {
      if (
        this.loginuser === "" ||
        this.loginpass === "" ||
        this.or === 0 ||
        this.fa === 0
      ) {
      } else {
        this.$axios
          .post(`login/`, {
            phone: this.loginuser,
            pass: this.loginpass
          })
          .then(res => {
            // console.log(res);
            if (JSON.stringify(res.data) === "{}") {
              this.$message("手机号或者密码不正确");
            } else {
              // 将用户数据存储带本地存储中
              let user = JSON.stringify(res.data);
              localStorage.setItem("admin", user);
              // 跳转到首页
              this.$router.push({
                name: "index"
              });
            }
          })
          .catch(console.log);
      }
    }
  }
};
</script>

<style scoped>
.atap {
  width: 40%;
  height: 350px;
  margin: 25px auto;
  background-color: #fff;
  position: relative;
}
.hello {
  width: 100%;
  height: 100%;
  background-color: rgb(243, 243, 243);
}
/* 头部导航 */
.navbato {
  width: 90%;
  margin: 0 auto;
  color: silver;
  justify-content: space-between;
}
.navbato li {
  text-align: center;
  height: 50px;
  line-height: 50px;
  width: 50%;
  cursor:pointer
}
.active {
  border-bottom: 1px solid #000;
  color: #000;
}
/* 登录 */
.login {
  width: 90%;
  margin: 0 auto;
  margin-top: 30px;
}
.login input {
  width: 100%;
  height: 50px;
  margin-top: 8px;
  border: none;

  border-bottom: 1px solid rgb(201, 201, 201);
}
.login button {
  position: absolute;
  bottom: 15px;
  left: 80px;
  width: 300px;
  height: 40px;
  background-color: red;
  opacity: 0.5;
  border: none;
  color: #fff;
  border-radius: 4px;
  margin-top: 20px;
   cursor:pointer
}
/* 注册 */
</style>
