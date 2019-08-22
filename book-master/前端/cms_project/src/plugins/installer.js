// vue 插件必须具备Install函数

function Installer() {
  // 自身初始化行为
}
Installer.install = function (Vue) {
  // 接收Vue的构造函数，给原型挂载属性或注册全局组件
  //   console.log(Vue);

  // 1   注册全局组件
  Vue.component('test', {
    template: `<h1>哈哈</h1>`
  })
  // 2 挂载属性
  let log = function () {
    console.log('我们自己的插件的log函数')
  }
  // 给原型定义属性的获取和设置，设置：见鬼去吧，获取就给你
  Object.defineProperty(Vue.prototype, '$log', {
    // 设置log属性的行为
    set: function (newV) {
      console.log('你做梦')
      // log = newV

    },
    get: function () {
      // 获取方式
      return log;
    }
  })


}
export default Installer;
