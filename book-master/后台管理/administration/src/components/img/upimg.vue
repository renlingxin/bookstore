<template>
  <div style="width: 100%" class="public">
    <div class="atap">
      <!-- 导航 -->
      <ul class="navbato tantan">
        <li>修改图文</li>
      </ul>
      <!-- 登录 -->
      <div class="login">
        <!-- 输入 -->
        <div class="usermake tantan">
            <span>标题：</span><input type="text" v-model="title" @change="nickver" />
            <span>摘要：</span><input type="text" v-model="zhaiyao" />
            <span>图片：</span><input type="text" v-model="img_url" />
           <span>作者：</span> <input type="text" v-model="authorID" />
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
      zhaiyao: "",
      img_url: "",
      authorID: "",
      id: "",
      ge: 0
    };
  },
  methods: {
    nickver() {
      if (this.title.length >= 20) {
        this.ge = 0;
        this.$message("标题不得超过20位");
      } else {
        this.ge = 1;
      }
    },
    // 提交修改
    goSeach() {
      if (this.ge === 0 || this.title === "" || this.author === "") {
      } else {
        this.$axios
          .post(`img/make`, {
            title: this.title,
            img_url: this.img_url,
            zhaiyao: this.zhaiyao,
            authorID: this.authorID,
            id: this.id
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
  },
  created() {
    //   将需要修改的数据赋值
    this.title = this.$route.params.makedata.title;
    this.zhaiyao = this.$route.params.makedata.zhaiyao;
    this.img_url = this.$route.params.makedata.img_url;
    this.authorID = this.$route.params.makedata.authorID;
    this.id = this.$route.params.makedata.id;
  }
};
</script>

<style scoped>
.atap {
  width: 40%;
  height: 400px;
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
