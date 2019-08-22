<template>
  <div style="width: 100%" class="public">
    <div class="atap">
      <!-- 导航 -->
      <ul class="navbato tantan">
        <li>添加管理员</li>
      </ul>
      <!-- 登录 -->
      <div class="login">
        <!-- 输入 -->
        <div class="usermake">
          <input type="text" v-model="nickname" placeholder="填写昵称" @change="nickver" />
          <input type="text" v-model="phone" placeholder="填写手机号" @change="userver(phone)" />
          <input type="text" v-model="password" placeholder="填写密码" @change="passver(password)" />
        </div>
        <button @click="goSeach">完成</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      nickname: "",
      phone: "",
      password: "",
      id: "",
      or: 0,
      fa: 0
    };
  },
  methods: {
    goSeach() {
      // 请求添加数据
      if (
        this.loginuser === "" ||
        this.loginpass === "" ||
        this.or === 0 ||
        this.fa === 0
      ) {
      } else {
        this.$axios
          .post(`user/add`, {
            id: this.id,
            name: this.nickname,
            phone: this.phone,
            pass: this.password
          })
          .then(res => {
            this.$message("数据添加成功");
            this.$router.push({
              name: "userlist"
            });
            //   console.log(res)
          })
          .catch(console.log);
      }
    },
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
    }
  },
  created() {}
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

/* 头部导航 */
.navbato {
  width: 90%;
  margin: 0 auto;
  color: silver;
  justify-content: center;
}
.navbato li {
  text-align: center;
  height: 50px;
  line-height: 50px;
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
}
</style>
