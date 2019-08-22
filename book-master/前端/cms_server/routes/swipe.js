const express = require('express');

// 引入连接数据库公共类
const db = require('../mysql/index.js');

// 1 获取路由中间件对象 
let routers = express.Router();

// 2 配置路由规则  router.请求方式（url,fn）
routers.get('/', (req, res) => {
    // 显示所有的数据
    db.q(`select * from swipe`, [''], function (err, results) {
        if (err) throw err;
        res.send(results);
        // console.log(results);
    })
})
// module.exports用来导出一个Node.js模块内的对象，调用者使用require加载模块时，就会获得导出的对象的实例
module.exports = routers;