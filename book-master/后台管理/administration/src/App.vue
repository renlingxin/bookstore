<template>
  <div id="app">
    <!-- 头部 -->
    <div class="head tantan">
      <!-- 标题 -->
      <div class="title">{{$t('m.title')}}</div>
      <!-- 设置 -->
      <div class="setup tantan">
        <i class="el-icon-edit" @click="jump"></i>
        <i class="el-icon-share" @click="jump"></i>
        <i class="el-icon-circle-close" @click="removle"></i>

        <!-- 语言 -->
        <el-dropdown>
          <span class="el-dropdown-link">
            {{$t('m.lange')}}
            <i class="el-icon-arrow-down el-icon--right"></i>
          </span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item class="imge">
              <img src="../static/img/国旗.png" alt @click="lange('zh')" />
            </el-dropdown-item>
            <el-dropdown-item>
              <img src="../static/img/国旗-英国.png" alt @click="lange('en')" />
            </el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
        <!-- 头像 -->
        <el-avatar src="https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png"></el-avatar>
      </div>
    </div>
    <!-- 导航栏 -->
    <el-container width="200px" style="height: 600px; border: 1px solid #eee">
      <!-- 导航 -->
      <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
        <!-- 首页 -->
        <router-link :to="{name:'index'}">
          <div class="index">
            <img src="../static/img/首页.png" alt />
            <span>{{$t('m.index')}}</span>
          </div>
        </router-link>
        <el-menu :default-openeds="['1', '3']">
          <!-- 管理员 -->
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-message"></i>
              {{$t('m.admin')}}
            </template>
            <el-menu-item-group>
              <router-link :to="{name:'adminlist'}">
                <el-menu-item index="1-1">管理员列表</el-menu-item>
              </router-link>
              <router-link :to="{name:'addmin'}">
                <el-menu-item index="1-2">添加管理员</el-menu-item>
              </router-link>
            </el-menu-item-group>
          </el-submenu>
          <!-- 用户管理 -->
          <el-submenu index="2">
            <template slot="title">
              <i class="el-icon-message"></i>
              {{$t('m.user')}}
            </template>
            <el-menu-item-group>
              <router-link :to="{name:'userlist'}">
                <el-menu-item index="2-1">用户列表</el-menu-item>
              </router-link>
              <router-link :to="{name:'adduser'}">
                <el-menu-item index="2-2">添加用户</el-menu-item>
              </router-link>
            </el-menu-item-group>
          </el-submenu>
          <!-- 书文管理 -->
          <el-submenu index="3">
            <template slot="title">
              <i class="el-icon-menu"></i>
              {{$t('m.book')}}
            </template>
            <el-menu-item-group>
              <template slot="title">书文列表</template>
              <router-link :to="{name:'booklist'}">
                <el-menu-item index="3-1">书文列表</el-menu-item>
              </router-link>
              <router-link :to="{name:'addbook'}">
                <el-menu-item index="3-2">添加书文列表</el-menu-item>
              </router-link>
              <el-menu-item-group title="分组2">
                <template slot="title">书文详情</template>
                <router-link :to="{name:'addbook'}">
                  <el-menu-item index="3-3">书文详情</el-menu-item>
                </router-link>
              </el-menu-item-group>
            </el-menu-item-group>
          </el-submenu>
          <!-- 图文分享 -->
          <el-submenu index="4">
            <template slot="title">
              <i class="el-icon-setting"></i>
              {{$t('m.img')}}
            </template>
            <el-menu-item-group>
              <router-link :to="{name:'imglist'}">
                <el-menu-item index="4-2">图文列表</el-menu-item>
              </router-link>
              <router-link :to="{name:'addimg'}">
                <el-menu-item index="4-3">添加分享</el-menu-item>
              </router-link>
            </el-menu-item-group>
          </el-submenu>
          <!-- 作者管理 -->
          <el-submenu index="5">
            <template slot="title">
              <i class="el-icon-setting"></i>
              {{$t('m.author')}}
            </template>
            <el-menu-item-group>
              <router-link :to="{name:'authorlist'}">
                <el-menu-item index="5-1">作者列表</el-menu-item>
              </router-link>
              <router-link :to="{name:'addor'}">
                <el-menu-item index="5-2">添加作者</el-menu-item>
              </router-link>
            </el-menu-item-group>
          </el-submenu>
          <!-- 商品管理 -->
          <el-submenu index="6">
            <template slot="title">
              <i class="el-icon-setting"></i>
              {{$t('m.shop')}}
            </template>
            <el-menu-item-group>
              <router-link :to="{name:'shoplist'}">
                <el-menu-item index="6-1">商品列表</el-menu-item>
              </router-link>
              <router-link :to="{name:'addshop'}">
                <el-menu-item index="6-2">添加商品</el-menu-item>
              </router-link>
            </el-menu-item-group>
          </el-submenu>
          <!-- 分类管理 -->
          <el-submenu index="7">
            <template slot="title">
              <i class="el-icon-setting"></i>
              {{$t('m.type')}}
            </template>
            <el-menu-item-group>
              <router-link :to="{name:'typelist'}">
                <el-menu-item index="7-1">分类列表</el-menu-item>
              </router-link>
              <router-link :to="{name:'addtype'}">
                <el-menu-item index="7-2">添加分类</el-menu-item>
              </router-link>
            </el-menu-item-group>
          </el-submenu>
          <el-submenu index="8">
            <template slot="title">
              <i class="el-icon-setting"></i>
              {{$t('m.think')}}
            </template>
            <el-menu-item-group>
              <router-link :to="{name:'adive'}">
                <el-menu-item index="7-1">使用说明</el-menu-item>
              </router-link>
            </el-menu-item-group>
          </el-submenu>
        </el-menu>
      </el-aside>

      <!-- 内容 -->
      <el-container>
        <router-view />
      </el-container>
    </el-container>
  </div>
</template>

<style>
/* 头部 */
.head {
  width: 100%;
  height: 50px;
  background-color: #333;
  color: #fff;
  overflow: hidden;
  justify-content: space-between;
}
/* 标题 */
.title {
  width: 200px;
  height: 50px;
  text-align: center;
  line-height: 50px;
  font-size: 18px;
}
/* 设置+头像 */
.setup {
  width: 300px;
  height: 50px;
  justify-content: space-between;
  align-items: center;
  margin-right: 20px;
}
/* 语言 */
.el-dropdown {
  color: #fff;
  margin-left: 10px;
}
.imge img{
  width: 27px;
  height: 17px;
}
.setup i {
  margin-left: 8px;
  cursor: pointer;
}
/* 控制滚动条隐藏 */
/* ::-webkit-scrollbar {
   overflow-x:hidden;
} */

/* 左侧导航 */
.index {
  width: 100%;
  height: 50px;
  line-height: 50px;
  background-color: #fff;
  border-bottom: 1px solid silver;
  font-size: 15px;
}
.index img {
  width: 17px;
  height: 17px;
  margin-left: 25px;
  margin-right: 5px;
}
.el-header {
  background-color: #b3c0d1;
  color: #333;
  line-height: 60px;
}

.el-aside {
  color: #333;
}
</style>

<script>
export default {
  name: "App",
  data() {
    const item = {
      date: "2016-05-02",
      name: "王小虎",
      address: "上海市普陀区金沙江路 1518 弄"
    };
    return {
      tableData: Array(20).fill(item)
    };
  },
  methods: {
    jump() {
      this.$notify({
        title: "提示",
        message: "这是一个还没有实现的功能",
        type: "warning"
      });
    },
    // 退出登录
    removle() {
      if (localStorage.getItem("admin")) {
        localStorage.removeItem("admin");
        this.$notify({
          title: "成功",
          message: "退出成功",
          type: "success"
        });
        this.$router.push({
          name: "login"
        });
      } else {
        this.$notify({
          title: "提示",
          message: "您还没有登录",
          type: "warning"
        });
      }
    },
    // 切换语言
    lange(type) {
      console.log(type);
      this.$i18n.locale = type;
    }
  }
};
</script>