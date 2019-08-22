// 引入模块
const express = require('express');
const routers = express.Router();


// 引入连接数据库公共类
const db = require('../mysql/index.js');

// 查询数据
routers.get('/', (req, res) => {
    // 获取用户表
    db.q(`select * from photoimage`, [''], function (err, results) {
        if (err) throw err;
        res.send(results);
    })

})

// 删除数据
routers.get('/del', (req, res) => {
    console.log(req.query.id)
    db.q(`delete from photoimage where id = ? `, [req.query.id], function (err, results) {
        if (err) throw err;
        if (results.affectedRows == 0) {
            console.log('删除失败')
        } else {
            console.log('删除成功')
        }
    })
    res.send(200)
})
// 修改数据
routers.post('/make', (req, res) => {
    let datas = req.body
    console.log(datas)
    // let time = new Date;
    db.q(`update photoimage set title = ?, zhaiyao = ? ,img_url = ? ,authorID = ? where id = ? `, [datas.title, datas.zhaiyao, datas.img_url, datas.authorID,datas.id], function (err, results) {
        if (err) throw err;
        if (results.affectedRows == 0) {
            console.log('修改失败')
        } else {
            console.log('修改成功')
        }
    })
    res.send(200)
})

// 添加图文列表s
routers.post('/add', (req, res) => { 
    console.log(req.body)
    let time = new Date;
    db.q(`insert into photoimage (title,categoryId,authorID,img_url,zhaiyao) values (?,?,?,?,?)`, [req.body.title, req.body.categoryId, req.body.authorID, req.body.img, req.body.zhaiyao], function (err, results) {
        if (err) throw err;
        // 如果受影响的行 等于0 返回400
        if (results.affectedRows == 0) {
            res.send(400);
        } else {
            res.send(200);
        }
    })

})
module.exports = routers;