<template>
  <mt-swipe :auto="4000" :show-indicators="false">
    <!-- 使用v-for组件的时候需要给key 避免vue计算key 作用是提升性能-->
    <mt-swipe-item v-for="(item,index) in swipe" :key="index">
      <img :src="item.img_url" alt />
    </mt-swipe-item>
  </mt-swipe>
</template>

<script>
export default {
  props: ["url"],
  name: "my-swipe",
  data() {
    return {
      swipe: [] //轮播图数据
    };
  },
  created() {
    this.$axios
      .get(this.url)
      .then(res => {
        // console.log(res);
        this.swipe = res.data;
      })
      .catch(err => {
        console.log(err);
      });
  }
};
</script>

<style scoped>
/* 轮播图样式 */
.mint-swipe img {
  width: 100%;
  height: 100%;
}
.mint-swipe {
  width: 100%;
  height: 200px;
}
</style>
