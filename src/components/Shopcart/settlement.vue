<template>
  <div class="publicRen">
    <nav-bar title="订单详情"></nav-bar>
    <!-- 收货地址 -->
    <div class="address tantan">
      <img src="../../../static/img/查找1.png" alt />
      <div class="info">
        <span>任岭鑫</span>
        <span>1802848548</span>
        <p>河北省石家庄市宫北路十一号河北省石家庄市宫北路十一号</p>
        <p>收货不便时，可以选择不收货</p>
      </div>
    </div>
    <!-- 商品详情 -->
    <div class="subject">
      <ul>
        <li v-for="items in option" :key="items.id">
          <!-- 书店 -->
          <div class="title">
            <span>{{items.store}}</span>
          </div>
          <!-- 详情 -->
          <div class="details tantan">
            <div style="width:25%">
              <img :src="items.img_url" alt />
            </div>
            <div style="width:65%" class="tmp">
              <!-- 详情描述 -->
              <p>{{items.title}}</p>
            </div>
          </div>
          <!-- 价格 -->
          <div class="sale tantan">
            <span>价格：￥{{items.price}}</span>
            <span>数量：{{items.bynum}}</span>
          </div>
        </li>
      </ul>
    </div>
    <!-- 付款 -->
    <div class="pay tantan">
      <div>
        应付款：￥
        <span>{{money}}</span>
      </div>

      <p @click="goPay">立即付款</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      option: [],
      money: 0
    };
  },
  methods: {
    //   立即付款  修改购物车中该商品的状态
    goPay() {
      let id = [];
      for (var item of this.option) {
        id.push(item.id);
      }
      this.$axios
        .post(`shop/pay`, {
          id: id
        })
        .then(res => {
          //   console.log(res);
          if (res.status === 200) {
            this.$toast("支付成功");
            this.$router.push({
              name: "Search"
            });
          } else {
            this.$toast("支付错误");
          }
        })
        .catch(console.log);
    }
  },
  created() {
    //   筛选获得商品数组中 imgshow为true的商品
    let option = this.$route.params.data;
    console.log(option);
    let data = option.filter(item => {
      return item.imgShow === true;
    });
    this.option = data;
    // 赋值总价格
    this.money = this.$route.params.mon;
  }
};
</script>

<style scoped>
/* 收货地址 */
.address {
  width: 90%;
  height: 120px;
  background-color: #fff;
  margin: 5px auto;
  border-radius: 10px;
  align-items: center;
  justify-content: space-around;
  overflow: hidden;
}
.address img {
  width: 50px;
  height: 50px;
}
.info {
  width: 70%;
  /* height: 120px; */
}
.info span:nth-of-type(1) {
  font-size: 18px;
}
.info span:nth-of-type(2) {
  font-size: 15px;
}
.info p:nth-of-type(1) {
  margin-top: 5px;
  font-size: 13px;
  color: silver;
}
.info p:nth-of-type(2) {
  margin-top: 5px;
  font-size: 16px;
  color: rgb(255, 255, 36);
}
/* 购物车详情 */

.subject li {
  width: 90%;
  height: 170px;
  margin: 10px auto;
  border-radius: 15px;
  background-color: #fff;
  overflow: hidden;
}
/* 标题 */
.title {
  font-size: 12px;
  margin: 8px 0 8px 15px;
}

/* 详情 */
.details {
  justify-content: center;
}
.details img {
  width: 80px;
  height: 80px;
}
.tmp p {
  font-size: 13px;
  color: #888888;
}
/* 价格数量 */
.sale {
  width: 100%;
  height: 30px;
  justify-content: space-around;
  align-items: center;
  border-top: 1px solid rgb(128, 128, 128);
  margin-top: 25px;
}
.sale span {
  /* color: red; */
  font-size: 15px;
}
/* 付款 */
.pay {
  width: 100%;
  height: 50px;
  margin-top:150px;
  background-color: #fff;
  align-items: center;
  justify-content: space-between;
}
.pay div {
  margin-left: 5px;
}
.pay span {
  font-size: 20px;
  color: red;
}
.pay p {
  width: 80px;
  height: 30px;
  background-color: red;
  border-radius: 8px;
  text-align: center;
  line-height: 30px;
  color: #fff;
  font-size: 15px;
  margin-right: 5px;
}
</style>
