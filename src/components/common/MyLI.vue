<template>
  <li>
      <slot></slot>
      <slot name="icon" class="icon"></slot>
  </li>
</template>

<script>
export default {
  name: "my-li",
  data() {
    return {};
  }
};
</script>

<style scoped>
.icon{
  width: 100%;
}
li {
  float: left;
  float: left;
  width: 33.333%;
  text-align: center;
}
</style>
