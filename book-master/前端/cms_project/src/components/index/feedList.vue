<template>
  <div class="publicRen">
    <nav-bar title="反馈列表" ></nav-bar>
    <!-- 遇到的问题 -->
    <div class="quest">
      <p>*请填写您遇到的问题</p>
      <textarea v-model="quest" placeholder="详细写出您遇到的问题（10个字以上），上传页面截图帮助更快
解决"></textarea>
    </div>
    <!-- 意见 -->
    <div class="quest">
      <p>*您的意见</p>
      <textarea v-model="opinion" placeholder="详细写出您遇到的问题（10个字以上），上传页面截图帮助更快
解决"></textarea>
    </div>
    <!-- 提交 -->
    <button @click="submit">提交</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      item: "",
      opinion: "",
      quest: ""
    };
  },
  methods: {
    
    submit() {
      // 获取问题的类型
      let type = this.$route.query.type;
      // console.log(type);
      this.$axios
        .post(`/feed?type=${type}`, {
          quest: this.quest,
          opinion: this.opinion
        })
        .then(res => {
          if (res.status === 200) {
             this.$toast("提交成功");
          }else{
            this.$toast('服务器错误')
          }
        })
        .catch(console.log);
    }
  },
  created() {}
};
</script>

<style scoped>
/* 问题 */
.quest {
  width: 97%;
  margin: 0 auto;
}
.quest p {
  margin: 8px 0 8px 8px;
  color: red;
  font-size: 18px;
}
.quest textarea {
  width: 100%;
  height: 200px;
  background-color: #fff;
  border: none;
  padding-top: 5px;
  padding-left: 5px;
}
textarea::-webkit-input-placeholder {
  color: #e0e0e0e0;
}
/* button */
button {
  width: 100%;
  height: 43px;
  background-color: red;
  color: #fff;
  position: fixed;
  bottom: 0;
}
</style>
