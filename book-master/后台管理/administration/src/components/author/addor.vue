<template>
  <div style="width: 100%" class="public">
    <div class="atap">
      <!-- 导航 -->
      <ul class="navbato tantan">
        <li>添加作者</li>
      </ul>
      <!-- 登录 -->
      <div class="login">
        <!-- 输入 -->
        <div class="usermake">
          <input type="text" v-model="name" placeholder="填写作者昵称" @change="nickver" />
          <input type="text" v-model="type" placeholder="填写作者类型" />
          <input type="text" v-model="headimg" placeholder="填写作者头像" />
          <input type="text" v-model="authorID" placeholder="填写作者ID" />
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
      name: "",
      type: "",
      headimg: "",
      authorID: "",
      ge: 0
    };
  },
  methods: {
    nickver() {
      if (this.name.length >= 6) {
        this.ge = 0;
        this.$message("昵称不得超过六位");
      } else {
        this.ge = 1;
      }
    },
    // 添加完成
    goSeach() {
      if (
        this.ge === 0 ||
        this.name === "" ||
        this.type === "" ||
        this.headimg === ""
      ) {
      } else {
        this.$axios
          .post(`author/add`, {
            name: this.name,
            type: this.type,
            headimg: this.headimg,
            authorID: this.authorID
          })
          .then(res => {
            // console.log(res);
            this.$router.push({
              name: "authorlist"
            });
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
  height: 470px;
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
