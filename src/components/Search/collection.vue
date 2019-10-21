<template>
  <div class="publicRen">
    <nav-bar title="我的收藏"></nav-bar>
    <ul>
      <li class="tantan" v-for="detail in detail" :key="detail.id">
        <!-- 收藏图片 -->
        <div class="imgShop">
          <img :src="detail.img_url" alt />
        </div>
        <!-- 收藏详情 -->
        <div class="details">
          <p>{{detail.title}}</p>
          <span>
            收藏时间：{{detail.time | converTime('YYYY-MM-DD')}}
          </span>
        </div>
        <!-- 立即查看 -->
        <div class="pay" @click="goDetail(detail.id,detail.authorID)">
          <p>查看</p>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      detail:[]
    }
  },
  methods: {
    // 跳转到详情
    goDetail(id,authorID){
      this.$router.push({
        name:'NewsDetail',
        params:{id:id,authorID:authorID}
      })
    }
  },
  created() {
     // 读取缓存中的收藏书文的id
    let res = localStorage.getItem("likebooks");
    let mycollect = JSON.parse(res);
    
    // 获取用户收藏的书文
    this.$axios
      .post(`search/getmycollect`, {
        mycollect: mycollect
      })
      .then(res => {
        // console.log(res);
        if (res.data === "缺少参数") {
          this.$toast("你暂时还没有关注");
        } else {
          this.detail = res.data;
        }
      })
      .catch(err => {
        console.log(err);
      });
  },
};
</script>

<style scoped>
li {
  height: 80px;
  background-color: #fff;
  margin-top: 10px;
  align-items: center;
  /* overflow: hidden; */
}
.imgShop {
  width: 20%;
  text-align: center;
}
.imgShop img {
  width: 60px;
  height: 70px;
}
/* 详情 */
.details {
  width: 60%;
}
.details p {
  font-size: 18px;
  margin-bottom: 20px;
}
.details span {
  font-size: 12px;
  color: #989898;
}
/* 立即查看 */
.pay {
  width: 18%;
  height: 30px;
  color: #fff;
  text-align: center;
  line-height: 30px;
  margin-right: 5px;
  font-size: 10px;
  border-radius: 13px;
  background-color: red;
}
</style>
