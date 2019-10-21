<template>
  <div class="publicRen">
    <nav-bar title="领券中心"></nav-bar>
    <!-- 优惠券详情 -->
    <ul class="coupon-detail">
      <li>
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
          <div class="receive">立即领取</div>
        </div>
        <!-- 商品展示 -->
        <ul class="shops tantan">
          <li>
            <img src="../../../static/img/首页/书.jpg" alt />
            <p>九年级义务教育</p>
          </li>
          <li>
            <img src="../../../static/img/首页/书.jpg" alt />
            <p>九年级义务教育</p>
          </li>
          <li>
            <img src="../../../static/img/首页/书.jpg" alt />
            <p>九年级义务教育</p>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  }
};
</script>

<style scoped>
.coupon-detail {
  width: 90%;
  height: 200px;
  margin: 15px auto;
}
/* 优惠券标题 */
.coupon-head {
  width: 100%;
  height: 60px;
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
/* 商品展示 */
.shops {
  width: 100%;
  height: 135px;
  border-radius: 10px;
  background-color: #fff;
  align-items: center;
}
.shops li {
  width: 33.3%;
  text-align: center;
  font-size: 12px;
}
.shops img {
  width: 65px;
  height: 70px;
  margin-bottom: 12px;
}
</style>
