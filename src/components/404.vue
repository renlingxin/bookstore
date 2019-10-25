<template>
  <div class="nofound">
    <img src="../../static/img/页面不存在.png" alt />
    <h3>对不起，您访问的页面不存在~</h3>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  created() {}
};
</script>


<style scoped>
.nofound{
    width: 100%;
text-align: center;
}
.nofound img{
    margin-top: 40px;
    margin-bottom: 40px;
}
</style>