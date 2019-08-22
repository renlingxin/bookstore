var mysql = require('mysql');
var pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'bookstore'
});


var db = {};

db.q = function (sql, params, callback) {
    // 取出连接
    pool.getConnection(function (err, connection) {
        if (err) {
            callbackify(err, null);
            return;
        } // not connected!

        connection.query(sql, params, function (error, results, fields) {
            console.log(`${params}`);
            // console.log(`${sql}=>${params}`);
            // 释放连接
            connection.release();
            callback(error, results) //error是否为空由数据库查询结果决定

        });
    });
   
}
// 导出对象
module.exports = db;


// pool.query('select * from user where id =?',['1'], function (error, results, fields) {
//     if (error) throw error;
//     console.log(results);
//     console.log(fields);
//   });


// mysql -u root -p    进入数据库
// flush privileges    刷新数据库
// use dbname;         打开数据库
// show databases;     显示所有数据库
// use xxx;            进入xxx数据库
// show tables;        显示数据库中的所有的表
// describe user;      显示数据库中user表的列信息


/*
增删改查 ，results 对象中都有发生行为的信息
查询操作对象就是一个数组
OkPacket {
  fieldCount: 0,
  affectedRows: 1,  受影响的行
  insertId: 11,     插入id
  serverStatus: 2,  服务器状态
  warningCount: 0,
  message: '',      消息
  protocol41: true, 协议41
  changedRows: 0 }  变化行
*/ 
