<template>
  <!-- 未评价 -->
  <div>
    <ul v-if="isnull  === 1">
      <li v-for="item in option" :key="item.id">
        <router-link :to="{name:''}">
          <!-- 商品图片 -->
          <div class="imgShop">
            <img :src="item.img_url" alt />
          </div>
          <!-- 商品详情 -->
          <div class="details">
            <p>{{item.store}}</p>
            <span>
              {{item.title | Wordcontrol(35)}}
            </span>
          </div>
        </router-link>
      </li>
    </ul>

    <!-- 列表为空时 -->
    <div class="cartnull" v-if="isnull  === 2">
      <img src="../../../static/img/购物车/空.png" alt />
      <h3>您的待评价商品为空</h3>
      <p>工作再忙，也要买点书充实一下自己~</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      option:[],
      isnull:1
    }
  },
  created() {
     // 获取未收货商品数据
    this.$axios.get(`shop/getstar`)
    .then(res=>{
      // console.log(res)
      if (res.data.length == 0) {
          this.isnull = 2;
        }
      this.option = res.data
    })
    .catch(console.log)
  },
};
</script>

<style scoped>
li {
  height: 100px;
  background-color: #fff;
   margin-top: 8px;
}
li a {
  height: 100px;
  display: flex;
  flex-flow: row wrap;
  overflow: hidden;
  align-items: center;
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
  width: 70%;
}
.details p {
  font-size: 16px;
  margin-bottom: 10px;
}
.details span {
  font-size: 10px;
  color: #989898;
}
/* 购物车为空时的样式 */
.cartnull {
  margin-top: 15px;
  text-align: center;
}
.cartnull img {
  width: 110px;
  height: 110px;
  margin-bottom: 15px;
}

.cartnull p {
  color: silver;
  margin-top: 10px;
}
</style>
