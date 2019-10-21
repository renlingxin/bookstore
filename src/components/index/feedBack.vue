<template>
  <div class="publicRen">
    <nav-bar title="我要反馈"></nav-bar>
    <p>请选择反馈类型</p>
    <!-- 反馈类型选择 -->
    <div class="type tantan">
      <router-link :to="{name:'feedList',query:{type:1}}">
        <!-- 使用问题 -->
        <div class="make tantan">
          <img src="../../../static/img/首页/使用问题.png" alt />
          <p>使用问题</p>
        </div>
      </router-link>
      <!-- 交易问题 -->
      <router-link :to="{name:'feedList',query:{type:2}}">
        <div class="make tantan">
          <img src="../../../static/img/首页/交易.png" alt />
          <p>交易问题</p>
        </div>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped> 
.publicRen p {
  font-size: 20px;
  margin: 10px;
}
/* 类型选择 */
.type {
  width: 100%;
  height: 220px;
  justify-content: center;
  margin-top: 50px;
}
.type img {
  width: 70px;
  height: 70px;
}
.type a {
  width: 45%;
  height: 200px;
  background-color: #fff;
  margin: 5px;
  border-radius: 10px;
}
.make {
  width: 100%;
  height: 200px;
  justify-content: center;
  align-items: center;
  text-align: center;
}
.make p {
  width: 100%;
}
</style>
