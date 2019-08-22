<template>
  <div class="tap">
    <el-carousel :interval="4000" type="card" height="200px">
      <el-carousel-item v-for="item in img" :key="item.id">
        <!-- <h3 class="medium">{{ item }}</h3> -->
        <img class="mediums" :src="item.img" alt />
      </el-carousel-item>
    </el-carousel>
   
    <p>{{$t('m.welcome')}}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      img: [
        { id: 1, img: "http://img62.ddimg.cn/upload_img/00678/zsts/xinshu750X315-1564550659.jpg" },
        { id: 2, img: "http://img63.ddimg.cn/upload_img/00316/by/750x315-1565004389.jpg" },
        { id: 3, img: "http://img63.ddimg.cn/upload_img/00087/geq/750x315_0806-1565087544.jpg" },
        { id: 4, img: "http://img60.ddimg.cn/ddreader/dangebook/8y5z_750x315.jpg" }
      ]
    };
  }
};
</script>

<style scoped>
.el-carousel {
  width: 80%;
  margin: 20px auto;
}
.el-carousel__item h3 {
  color: #475669;
  font-size: 14px;
  opacity: 0.75;
  line-height: 200px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
.mediums{
  width: 100%;
  height: 100%;
  border: 1px solid #000;
}
/*  */
.tap {
  width: 100%;
  text-align: center;
}
/*头部样式  */

.tap p {
  margin-top: 40px;
  font-size: 30px;
}
</style>
