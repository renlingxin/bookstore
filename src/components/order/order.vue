<template>
  <div class="publicRen">
    <nav-bar title="我的订单"></nav-bar>
    <!-- 分类导航 -->
    <ul class="order-type tantan">
      <li :class="$route.path === '/order/payment' ? 'active' : ''" @click="goPay">待付款</li>
      <li :class="$route.path === '/order/evaluated' ? 'active' : ''" @click="goEva">待收货</li>
      <li :class="$route.path === '/order/received' ? 'active' : ''" @click="goRec">待评价</li>
    </ul>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
    data() {
        return {
            path:this.$route.path
        }
    },
    created() {
        // console.log(this.path)
    },
    methods: {
      goPay(){
        this.$router.push({
          name:'payment'
        })
      },goEva(){
        this.$router.push({
          name:'evaluated'
        })
      },goRec(){
        this.$router.push({
          name:'received'
        })
      }

    },
};
</script>

<style scoped>
.order-type {
  width: 100%;
  height: 50px;
  line-height: 50px;
  background-color: #fff;
  margin-top: 8px;
}
.order-type li{
    width: 33.3%;
    text-align: center;

}
.active{
    border-bottom: 1px solid red;
}
</style>
