// 1: 引入express 第三方插件
const express = require('express');
const CONFIG = require('./config');

// body-parser 是express 中间件 是用来解析http请求体
const bodyParser = require('body-parser');
// 2：构建一个服务器对象
let app = express();
// 使用body-parser解析json数据   结果会放在req.body中
app.use(bodyParser.json());


// 3：开启服务器监听端口
app.listen(CONFIG.PORT,()=>{
    console.log('8888端口已经被占用')
});

//=>实现CROS跨域的中间件
app.use((req, res, next) => {
    const {CREDENTIALS, HEADERS, ALLOW_METHODS} = CONFIG.CROS;
    res.header("Access-Control-Allow-Origin", '*');
    res.header("Access-Control-Allow-Credentials", CREDENTIALS);
    res.header("Access-Control-Allow-Headers", HEADERS);
    res.header("Access-Control-Allow-Methods", ALLOW_METHODS);
    req.method === 'OPTIONS' ? res.send('CURRENT SERVICES SUPPORT CROSS DOMAIN REQUESTS!') : next();
});

// 把routers作为一个中间件，挂载到了“/swipe”路径上。

app.use('/swipe', require('./routes/swipe'));
app.use('/news', require('./routes/news'));
app.use('/photo', require('./routes/photo'));
app.use('/shop', require('./routes/shop'));
app.use('/search', require('./routes/search'));
app.use('/member', require('./routes/member'));
app.use('/feed', require('./routes/feed'));
app.use('/login', require('./routes/login'));
// app.use('/', (req,res)=>{
//     res.send('欢迎来到服务器');
// });
// app.use(router);

