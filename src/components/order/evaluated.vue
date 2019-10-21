<template>
  <div>
    <!-- 未收货 -->
    <ul v-if="isnull  === 1">
      <li class="tantan" v-for="item in option" :key="item.id">
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
        <!-- 立即付款 -->
        <div class="pay">
          <p @click="getshop(item.id)">我已收货</p>
        </div>
      </li>
    </ul>

    <!-- 列表为空时 -->
    <div class="cartnull" v-if="isnull  === 2">
      <img src="../../../static/img/购物车/空.png" alt />
      <h3>您的待收货商品为空</h3>
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
  methods: {
    getshop(id){
      let data = id;
       this.$axios
        .post(`shop/uphade`, {
          id: data
        })
        .then(res => {
          // console.log(res);
          if (res.status === 200) {
            this.option.forEach((item,index) => {
              if(item.id == data){
                   this.option.splice(index,1)
              }
            });
            this.$toast("收货成功");
          } else {
            this.$toast("收货错误");
          }
        })
        .catch(console.log);
    }
  },
  created() {
    // 获取未收货商品数据
    this.$axios.get(`shop/gethade`)
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
  align-items: center;
  overflow: hidden;
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
  font-size: 16px;
  margin-bottom: 10px;
}
.details span {
  font-size: 10px;
  color: #989898;
}
/* 立即付款 */
.pay {
  width: 20%;
  overflow: hidden;
}
.pay p {
  width: 90%;
  height: 30px;
  color: #fff;
  text-align: center;
  line-height: 30px;
  margin-top: 38px;
  font-size: 10px;
  border-radius: 15px;
  background-color: red;
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
