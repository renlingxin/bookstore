 <template>
  <div class="buy">
    <div class="bton">
      <!-- 蓝色背景头部 -->
      <div class="head">
        <div>
          <h2>购物车</h2>
          <p>共{{options.length}}件宝贝</p>
        </div>
        <span @click="delet">{{deTie}}</span>
      </div>
      <!-- 购物详情 -->
      <div class="subject" v-if="isnull  === 1">
        <ul>
          <li v-for="items in options" :key="items.id">
            <!-- 标题 -->
            <div class="title tantan">
              <div class="garden" @click="goShow(items.id,items.imgShow)">
                <img v-if="items.imgShow" src="../../../static/img/购物车/选中.png" alt />
              </div>
              <span>{{items.store}}</span>
            </div>
            <!-- 详情 -->
            <div class="details tantan">
              <div style="width:25%">
                <img :src="items.img_url" alt />
              </div>
              <div style="width:65%" class="tmp">
                <!-- 详情描述 -->
                <p>{{items.title | Wordcontrol(30)}}</p>
                <!-- 价格+数量 -->
                <div class="sale tantan">
                  <p>￥{{items.price}}</p>
                  <div class="number-li">
                    <span @click="substract(items.id)">-</span>
                    <span>{{items.bynum}}</span>
                    <span @click="add(items.id)">+</span>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </div>

      <!-- 购物车为空时 -->
      <div class="cartnull" v-if="isnull  === 2">
        <img src="../../../static/img/购物车/购物车为空.png" alt />
        <h3>购物车竟然是空的</h3>
        <p>工作再忙，也要买点书充实一下自己~</p>
      </div>
    </div>

    <!-- 结算 -->
    <div class="account tantan">
      <div class="num tantan">
        <div class="garden" @click="allShow">
          <img v-if="imgShow" src="../../../static/img/购物车/选中.png" alt />
        </div>
        <span>全选</span>
      </div>
      <div class="bom tantan" v-show="isDetel === 1">
        合计：
        <p>￥{{allMoney}}</p>
        <div @click="gosettlement">结算</div>
      </div>
      <div class="bom tantan" v-show="isDetel === 2">
        <div @click="deleshop">删除</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      deTie: "管理",
      // 是否显示删除
      isDetel: 1,
      // 合计价格
      allMoney: 0,
      // 是否显示
      imgShow: false,
      // 当前商品数量
      byNum: 5,
      // 用户购物车中数据
      options: [],
      // 控制购物车为空时样式
      isnull: 1
    };
  },
  created() {
    // 获取购物车数据
    this.$axios
      .get(`shop/getshopcart`)
      .then(res => {
        // console.log(res);
        this.options = res.data;
        // 当购物车为空时 控制为空的样式显示
        if (res.data.length === 0) {
          this.isnull = 2;
        }
        // 向当前购物车数组中添加imgshow控制显示
        this.options.forEach(item => {
          item.imgShow = false;
        });
      })
      .catch(console.log);
  },
  methods: {
    // 跳转结算界面
    gosettlement() {
      console.log(this.options)
      if (this.options.length === 0) {
        this.$toast("您现在没有商品可以结算");
      } else {
        this.$router.push({
          name: "settlement",
          params: { data: this.options, mon: this.allMoney }
        });
      }
    },
    // 显示删除商品按钮以及更改文本内容
    delet() {
      if (this.isDetel === 1) {
        this.isDetel = 2;
        this.deTie = "完成";
      } else if (this.isDetel === 2) {
        this.isDetel = 1;
        this.deTie = "管理";
      }
    },
    // 删除商品
    deleshop() {
      let data = [];
      for (var i = 0; i < this.options.length; i++) {
        if (this.options[i].imgShow === true) {
          // 将需要删除的商品id保存
          data.push(this.options[i].id);
          // 删除data中当前数组中 imgshow为 true 的商品
          this.options.splice(i, 1);
          i--;
        }
      }
      // 提示删除成功
      this.$toast("删除成功");
      this.delshopcart(data);
      this.allMoney = 0;
      // 判断当前购物车数据是否为空
      if (this.options.length === 0) {
        this.isnull = 2;
      }
    },
    // 传值后台进行删除
    delshopcart(data) {
      // console.log(data);
      this.$axios
        .post(`shop/delshopcart`, {
          id: data
        })
        .then(res => {
          console.log(res);
        })
        .catch(console.log);
    },
    // 求商品价格总数函数
    allMoneys() {
      // 筛选当前数组中需要计算的商品
      let newBuy = this.options.filter(item => {
        return item.imgShow === true;
      });
      // 计算商品的总价格
      let res = newBuy.map(item => {
        return item.price * item.bynum;
      });
      // console.log(res);
      // 通过reduce 对数组进行求和
      let newsall = res.reduce((a, b) => {
        return a + b;
      });
      // 赋值
      this.allMoney = newsall;
      // console.log(newsall);
    },
    // --商品购买数量 用户触发
    substract(id) {
      let res = this.options.filter(item => {
        return item.id === id;
      });
      if (res[0].bynum == 1) {
        return;
      }
      res[0].bynum--;
      if (res.imgShow === true) {
        this.allMoneys();
      }
    },
    // ++商品购买数量 用户触发
    add(id) {
      let res = this.options.filter(item => {
        return item.id === id;
      });
      // console.log(res);
      res[0].bynum++;
      if (res.imgShow === true) {
        this.allMoneys();
      }
    },
    // 实现单选
    goShow(data, time) {
      if (time === false) {
        let res = this.options.filter(item => {
          return item.id === data;
        });
        res[0].imgShow = true;
        this.allMoney += res[0].price * res[0].bynum;
      } else if (time === true) {
        let res = this.options.filter(item => {
          return item.id === data;
        });
        res[0].imgShow = false;
        this.allMoney = this.allMoney - res[0].price * res[0].bynum;
      }
    },
    // 全选
    allShow() {
      if (this.imgShow === false) {
        this.options.forEach(item => {
          item.imgShow = true;
          this.imgShow = true;
        });
        // 当用户全选时，计算当前购物车总价格
        this.allMoneys();
      } else if (this.imgShow === true) {
        this.options.forEach(item => {
          item.imgShow = false;
          this.imgShow = false;
        });
        // 当用户取消全选时，计算当前购物车总价格为0
        this.allMoney = 0;
      }
    }
  }
};
</script>

<style scoped>
/* 大盒子 */
.tantan {
  display: flex;
  flex-flow: row wrap;
}
.buy {
  width: 100%;
  height: 100%;
  background-color: #f7f7f7;
}
/* 蓝色背景头部 */
.head {
  width: 100%;
  height: 150px;
  background-color: #9c93de;
  overflow: hidden;
  position: relative;
  color: #fff;
}
.head div {
  position: absolute;
  top: 8px;
  left: 8px;
}
.head div p {
  margin-top: 8px;
}
.head span {
  width: 40px;
  height: 40px;
  position: absolute;
  top: 8px;
  right: 8px;
}
/* 购物车详情 */
.bton {
  position: relative;
}
.subject {
  position: absolute;
  top: 75px;
  margin-bottom: 140px;
}
.subject li {
  width: 90%;
  height: 140px;
  margin: 20px auto;
  border-radius: 15px;
  background-color: #fff;
  overflow: hidden;
}
/* 标题 */
.title {
  align-items: center;
  font-size: 12px;
  margin: 8px 0 8px 8px;
}
/* 按钮样式 */
.garden {
  width: 20px;
  height: 20px;
  border: 1px solid #e0e0e0;
  border-radius: 100%;
}
.garden img {
  width: 100%;
  height: 100%;
}
.title span {
  margin-left: 8px;
}
/* 详情 */
.details {
  justify-content: center;
}
.details img {
  width: 80px;
  height: 80px;
}
.tmp p {
  font-size: 13px;
  color: #888888;
}
.sale {
  justify-content: space-between;
  margin-top: 25px;
}
.sale p {
  color: red;
  font-size: 18px;
}
/* 商品数量加减 */
.number-li span {
  display: inline-block;
  width: 28px;
  height: 20px;
  line-height: 20px;
  text-align: center;
  border: 1px solid silver;
}
/* 结算 */
.account {
  align-items: center;
  justify-content: space-between;
  width: 100%;
  height: 65px;
  background-color: #fff;
  position: fixed;
  bottom: 58px;
}
.account .num {
  margin-left: 12px;
}
.account .num span {
  margin-left: 8px;
}
.account .bom {
  align-items: center;
}
.account .bom p {
  color: red;
}
.account .bom div {
  margin: 0 8px 0 8px;
  width: 75px;
  height: 40px;
  color: #fff;
  border-radius: 10px;
  background-color: red;
  text-align: center;
  line-height: 40px;
}
/* 购物车为空时的样式 */
.cartnull {
  margin-top: 15px;
  text-align: center;
}
.cartnull img {
  width: 110px;
  height: 110px;
}
.cartnull p {
  color: silver;
  margin-top: 10px;
}
</style>
