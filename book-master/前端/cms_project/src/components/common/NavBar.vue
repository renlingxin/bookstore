<template>
  <div>
    <mt-header :title="title">
      <div @click="goBack()" slot="left">
        <mt-button icon="back">返回</mt-button>
      </div>
      <mt-button icon="more" slot="right"></mt-button>
    </mt-header>
  </div>
</template>

<script>
export default {
  name: "nav-bar",
  props: ["title"], //props属性在template中可以直接使用
  created() {
    // 在这里使用this.title
  },
  methods: {
    goBack() {
      // 根据历史记录返回
      this.$router.go(-1);
    }
  },
  data() {
    return {};
  }
};
</script>

<style scoped>
.mint-header {
  width: 100%;
  background-color: #fff;
  color: #000;
  border-bottom: 1px solid #f4f4f4;
}
</style>
