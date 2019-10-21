<template>
  <div class="publicRen">
    <nav-bar title="我的关注"></nav-bar>
    <!-- 作者介绍栏 -->
    <div class="author tantan" v-for="(item,index) in author" :key="index">
      <div class="tantan">
        <!-- 头像 -->
        <div class="headImg tantan">
          <img :src="item.headimg" alt />
        </div>
        <!-- 姓名及分类 -->
        <div class="types">
          <span>{{item.name}}</span>
          <p>分类：{{item.type}}</p>
        </div>
      </div>
      <!-- 关注 -->
      <div class="follow">已关注</div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      author: []
    };
  },
  created() {
    // 读取缓存中的关注作者数据
    let res = localStorage.getItem("myFollow");
    let myFollow = JSON.parse(res);
    
    // 获取关注的作者
    this.$axios
      .post(`search/getmyfollow`, {
        myFollow: myFollow
      })
      .then(res => {
        // console.log(res);
        if (res.data === "缺少参数") {
          this.$toast("你暂时还没有关注");
        } else {
          this.author = res.data;
        }
      })
      .catch(err => {
        console.log(err);
      });
  },
  methods: {}
};
</script>

<style scoped>
/* 作者介绍栏 */
.author {
  width: 97%;
  height: 65px;
  margin: 8px auto;
  align-items: center;
  justify-content: space-between;
  background-color: #fff;
  border: 1px solid rgb(240, 240, 240);
}
.author img {
  width: 40px;
  height: 40px;
}
/* 作者-头像 */
.headImg {
  width: 50px;
  height: 50px;
  border: 1px solid #e0e0e0;
  border-radius: 50%;
  justify-content: center;
  align-items: center;
  margin-left: 5px;
}
/* 作者-姓名-分类 */
.types {
  margin-left: 8px;
}
.types span {
  font-size: 18px;
}
.types p {
  margin-top: 8px;
  font-size: 13px;
  color: silver;
}
/* 作者-关注 */
.follow {
  width: 60px;
  height: 30px;
  border-radius: 5px;
  color: #fff;
  text-align: center;
  line-height: 30px;
  background-color: #4133fd;
  margin-right: 5px;
}
</style>
