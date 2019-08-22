<template>
  <div style="width: 100%" class="public">

    <div class="atap">
      <!-- 导航 -->
      <ul class="navbato tantan">
        <li>修改管理员</li>
      </ul>
      <!-- 登录 -->
      <div class="login">
        <!-- 输入 -->
        <div class="usermake tantan">
          <span>昵称：</span><input type="text" v-model="nickname" @change="nickver" />
          <span>手机号：</span><input type="text" v-model="phone" @change="userver(phone)" />
          <span>密码：</span><input type="text" v-model="password" @change="passver(password)" />
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
      id: ""
    };
  },
  methods: {
    goSeach() {
        // 请求修改数据
    //   console.log(this.id);
      this.$axios.post(`admin/make`, {
        id: this.id,
        name: this.nickname,
        phone: this.phone,
        pass: this.password
      })
      .then(res=>{
          this.$message("数据修改成功");
          this.$router.push({
              name:'adminlist'
          })
        //   console.log(res)
      })
      .catch(console.log)
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
  created() {
    //   将需要修改的数据赋值
    this.nickname = this.$route.params.makedata.name;
    this.phone = this.$route.params.makedata.phone;
    this.password = this.$route.params.makedata.pass;
    this.id = this.$route.params.makedata.id;
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
.usermake{
  width: 100%;
  height: 50px;
  align-items: center;
}
.login {
  width: 90%;
  margin: 0 auto;
  margin-top: 30px;
}
.login span {
  width: 20%;
  color: silver;
  display: inline-block;
  
}
.login input {
  width: 80%;
  height: 50px;
  /* margin-top: 8px; */
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
