<template>
  <div>
    <!-- 头部搜索框 -->
    <div @click="goFind">
      <mt-search v-model="value"></mt-search>
    </div>

    <!-- 列表信息 -->
    <div class="table">
      <ul class="left">
        <li
          v-for="item in liList"
          :class=" id === item.id ? 'active':''"
          @click="changeLi(item.id)"
          :key="item.id"
        >{{item.title}}</li>
      </ul>
      <div class="right">
        <ul>
          <li v-for="item in rightList" :key="item.id" v-show="id === item.tid">
            <img :src="item.img" alt />
            <p>{{item.title}}</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 头部搜索框内容
      value: "",
      id: null,
      liList: [],
      //   tid 是总分类标识
      rightList: []
    };
  },
  created() {
    // 合并请求 分类数据
    var q1 = this.$axios.get("member/list");
    var q2 = this.$axios.get("member/right");
    this.$axios
      .all([q1, q2])
      .then(
        this.$axios.spread((res1, res2) => {
          //    全部成功了
          this.id = res1.data[0].id;
          this.liList = res1.data;
          this.rightList = res2.data;
          // this.changeLi();
        })
      )
      .catch(err => {
        // 其一失败
        console.log(err);
      });
  },
  methods: {
    //   通过数组中的id 改变当前id
    changeLi(data) {
      this.id = data;
    },
    // 进入搜索页面
    goFind() {
      this.$router.push({
        name: "find"
      });
    }
  }
};
</script>

<style scoped>
/* 头部搜索框 */
.mint-search {
  height: 50px;
}
/* 列表信息 */
.table {
  width: 97%;
  /* border: 1px solid red; */
  margin: 5px auto;
  display: flex;
  flex-flow: row wrap;
}
/* 左侧导航 */
.left {
  width: 25%;
  /* border: 1px solid red; */
  background-color: #f1f1f1e0;
  color: darkgray;
}
.left li {
  width: 100%;
  height: 50px;
  text-align: center;
  line-height: 50px;
}
/* 左侧li选中样式 */
.active {
  background-color: #fff;
  color: #000;
}
/* 右侧内容 */
.right {
  width: 70%;
  /* height: 200px; */
  margin: 8px auto;
  /* border: 1px solid #000; */
}
.right ul {
  width: 100%;
  display: flex;
  flex-flow: row wrap;
}
.right li {
  width: 33.33%;
  height: 100px;
  text-align: center;
}
.right ul img {
  width: 60px;
  height: 60px;
}
</style>
