<template>
  <div>
    <nav-bar title="登录"></nav-bar>
    <!-- 导航 -->
    <ul class="navbato tantan">
      <li @click="isShow = 1" :class="isShow === 1 ? 'active' : ''">账号密码登录</li>
      <li @click="isShow = 2" :class="isShow === 2 ? 'active' : ''">新用户注册</li>
    </ul>
    <!-- 登录 -->
    <div class="login" v-if="isShow === 1">
      <!-- 输入 -->
      <div class="usermake">
        <input type="text" v-model="loginuser" placeholder="请输入手机号" @change="userver(loginuser)"/>
        <input type="text" v-model="loginpass" placeholder="请输入密码" @change="passver(loginpass)"/>
      </div>
      <!-- 登录 -->
      <button @click="goSeach">登录</button>
    </div>
    <!-- 注册 -->
    <div class="login" v-if="isShow === 2">
      <!-- 输入 -->
      <div class="usermake">
        <input type="text" v-model="nickname" placeholder="请输入昵称" @change="nickver" />
        <input type="text" v-model="phone" placeholder="请输入手机号" @change="userver(phone)" />
        <input type="text" v-model="password" placeholder="请输入密码" @change="passver(password)" />
      </div>
      <!-- 登录 -->
      <button @click="goRegister">注册</button>
    </div>
  </div>
</template>

<script>
export default {
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
      or:0,
      fa:0
    };
  },
  methods: {
    // 用户名验证
    nickver() {
      if (this.nickname.length >= 6) {
        this.$toast("用户名不得超过六位");
      }
    },
    // 手机号判断
    userver(data) {
      // console.log(data);
      // 判断手机号格式  13,17,15,18开头   11位
      let regs = /^((13[0-9])|(17[0-1,6-8])|(15[^4,\\D])|(18[0-9]))\d{8}$/;
      if (!regs.test(data)) {
        this.$toast("您输入的手机号格式不正确");
        this.or = 0
      }else{
        this.or = 1
      }

    },
    // 密码判断
    passver(data) {
      //       正则表达解析：
      // 1.^ 匹配一行的开头位置;
      // 2.(?![0-9]+$) 声明该位置后面不全是数字;
      // 3.(?![a-zA-Z]+$) 声明该位置后面不全是字母;
      // 4.[0-9A-Za-z] {8,30} 声明由8-30位数字或这字母组成;
      // 5.$ 匹配行结尾位置;
      let reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,30}$/;
      if (!reg.test(data)) {
        this.$toast("请输入八位以上，包含数字字母的密码！");
        this.fa = 0
      }else{
        this.fa = 1
      }
    },
    //   登录验证
    goSeach() {
       if (this.loginuser === "" || this.loginpass === "" || this.or === 0 || this.fa === 0) {
        // this.$toast("请填写完整信息");
      } else {
        this.$axios
          .post(`login/`, {
            phone: this.loginuser,
            pass: this.loginpass
          })
          .then(res => {
            //  console.log(res);
            if(JSON.stringify(res.data) === '{}'){
              this.$toast("手机号或者密码不正确");
            }else{
              // 将用户数据存储带本地存储中
              let user = JSON.stringify(res.data)
              localStorage.setItem('user',user)
              // 跳转到我的界面
              this.$router.push({
                name:'Search',
                // params:{user:res.data}
              })
            }
           
          })
          .catch(console.log);
      }
    },
    // 提交注册
    goRegister() {
      if (this.nickname === "" || this.phone === "" || this.password === ""|| this.or === 0 || this.fa === 0) {
        // this.$toast("请填写完整信息");
      } else {
        this.$axios
          .post(`login/register`, {
            nickname: this.nickname,
            phone: this.phone,
            pass: this.password
          })
          .then(res => {
            // console.log(res);
            this.$toast("注册成功！");
            this.isShow = 1
          })
          .catch(console.log);
      }
    }
  },
  created() {}
};
</script>

<style scoped>
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
  width: 100%;
  height: 40px;
  background-color: red;
  opacity: 0.5;
  border: none;
  color: #fff;
  border-radius: 4px;
  margin-top: 20px;
}
/* 注册 */
</style>
