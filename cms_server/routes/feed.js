const express = require('express');

// 引入连接数据库公共类
const db = require('../mysql/index.js');

// 1 获取路由中间件对象 
let routers = express.Router();

// 用户反馈
routers.post('/', (req, res) => {
    // 获取用户填写的问题类型  1 使用问题 2 交易问题
    let type = req.query.type
    // 获取用户输入的问题
    let quest =req.body.quest
    // 获取用户输入的意见以及建议
    let opinion = req.body.opinion
  
    // 插入数据
    db.q(`insert into feed (quest,opinion,type) values (?,?,?)`, [quest, opinion, type], function (err, results) {
        if (err) throw err;
        // 如果受影响的行 等于0 返回400
        if(results.affectedRows == 0){
            res.send(400); 
        }else{
            res.send(200); 
        }    
    })
})











module.exports = routers;