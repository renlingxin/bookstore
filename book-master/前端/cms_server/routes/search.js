const express = require('express');


// 引入连接数据库公共类
const db = require('../mysql/index.js');

let routers = express.Router();

// 我的-关注
routers.post('/getmyfollow', (req, res) => {
    // 显示所有的数据
    db.q(`select * from author`, [''], function (err, results) {
        if (err) throw err;
        // console.log(req.body)
        if (req.body.myFollow === null) {
            res.send('缺少参数');
        } else {
            // 接收传来的作者作品id
            let data = req.body.myFollow;
            // 筛选数据
            let result = [];
            for (var item of data) {
                results.forEach(element => {
                    if (element.authorID === item) {
                        result.push(element)
                    }
                });
            }
            res.send(result);
        }
    })
})

// 我的-收藏
routers.post('/getmycollect', (req, res) => {
    // 显示所有的数据
    db.q(`select * from newslist`, [''], function (err, results) {
        if (err) throw err;
        // console.log(req.body)
        if (req.body.mycollect === null) {
            res.send('缺少参数');
        } else {
            // 接收传来的书文作品id
            let data = req.body.mycollect;
            // 筛选数据
            let result = [];
            for (var item of data) {
                results.forEach(element => {
                    // 添加当前时间
                    element.time = new Date;
                    if (element.id === item) {
                        result.push(element)
                    }
                });
            }
            res.send(result);
        }
    })
})

// 导出
module.exports = routers;