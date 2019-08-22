// 引入模块
const express = require('express');
const routers = express.Router();


// 引入连接数据库公共类
const db = require('../mysql/index.js');
// 分类导航
routers.get('/list', (req, res) => {

    db.q(`select * from typelist`, [''], function (err, results) {
        if (err) throw err;

        res.send(results)
    })

})
// 分类详情
routers.get('/right', (req, res) => {

    db.q(`select * from typeright`, [''], function (err, results) {
        if (err) throw err;

        res.send(results)
    })

})
// 分类搜索
routers.post('/find', (req, res) => {

    db.q(`select * from shoplist`, [''], function (err, results) {
        if (err) throw err;
        let {
            name
        } = req.body;
        // 存储的是商品id  有一项与用户的输入 就存一次商品id
        let _arr = []
        results.forEach(item => {
            let tit = item.title.split('')
            for (var s in name) {
                for (var x in tit) {
                    if (name[s] == tit[x]) {
                        _arr.push(item.id);
                    }
                }
            }
        });
        console.log(_arr)
        // 对比 得到的搜索内容重复数组 和 商品信息数组 相似内容大于一定数量得出对应商品id
        var _res = [];
        _arr.sort();
        for (var i = 0; i < _arr.length;) {
            var count = 0;
            for (var j = i; j < _arr.length; j++) {
                if (_arr[i] == _arr[j]) {
                    count++;
                }
            }
            _res.push([_arr[i], count]);
            i += count;
        }
        //_newArr 二维数维中保存了 值和值的重复数  
        var _newArr = [];
        for (var i = 0; i < _res.length; i++) {
            if (_res[i][1] >= 3) {
                _newArr.push(_res[i][0]);
            }

        }
        // 根据获取的id返回客户端商品信息
        let result = [];
        for (var item of _newArr) {
            results.forEach(element => {
                if (element.id === item) {
                    result.push(element)
                }
            });
        }

        // console.log(result)
        res.send(result)
    })

})

module.exports = routers;