// 引入模块
const express = require('express');
const routers = express.Router();


// 引入连接数据库公共类
const db = require('../mysql/index.js');

// 登录
routers.post('/', (req, res) => {
    console.log(req.body)
    
    // 获取用户表
    db.q(`select * from admin`, [''], function (err, results) {
        if (err) throw err;
        let result = {}
        results.forEach(item => {
            if (item.phone === req.body.phone && item.pass === req.body.pass) {
                result = item
            } 
        });

        res.send(result);
    })

})
// // 注册
// routers.post('/register', (req, res) => {
//     console.log(req.body)
//     let time = new Date;
//     db.q(`insert into admin (name,pass,addtime,phone) values (?,?,?,?)`, [req.body.nickname, req.body.pass, time, req.body.phone], function (err, results) {
//         if (err) throw err;
//         // 如果受影响的行 等于0 返回400
//         if (results.affectedRows == 0) {
//             res.send(400);
//         } else {
//             res.send(200);
//         }
//     })

// })

module.exports = routers;