<template>
  <div class="publicRen">
    <nav-bar :title="title"></nav-bar>
    <div class="demo">
      <ul>
        <li>地址：北京市东滩区12号</li>
        <li>电话：0311-2323232</li>
      </ul>
    </div>
  </div>
</template>

<script>
// 2016-01-02T16:00:00.000Z  UTC 通用标准时
export default {
  data() {
    return {
      title: "联系我们"
    };
  },
  created() {}
};
</script>

<style scoped>
.demo a {
  width: 98%;
  height: 52px;
  display: flex;
  flex-flow: row wrap;
  padding-top: 10px;
  margin: 5px auto;
  background-color: #fff;
}
.demo img {
  width: 42px;
  height: 42px;
  margin: 0 10px 10px 10px;
}
/* 详情 */
.details {
  width: 80%;
  height: 52px;
  position: relative;
}
.details p {
  font-size: 14px;
  color: #000;
  /* 超过的使用小数点代替显示 */
  text-overflow: ellipsis;
  white-space: nowrap;
  overflow: hidden;
}
.details div {
  width: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between;
  position: absolute;
  bottom: 4px;
}
.details div span {
  font-size: 12px;
  color: #0bb0f5;
}
ul{
    width: 100%;
    margin-top: 10px;
    background-color: #fff;
}
li{
    margin: 10px;
    /* text-align: center; */
}
</style>
