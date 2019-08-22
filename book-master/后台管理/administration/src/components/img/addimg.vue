<template>
  <div style="width: 100%" class="public">
    <div class="atap">
      <!-- 导航 -->
      <ul class="navbato tantan">
        <li>添加图文列表</li>
      </ul>
      <!-- 登录 -->
      <div class="login">
        <!-- 输入 -->
        <div class="usermake">
          <input type="text" v-model="title" placeholder="填写标题" @change="nickver" />
          <input type="text" v-model="img" placeholder="填写图片地址" />
          <input type="text" v-model="authorID" placeholder="填写作者ID" />
          <input type="text" v-model="categoryId" placeholder="填写分类ID" />
          <input type="text" v-model="zhaiyao" placeholder="填写摘要" />
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
      title: "",
      img: "",
      authorID: "",
      categoryId: "",
      zhaiyao: ""
    };
  },
  methods: {
    nickver() {
      if (this.title.length >= 6) {
        this.$message("标题不得超过六位");
      }
    },
    // 添加完成
    goSeach() {
      this.$axios
        .post(`img/add`, {
          title: this.title,
          img: this.img,
          authorID: this.authorID,
          categoryId: this.categoryId,
          zhaiyao: this.zhaiyao
        })
        .then(res => {
          // console.log(res);
          this.$router.push({
            name: "imglist"
          });
        })
        .catch(console.log);
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
