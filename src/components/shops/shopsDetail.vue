<template>
  <div class="base">
    <nav-bar title="商品详情" />
    <div class="outer-swiper">
      <div class="swiper">
        <!-- 轮播图 -->
        <my-swipe :url="url"></my-swipe>
      </div>
      <!-- 详情 -->
      <div class="product-desc">
        <ul>
          <li>
            <span class="product-desc-span">{{info.title}}</span>
          </li>
          <li class="price-li">
            市场价：
            <s>￥{{info.market_price}}</s>
            销售价：
            <span>￥{{info.sell_price}}</span>
          </li>
          <li class="number-li">
            购买数量：
            <span @click="substract">-</span>
            <span>{{byNum}}</span>
            <span @click="add">+</span>
          </li>
          <li class="monek">
            <mt-button type="primary">立即购买</mt-button>

            <mt-button type="danger" @click="addBuyCart">加入购物车</mt-button>
            <!-- 过渡效果内置组件 -->
            <transition name="ball" @after-enter="afterEnter">
              <div class="ball" v-if="isShow"></div>
            </transition>
          </li>
        </ul>
      </div>

      <div class="product-props">
        <ul>
          <li>商品参数</li>
          <li>商品货号：{{info.shops_no}}</li>
          <li>库存情况：{{info.stock}}件</li>
          <li>上架时间：{{info.add_time | converTime('YYYY-MM-DD')}}</li>
        </ul>
      </div>
      <div class="product-info">
        <ul>
          <li>
            <mt-button type="primary" size="large" plain @click="goShopInfo">图文介绍</mt-button>
          </li>
          <li>
            <mt-button type="danger" size="large" plain @click="goShopComment">商品评论</mt-button>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import Middle from "@/Middle";
import shopsTools from "@/shopsTools";
export default {
  data() {
    return {
      // 商品唯一id
      shopsId: this.$route.query.id,
      info: {}, //详细信息
      imgs: [], //轮播图
      url: ``, //传递给轮播图组件的参数
      // 当前商品购买数量
      byNum: 1,
      // 滚动小球是否显示
      isShow: false,
      // 存储的数据
      shopLocal: []
    };
  },
  methods: {
    afterEnter() {
      this.isShow = false;
      // 加入购物车
      this.$axios
        .post(`shop/addshopcart`, {
          id: this.info.id,
          num: this.byNum
        })
        .then(res => {
          // console.log(res);
        })
        .catch(console.log); 
      // 通过中间件将数量响应给首页显示
      Middle.$emit("addBuyCart", this.byNum); 
    },
    addBuyCart() {
      this.isShow = true;
    },
    substract() {
      if (this.byNum === 1) return;
      this.byNum--;
    },
    add() {
      if (this.byNum >= this.info.stock) return;
      this.byNum++;
    },
    goShopInfo() {
      // 直接进入到详情组件
      this.$router.push({
        name: "NewsDetail",
        params: {
          id: this.$route.query.id
        }
      });
    },
    // 传递给评论组件当前id
    goShopComment() {
      this.$router.push({
        name: "shopComment",
        query: {
          id: this.$route.query.id
        }
      });
    }
  },
  created() {
    //指定传递给轮播图组件的参数
    this.url = `shop/getshopswipe?shopsId=${this.shopsId}`;
    // 获取详细信息数据
    this.$axios
      .get(`shop/getshopinfo?shopsId=${this.shopsId}`)
      .then(res => {
        // console.log(res);
        this.info = res.data;
      })
      .catch(console.log);
  }
};
</script>

<style scoped>
.base {
  margin-bottom: 75px;
}
/* 大盒子 */
.outer-swiper {
  width: 100%;
  /* background-color: gainsboro; */
  color: slategrey;
}
/* 轮播图加信息 */
.swiper {
  width: 95%;
  height: 200px;
  margin: 5px auto;
  border-radius: 5px;
  border: 1px solid darkgray;
  padding: 5px;
}
/* 详细信息 */
.product-desc {
  width: 95%;
  margin: 5px auto;
  border-radius: 5px;
  border: 1px solid darkgray;
  padding: 5px;
}
.product-desc-span {
  color: blue;
  font-size: 18px;
  font-weight: bold;
  margin: 5px;
}
.price-li {
  border-top: 1px solid darkgray;
  font-size: 14px;
  padding-top: 15px;
  margin-top: 15px;
}
.price-li span {
  color: crimson;
  font-size: 18px;
}
.number-li {
  margin: 15px 0 15px 0;
}
.number-li span {
  display: inline-block;
  width: 28px;
  height: 20px;
  line-height: 20px;
  text-align: center;
  border: 1px solid silver;
}
/* 评论加入购物车的 */
.monek {
  display: flex;
  flex-flow: row wrap;
  position: relative;
}
/* 过渡效果内置组件 */
/* 元素被移除前默认有一个透明度1的显示的 */
.ball-leave {
  opacity: 0;
}
.ball {
  width: 18px;
  height: 18px;
  position: absolute;
  bottom: 15px;
  left: 140px;
  background-color: red;
  border-radius: 50%;
}
.ball-enter-active {
  animation: bounce-in 1s;
}
@keyframes bounce-in {
  0% {
    transform: translate3d(0, 0, 0);
  }
  50% {
    transform: translate3d(140px, -50px, 0);
  }
  75% {
    transform: translate3d(160px, 0px, 0);
  }
  100% {
    transform: translate3d(50px, 300px, 0);
  }
}
/* 详细参数 */
.product-props {
  width: 97%;
  margin: 5px auto;
  border-radius: 5px;
  border: 1px solid silver;
}
.product-props li {
  margin: 10px;
}
/* 评论+图文介绍 */
.product-info {
  margin-top: 12px;
}
.product-info li {
  margin: 5px;
}
</style>
