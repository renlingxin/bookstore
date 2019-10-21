module.exports = {
    //服务端口号
    PORT: 8888,

    //CROS跨域相关信息
    CROS: {
        ALLOW_METHODS: 'PUT,POST,GET,DELETE,OPTIONS',
        HEADERS: 'Content-Type,Content-Length,Authorization, Accept,X-Requested-With',
        CREDENTIALS: true
    },
};