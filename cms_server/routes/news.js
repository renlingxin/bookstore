const express = require('express');

// 引入连接数据库公共类
const db = require('../mysql/index.js');

// 1 获取路由中间件对象 
let routers = express.Router();

// 书文列表
routers.get('/', (req, res) => {
    // 显示所有的数据
    db.q(`select * from newslist`, [''], function (err, results) {
        if (err) throw err;
        res.send(results);
    })
}) 
// 书文详情
routers.get('/getnew:id', (req, res) => {

    // 显示所有的数据
    db.q(`select * from newsdetail`, [''], function (err, results) {
        if (err) throw err;
        let {
            id
        } = req.params;
        let result = {};
        results.forEach(item => {
            if (item.id == id) {
                result = item;
            }
        });
        res.send(result);
        // console.log(result);
    })
})
// 书文作者
routers.get('/getauthor:authorID', (req, res) => {
    // 显示所有的数据
    db.q(`select * from author`, [''], function (err, results) {
        if (err) throw err;
        let {
            authorID
        } = req.params;
        let result = {};
        results.forEach(item => {
            if (item.authorID === authorID) {
                result = item;
            }
        });
        res.send(result);
    })

})
//module.exports 对象是由模块系统创建的
// module.exports用来导出一个Node.js模块内的对象，调用者使用require加载模块时，就会获得导出的对象的实例
module.exports = routers;