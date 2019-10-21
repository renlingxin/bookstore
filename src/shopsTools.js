// 将商品数量和内容存入内存中 
let obj = {

    // 关注作者 
    myshows:[],
    // 收藏书文
    likebooks:[],


   
    // 添加关注
    addfollow({id,author}){
        // 如果存储的myfollow已经存在  就赋值给当前的myfollow数组
        if(localStorage.getItem("myFollow")){
            this.myshows = JSON.parse(localStorage.getItem("myFollow"))
            // console.log(this.likebooks)
        }

        this.myshows.push(author);
        // 数组去重
        let myFollows = Array.from(new Set(this.myshows));
        // console.log(myFollows)
        // 存入数据到当前 localStorage
        let data = JSON.stringify(myFollows);
        localStorage.setItem("myFollow", data);
    },

    // 添加收藏

    addlikebook(id){
        // 如果存储的likebooks已经存在  就赋值给当前的likebooks数组
        if(localStorage.getItem("likebooks")){
            this.likebooks = JSON.parse(localStorage.getItem("likebooks"))
            // console.log(this.likebooks)
        }

        this.likebooks.push(id.id);
        // 数组去重
        let mylike = Array.from(new Set(this.likebooks));
        // console.log(mylike)
        // 存入数据到当前 localStorage
        let data = JSON.stringify(mylike);
        localStorage.setItem("likebooks", data);
    }


    
}
// 挂载到window属性中
window.test = obj;
export default obj;