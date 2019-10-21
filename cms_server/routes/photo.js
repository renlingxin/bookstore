const express = require('express');


// 引入连接数据库公共类
const db = require('../mysql/index.js');

let routers = express.Router();

// 头部导航（分类）
routers.get('/getcategory', (req, res) => {
    // 显示所有的数据
    db.q(`select * from photocategory`, [''], function (err, results) {
        if (err) throw err;
        res.send(results);
    })
})
// 图片
routers.get('/getimages:categoryId', (req, res) => {
    // 显示所有的数据
    db.q(`select * from photoimage`, [''], function (err, results) {
        if (err) throw err;
        let {
            categoryId
        } = req.params;
        let data = results.filter(item => {
            return item.categoryId == categoryId;
        });

        res.send(data);
    })

})
// 图片详情
routers.get('/getimageInfo:pid', (req, res) => {
    // 显示所有的数据
    db.q(`select * from photoinfo`, [''], function (err, results) {
        if (err) throw err;
        let {
            pid
        } = req.params;
      
        let result = {};
        results.forEach(item => {
            if (item.id == pid) {
                result = item;
            }
        });
     
        res.send(result);
    })
})
// 缩略图
routers.get('/getthumimages:pid', (req, res) => {
    // 显示所有的数据
    db.q(`select * from photothum`, [''], function (err, results) {
        if (err) throw err;
        let {
            pid
        } = req.params;
        let data = results.filter(item => {
            return item.id == pid;
        });
        res.send(data);
    })

})
// 作者
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
// 获取图文评论
routers.get('/postcomment:cid', (req, res) => {
    db.q(`select * from photocomment`, [''], function (err, results) {
        if (err) throw err;
        let {
            cid
        } = req.params;
        // console.log(cid);
        let result = results.filter(item => {
            return item.cid == cid
        });
        res.send(result);
    })
})
// 写入评论
routers.post('/postcomment:cid', (req, res) => {
    let {
        cid
    } = req.params;
    let data = req.body;
    let time = new Date;
    // 插入数据 
    db.q(`insert into photocomment (cid,user_name,add_time,content) values (?,?,?,?)`, [cid, '匿名用户', time, data.content], function (err, results) {
        if (err) throw err;
        // 如果受影响的行 等于0 返回400
        if (results.affectedRows == 0) {
            res.send(400);
        } else {
            res.send(200);
        }
    })
})

// 导出
module.exports = routers;