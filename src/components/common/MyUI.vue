<template>
  <ul>
    <!-- solt具名插槽 -->
    <slot></slot>
  </ul>
</template>

<script>
export default {
  name: "my-ui",
  data() {
    return {};
  }
};
</script>

<style scoped>
ul {
  overflow: hidden;
}

</style>
