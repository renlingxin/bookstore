<template>
  <div style="width: 100%">
    <el-table
      :data="tableData.slice((currentPage-1)*pageSize,currentPage*pageSize)"
      border
      style="width: 100%"
    >
      <el-table-column fixed prop="id" label="id" width="150"></el-table-column>
      <el-table-column prop="title" label="标题" width="120"></el-table-column>
      <el-table-column prop="click" label="点击数" width="120"></el-table-column>
      <el-table-column prop="add_time" label="添加时间" width="120"></el-table-column>
      <el-table-column prop="img_url" label="图片" width="120">
        <!-- 显示图片 -->
        <template slot-scope="scope">
          <img :src="scope.row.img_url" alt width="60" height="60" />
        </template>
      </el-table-column>
      <el-table-column prop="authorID" label="作者ID" width="120"></el-table-column>
      <el-table-column prop="address" label width="300"></el-table-column>
      <el-table-column prop="zip" label width="120"></el-table-column>
      <el-table-column fixed="right" label="操作" width="100">
        <template slot-scope="scope">
          <el-button @click="handleClick(scope.row)" type="text" size="small">编辑</el-button>
          <el-button type="text" size="small" @click="deletes(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页 -->
    <div class="block">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[1, 3, 5, 8]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="totalNum"
      ></el-pagination>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tableData: [],
      currentPage: 1, //默认显示第一页
      pageSize: 5, //默认每页显示10条
      totalNum: 1000 //总页数
    };
  },
  methods: {
    //   分页
    handleSizeChange(val) {
      //   console.log(`每页 ${val} 条`);
      this.pageSize = val; //动态改变
    },
    handleCurrentChange(val) {
      //   console.log(`当前页: ${val}`);
      this.currentPage = val; //动态改变
    },
    //   删除
    deletes(data) {
      // console.log(data.id);
      this.$confirm("此操作将永久删除该文件, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(() => {
          this.tableData.forEach((item, index) => {
            if (item.id === data.id) {
              this.tableData.splice(index, 1);
            }
          });
          this.$axios
            .get(`book/del?id=` + data.id)
            .then(res => {
              // console.log(res);
           
            })
            .catch(console.log);
          this.$message({
            type: "success",
            message: "删除成功!"
          });
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除"
          });
        });
    },
    //   编辑修改
    handleClick(data) {
      // console.log(data);
      this.$router.push({
        name: "upbook",
        params: { makedata: data }
      });
    }
  },
  created() {
    //   获取数据
    this.$axios
      .get(`book`)
      .then(res => {
        console.log(res);
        this.tableData = res.data;
        // 赋值总条数
        this.totalNum = this.tableData.length;
      })
      .catch(console.log);
  }
};
</script>

<style>
</style>
