<template>
  <div class="tmpl">
    <nav-bar :title="myTitle" />
    <div class="news-title">
      <p class="tit-p">{{newsInfo.title}}</p>
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
      <!-- 详情 -->
      <div class="detail tantan">
        <span>{{newsInfo.click}}次点击</span>
        <span>添加时间：{{newsInfo.add_time | converTime('YYYY-MM-DD')}}</span>
      </div>
      <!-- 该内容的响应数据带有html标签 -->
      <div class="news-content" v-html="newsInfo.content"></div>
    </div>
  </div>
</template>
<script>
import shopsTools from "@/shopsTools";
export default {
  data() {
    return {
      // 新闻详情数据
      newsInfo: {},
      myTitle: "", // 可变的
      authors: {},
      followtit: "收藏"
    };
  },
  methods: {
    addFollow() {
      // 响应数据
      shopsTools.addlikebook({
        id: this.newsInfo.id
      });
      // 改变当前  页面 关注
      this.followtit = "已收藏";
    }
  },
  created() {
    
    // 1: 获取路由参数
    let { id } = this.$route.params;
    // 2: 拼接后台url发起请求
    let url = "news/getnew" + id;
    this.$axios
      .get(url)
      .then(res => {
        // 3: 响应的数据渲染到页面上，通过一个详情对象
        // console.log(res);
        this.newsInfo = res.data;        
      })
      .catch(err => {
        console.log(err);
      });

    // 获取作者ID
    let authorID = this.$route.params.authorID;
    // console.log(authorID);
    // 获取作者详细信息
    this.$axios
      .get(`news/getauthor${authorID}`)
      .then(res => {
        this.authors = res.data;
        // console.log(res);
      })
      .catch(err => {
        console.log(err);
      });
  },
  // 在渲染该组件的对应路由被 confirm 前调用
  // 不！能！获取组件实例 `this`
  // 因为当守卫执行前，组件实例还没被创建
  beforeRouteEnter(to, from, next) {
    let title = "";
    let followtit = "";
    // 判断 from是新闻列表，还是商品图文详情
    if (from.name === "NewsList") {
      title = "新闻详情";
      followtit = "收藏";
    } else if (from.name === "GoodsDetail") {
      title = "商品图文信息";
    } else if (from.name === "collection") {
      followtit = "已收藏";
    }

    // 这里没有this,因为组件还没有被实例化
    next(vm => {
      // 通过 `vm` 访问组件实例
      vm.myTitle = title;
      vm.followtit = followtit;
    });
  }
};
</script>

<style scoped>
/* scoped 表示它的样式作用于当下的模块 */
.news-title {
  width: 97%;
  margin: 0 auto;
}
.tit-p {
  color: cornflowerblue;
  font-size: 20px;
  margin: 5px;
}
/* 详情-点击数-发表时间 */
.news-title .detail {
  /* 上右下左 */
  justify-content: space-between;
  align-items: center;
  margin: 5px 0 15px 0;
}
.detail span {
  color: #000;
  font-size: 14px;
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
/* .news-content { */
/* 首行缩进35px */
/* text-indent:35px */
/* } */
</style>
