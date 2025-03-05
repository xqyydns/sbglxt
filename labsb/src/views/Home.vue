<template>
  <!-- 主页 -->
  <div>
    <el-row :gutter="20" style="margin-bottom: 20px">
      <el-col :xs="24" :sm="12" :md="6" :lg="6" :xl="6">
        <el-card class="card" style="background: linear-gradient(135deg, #409EFF, #66b1ff);">
          <div class="card-header">
            <i class="el-icon-user-solid" /> 管理者人数
          </div>
          <div class="card-content">
            4
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6" :lg="6" :xl="6">
        <el-card class="card" style="background: linear-gradient(135deg, #F56C6C, #f78989);">
          <div class="card-header">
            <i class="el-icon-money" /> 设备总价
          </div>
          <div class="card-content">
            ￥ 30000
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6" :lg="6" :xl="6">
        <el-card class="card" style="background: linear-gradient(135deg, #67C23A, #85ce61);">
          <div class="card-header">
            <i class="el-icon-bank-card" /> 仪器总数
          </div>
          <div class="card-content">
            100
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6" :lg="6" :xl="6">
        <el-card class="card" style="background: linear-gradient(135deg, #E6A23C, #ebb563);">
          <div class="card-header">
            <i class="el-icon-s-shop" /> 实验室总数
          </div>
          <div class="card-content">
            10
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row>
      <el-col :span="12">
        <el-card shadow="always">
          <div id="main" style="width: 500px; height: 400px">
            <img
                style="width: 100%; height: 100%; object-fit: cover"
                src="../assets/wulilab.jpg"
                alt="Pie Image"
            />
          </div>
        </el-card>
      </el-col>

      <el-col :span="12">
        <el-card shadow="always">
          <div id="pie"  style="width: 500px; height: 400px">
              <img
                  style="width: 100%; height: 100%; object-fit: cover"
                  src="../assets/huaxuelab.jpg"
                  alt="Pie Image"
              />
            </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>


<style scoped>
.card {
  color: white;
  border: none;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card-header {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 10px;
}

.card-content {
  font-size: 24px;
  font-weight: bold;
  text-align: center;
  padding: 20px 0;
}

.el-col {
  margin-bottom: 20px;
}
</style>

<script>
import * as echarts from 'echarts'
import request from "@/utils/request";

export default {
  name: "Home",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      name: "",
      form: {},
      dialogFormVisible: false,
      dialogFormVisible1: false,
      content: '',
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      lineBox:null,
    }
  },
  mounted() {  // 页面元素渲染之后再触发

    // 饼图





  },
  created() {
    this.load()
  },
methods:{
  load() {
    this.request.get("/notice/page", {
      params: {
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        name: this.name,
        type: 2
      }
    }).then(res => {
      this.tableData = res.data.records
      this.total = res.data.total
    })
  },
}

}
</script>

<style scoped >


</style>
