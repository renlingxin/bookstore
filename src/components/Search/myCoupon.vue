<template>
    <div class="publicRen">
        <nav-bar title="我的卡券"></nav-bar>
        <!-- 优惠券标题 -->
        <div class="coupon-head tantan">
          <div class="money">
            <span>￥</span>
            <span>30元</span>
          </div>
          <div class="time">
            <span>优惠券</span>
            <span>(有效期至2019-10-2)</span>
            <p>只可购买生活知识类图书</p>
          </div>
          <div class="receive">可用</div>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style scoped>
/* 优惠券标题 */
.coupon-head {
  width: 100%;
  height: 60px;
  margin-top: 15px;
  justify-content: space-between;
  align-items: center;
  background-color: #fafbc5;
}
.money {
  color: red;
  margin-left: 5px;
}
.money span:nth-of-type(1) {
  font-size: 12px;
}
.money span:nth-of-type(2) {
  font-size: 25px;
}
.time span:nth-of-type(1) {
  font-size: 15px;
}
.time span:nth-of-type(2) {
  font-size: 10px;
  color: #8f8f8fe0;
}
.time p {
  font-size: 12px;
  color: red;
  margin-top: 5px;
}
.receive {
  width: 65px;
  height: 30px;
  border-radius: 15px;
  color: #fff;
  text-align: center;
  line-height: 30px;
  font-size: 12px;
  background-color: red;
  margin-right: 5px;
}
</style>
