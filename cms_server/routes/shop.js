// 引入模块
const express = require('express');
const routers = express.Router();


// 引入连接数据库公共类
const db = require('../mysql/index.js');


// 商品介绍
routers.get('/getcommodity', (req, res) => {

    db.q(`select * from shoplist`, [''], function (err, results) {
        if (err) throw err;
        let {
            pageindex
        } = req.query;
        let data = [];
        results.forEach(item => {
            if (item.page == pageindex) {
                data.push(item);
            }
        })
        // console.log(data)
        res.send(data)
    })

})
// 商品详情
routers.get('/getshopinfo', (req, res) => {
    db.q(`select * from shopinfo`, [''], function (err, results) {
        if (err) throw err;
        let {
            shopsId
        } = req.query;
        let data = {};
        results.forEach(item => {
            if (item.id == shopsId) {
                data = item;
            }
        })
        res.send(data)
    })
})
// 商品详情-轮播图
routers.get('/getshopswipe', (req, res) => {

    db.q(`select * from shopswipe`, [''], function (err, results) {
        if (err) throw err;
        let {
            shopsId
        } = req.query;
        let data = [];
        results.forEach(item => {
            if (item.id == shopsId) {
                data.push(item);
            }
        })
        res.send(data)
    })
})
//加入购物车
routers.post('/addshopcart', (req, res) => {
    let shopcart = {} 
    let bynum = req.body.num
    let id = req.body.id
    // 获取商品详细信息
    db.q(`select * from shopinfo`, [''], function (err, results) {
        if (err) throw err;
        results.forEach(item => {
            if (item.id == req.body.id) {
                shopcart = item;
            }
        })
    })
    // 获取商品列表介绍图
    db.q(`select * from shoplist`, [''], function (err, results) {
        if (err) throw err;
        results.forEach(item => {
            if (item.id == req.body.id) {
                shopcart.img = item.img_url
            }
        })
        // console.log(shopcart)
        db.q(`insert into shopcart (cid,title,price,img_url,bynum,store,pay,hade,star) values (?,?,?,?,?,?,?,?,?)`, [id, shopcart.title, shopcart.sell_price, shopcart.img, bynum, '人人书店', 0, 0, 0], function (err, results) {
            if (err) throw err;
            // 如果受影响的行 等于0 返回400
            if (results.affectedRows == 0) {
                res.send(400);
            } else {
                res.send(200);
            }
        })
    })

})
// 获取购物车数据
routers.get('/getshopcart', (req, res) => {
    // 获取购物车信息
    db.q(`select * from shopcart`, [''], function (err, results) {
        if (err) throw err;
        let data = results.filter(item => {
            return item.pay == 0
        })
        res.send(data)
    })
})
// 删除购物车数据
routers.post('/delshopcart', (req, res) => {
    // console.log(req.body.id)
    let id = req.body.id
    for (item of id) {
        db.q(`delete from shopcart where id = ? `, [item], function (err, results) {
            if (err) throw err;
            if (results.affectedRows == 0) {
                console.log('删除失败')
            } else {
                console.log('删除成功')
            }
        })
    }
    res.send(200)
})
// 修改购物车付款商品状态
routers.post('/pay', (req, res) => {

    // console.log(req.body)
    // 获取需要修改的商品id
    let id = req.body.id
    for (item of id) {
        db.q(`update shopcart set pay = ? where id = ? `, [1, item], function (err, results) {
            if (err) throw err;
            if (results.affectedRows == 0) {
                console.log('修改失败')
            } else {
                console.log('修改成功')
            }
        })
    }
    res.send(200)
})
// 修改购物车收货商品状态
routers.post('/uphade', (req, res) => {
    // 获取需要修改的商品id
    let id = req.body.id
    // console.log(id)
    db.q(`update shopcart set hade = ? where id = ? `, [1, id], function (err, results) {
        if (err) throw err;
        if (results.affectedRows == 0) {
            console.log('修改失败')
        } else {
            console.log('修改成功')
        }
    })

    res.send(200)
})
// 未付款商品信息
routers.get('/getpay', (req, res) => {
    // 获取当前购物车中全部商品
    db.q(`select * from shopcart`, [''], function (err, results) {

        let data = results.filter(item => {
            return item.pay == 0
        })
        res.send(data)
    })
})
// 未收货商品信息
routers.get('/gethade', (req, res) => {
    // 获取当前购物车中全部商品
    db.q(`select * from shopcart`, [''], function (err, results) {

        let data = results.filter(item => {
            return item.hade == 0
        })
        res.send(data)
    })
})
// 未评价商品信息
routers.get('/getstar', (req, res) => {
    // 获取当前购物车中全部商品
    db.q(`select * from shopcart`, [''], function (err, results) {

        let data = results.filter(item => {
            return item.star == 0
        })
        res.send(data)
    })
})
module.exports = routers;