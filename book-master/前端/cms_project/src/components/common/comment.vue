<template>
  <div class="coment">
    <div>
      <ul>
        <li class="photo-comment">
          <div>
            <span>写下你的评论吧~</span>
            <span>
              <a href>返回</a>
            </span>
          </div>
        </li>
        <li class="txt-comment">
          <textarea v-model="content"></textarea>
        </li>
        <li>
          <mt-button type="primary" size="large" @click="sendMsg">发表评论</mt-button>
        </li>
        <li class="photo-comment">
          <div>
            <span>评论列表</span>
            <span>{{leght}}条评论</span>
          </div>
        </li>
      </ul>
      <ul class="comment-list" v-for="(msga,index) in msga" :key="index">
        <li>
          <span style="color:cornflowerblue">{{msga.user_name}}:</span>
          <span>{{msga.content}}</span>

          <a>{{msga.add_time | relTime}}</a>
        </li>
      </ul>
    </div>
    <mt-button type="danger" size="large" @click="Loadmore">加载更多</mt-button>
  </div>
</template>

<script>
export default {
  name: "comment",
  props: ["cid"],
  data() {
    return {
      // 后台获取的评论内容
      msga: [],
      content: "", //发表的评论
      // 评论个数
      leght:0
    };
  },
  methods: {
    sendMsg() {
      // console.log(this.content);
      if (this.content === "") {
        this.$toast("请填写评论内容");
      } else {
        this.$axios
          .post(`photo/postcomment${this.cid}`, {
            content: this.content,
          })
          .then(res => {
            // 上传评论内容后 再次请求内容
           setTimeout(this.loadMsgByPage,1000)
            this.$toast("评论成功");            
          })
          .catch(console.log);
      }
    },
    //加载更多
    Loadmore() {
      this.loadMsgByPage();
    },
    // 获取后台评论内容
    loadMsgByPage() {
      this.$axios
        .get(`photo/postcomment${this.cid}`)
        .then(res => {
          // console.log(res)
          this.msga = res.data;
          this.leght = res.data.length;
        })
        .catch(console.log);
    }
  },
  created() {
    this.loadMsgByPage();
  }
};
</script>

<style scoped>
.coment {
  width: 97%;
  margin: 15px auto;
  border-top: 1px dashed #000;
}
/* 书写评论 */
.photo-comment div {
  width: 100%;
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between;
  margin: 10px 0 10px 0;
  color: crimson;
}
/* 评论内容 */
.txt-comment {
  margin: 10px 0 10px 0;
}
.txt-comment textarea {
  width: 100%;
  height: 80px;
  font-size: 18px;
  border: 1px dashed silver;
}
/* 评论列表 */
.comment-list li {
  width: 100%;
  height: 30px;
  line-height: 30px;
  border-bottom: 1px dashed silver;
  margin-bottom: 15px;
}
.comment-list li a {
  float: right;
}
</style>
