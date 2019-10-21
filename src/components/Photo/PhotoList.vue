<template>
  <div class="ren">
    <nav-bar title="图文分享" /> 
    <!-- 引入返回导航 -->
    <div class="photo-header">
      <ul>
        <li v-for="categories in categories" :key="categories.id">
          <a href="javascript:;" @click="navget(categories.id)">{{categories.title}}</a>
        </li>
      </ul>
    </div>
    <div class="photo-list">
      <ul>
        <li v-for="(imgs,index) in imgs" :key="index">
          <router-link :to="{name:'PhotoDetail',params:{id:imgs.id,authorID:imgs.authorID}}">
            <img v-lazy="imgs.img_url" />
            <p>
              <span>{{imgs.title}}</span>
              <br />
              <span>{{imgs.zhaiyao}}</span>
            </p>
          </router-link>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 图片数据
      imgs: [],
      categories: []
    };
  },
  beforeRouteUpdate(to, from, next) {
    // 在当前路由改变，但是该组件被复用时调用
    // console.log(to);
    // console.log(from);
    let { categoryId } = to.query;
    this.loadImgs(categoryId);
    next();//放行
  },
  methods: {
    navget(categoryId) {
      this.$router.push({
            name:'PhotoList',
            query:{categoryId:categoryId}
      });
    },
    loadImgs(categoryId) {
      // 2: 发起请求
      this.$axios
        .get("photo/getimages" + categoryId)
        .then(res => {
          // 3: 渲染数据
          // console.log(res);
          this.imgs = res.data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  created() {
    // 1：获取分类id
    let { categoryId } = this.$route.query;
    this.loadImgs(categoryId);
    //获取分类信息
    this.$axios
      .get("photo/getcategory")
      .then(res => {
        this.categories = res.data;
      })
      .catch(err => {
        console.log(err);
      });
  }
};
</script>

<style scoped>
.photo-header ul {
  /* 强制不换行 */
  white-space: nowrap;
  /* 横向超出部分滚动显示 */
  overflow-x: auto;
}
.photo-header li {
  display: inline-block;
  height: 30px;
  line-height: 30px;
  margin: 5px;
}
/* 图片样式 */
.photo-list li {
  position: relative;

}
.photo-list li img {
  width: 100%;
}
.photo-list ul {
  padding-left: 0px;
  margin: 0;
}
.photo-list p {
  width: 100%;
  position: absolute;
  bottom: 5px;
  color: aliceblue;
  /* 背景阴影 */
  background: rgba(0, 0, 0, 0.3);
  /* padding-left: 5px; */
}
.photo-list p span:nth-child(1) {
  /* font-weight 属性设置文本的粗细。 */
  font-weight: bold;
  font-size: 16px;
}
image[lazy=loading] {
  width: 40px;
  height: 300px;
  margin: auto;
}
</style>
