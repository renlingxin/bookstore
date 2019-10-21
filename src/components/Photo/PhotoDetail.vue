<template>
  <div>
    <nav-bar title="图文详情" />
    <!-- 标题 -->
    <p class="pto-head">{{photoInfo.title}}</p>

    <!-- 作者介绍栏 -->
    <div class="author tantan">
      <div class="tantan">
        <!-- 头像 -->
        <div class="headImg tantan">
          <img :src="authors.headimg" alt />
        </div>
        <!-- 姓名及分类 -->
        <div class="types">
          <span>{{authors.name}}</span>
          <p>分类：{{authors.type}}</p>
        </div>
      </div>
      <!-- 关注 -->
      <div class="follow" @click="addFollow">{{followtit}}</div>
    </div>

    <!-- 图片详情-时间-分类 -->
    <div class="photo-title">
      <span>{{photoInfo.click}}次浏览</span>
      <span>发起时间：{{photoInfo.add_time | converTime('YYYY-MM-DD')}}</span>
    </div>
    <!-- 缩略图 -->
    <ul>
      <vue-preview :slides="imgs" @close="handleClose"></vue-preview>
    </ul>
    <!-- 图片详情之content -->
    <div class="photo-desc">
      <p v-html="photoInfo.content"></p>
    </div>

    <!-- 使用评论组件 -->
    <comment :cid="$route.params.id" />
  </div>
</template>

<script>
import shopsTools from "@/shopsTools";
export default {
  data() {
    return {
      followtit: "关注",
      authors: {}, //作者
      photoInfo: {}, //图文信息
      imgs: [] //缩略图信息
    };
  },
  methods: {
    handleClose() {
      // console.log("close event");
    },
    // 关注作者
    addFollow() {
      // 响应数据
      shopsTools.addfollow({ 
        id: this.authors.id,
        author: this.authors.authorID
      });
      this.followtit = "已关注";
    }
  },
  created() {
    //   获取图片详情信息
    let pid = this.$route.params.id;
    this.$axios
      .get(`photo/getimageInfo${pid}`) 
      .then(res => {
        // console.log(res);
        this.photoInfo = res.data;
      })
      .catch(err => {
        console.log(err);
      });
    //   获取图片缩略图
    this.$axios
      .get(`photo/getthumimages${pid}`)
      .then(res => {
        // console.log(res);
        this.imgs = res.data;
        this.imgs.forEach(img => {
          img.msrc = img.src;
          img.w = 350;
          img.h = 230;
        });
      })
      .catch(err => {
        console.log(err);
      });
    // 获取作者ID
    let authorID = this.$route.params.authorID;
    // 获取作者详细信息
    this.$axios
      .get(`photo/getauthor${authorID}`)
      .then(res => {
        this.authors = res.data;
        // console.log(res);
      })
      .catch(err => {
        console.log(err);
      });
  }
};
</script>

<style>
/* 详细信息样式 */
.photo-title {
  width: 97%;
  margin: 0 auto;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between;
  color: darkgray;
  font-size: 13px;
}
.pto-head {
  color: cornflowerblue;
  font-size: 20px;
  margin: 5px;
}
/* 详细信息之conent */
.photo-desc {
  width: 97%;
  margin: 0 auto;
}
/* 缩略图样式  设置的时候不能加scoped*/
ul {
  width: 97%;
  margin: 0 auto;
}
.my-gallery {
  width: 100%;
  text-align: center;
  margin: 15px 0 15px 0;
  border: 1px solid #000;
}
.my-gallery figure {
  display: inline-block;
  margin: 5px;
}
.my-gallery figure img {
  width: 100px;
  height: 80px;
}
/* 作者介绍栏 */
.author {
  width: 97%;
  height: 65px;
  margin: 8px auto;
  align-items: center;
  justify-content: space-between;
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
