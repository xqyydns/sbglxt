<template>   <!-- 设备修理页面 -->
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 150px" placeholder="请输入设备名" suffix-icon="el-icon-search" v-model="devicename"></el-input>
      <el-input style="width: 150px; margin-left: 5px" placeholder="请输入类别" suffix-icon="el-icon-full-screen" v-model="type"></el-input>
      <el-date-picker
          style="width: 350px; margin-left: 5px"
          placeholder="请选择时间段"
          v-model="dateRange"
          type="daterange"
          align="right"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
      ></el-date-picker>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" v-if="user.role === 'ROLE_ADMIN'" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>

      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>
      <!-- <el-upload action="http://localhost:9090/goods/import" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">
        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>
      </el-upload>
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button> -->
    </div>
<!--  列表项  -->
    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column prop="id" label="ID" sortable width="100px"></el-table-column>
      <el-table-column prop="type" label="类别" width="150px"></el-table-column>
      <el-table-column prop="devicename" label="设备名" width="200px"></el-table-column>
      <el-table-column prop="fixdate" label="修理日期" width="200px"></el-table-column>
      <el-table-column prop="money" label="修理费用" width="150px"></el-table-column>
      <el-table-column prop="uniquecode" label="标准码" width="247px"></el-table-column>
      <el-table-column prop="responsib" label="责任人" width="200"></el-table-column>
    </el-table>
<!--   目录设置  -->
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

<!--  创建的页面  -->
    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="30%" :close-on-click-modal="false">
      <el-form label-width="100px" size="small" style="width: 90%">
        <el-form-item label="编号">
          <el-input v-model="form.id" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="类别">
          <el-input v-model="form.type" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="设备名">
          <el-input v-model="form.devicename" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="标准码">
          <el-input v-model="form.uniquecode" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="修理日期">
          <el-input v-model="form.fixdate" autocomplete="off"  type="date"></el-input>
        </el-form-item>
        <el-form-item label="修理费用">
          <el-input v-model="form.money" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="责任人">
          <el-input v-model="form.responsib" autocomplete="off"></el-input>
        </el-form-item>


        <!--        <el-form-item label="所属人">-->
        <!--          <el-input v-model="form.user" autocomplete="off"></el-input>-->
        <!--        </el-form-item>-->
<!--        <el-form-item label="物品图片">
          <el-upload action="http://192.168.51.50:9090/file/upload" ref="img" :on-success="handleImgUploadSuccess">
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
        </el-form-item>-->
        <!--        <el-form-item label="报修时间">-->
        <!--          <el-date-picker v-model="form.time" type="datetime" value-format="yyyy-MM-dd HH:mm:ss" placeholder="选择日期时间"></el-date-picker>-->
        <!--        </el-form-item>-->
<!--                <el-form-item label="报修状态">-->
<!--                  <el-input v-model="form.state" autocomplete="off"></el-input>-->
<!--                </el-form-item>-->

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {serverIp} from "../../public/config";
export default {
  name: "Repair",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      devicename: "",
      id: "",
      uniquecode: "",
      fixdate: "",
      time: "",
      dateRange: [],
      money: "",
      responsib: "",
      type: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.load()
  },
  methods: {
    changeState(row, state) {
      this.form = JSON.parse(JSON.stringify(row))
      this.form.state = state;
      this.save();
    },
    load() {
      const [startTime, endTime] = this.dateRange; // 获取选择的开始日期和结束日期
      this.request.get("/repair/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          type: this.type,
          devicename: this.devicename,
          startTime: startTime,
          endTime: endTime,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    save() {
      this.request.post("/repair", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
      this.$nextTick(() => {
        if(this.$refs.img) {
          this.$refs.img.clearFiles();
        }
        if(this.$refs.file) {
          this.$refs.file.clearFiles();
        }
      })
    },

    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    reset() {
      this.type = ""
      this.devicename = ""
      this.dateRange= []
      this.load()
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    handleFileUploadSuccess(res) {
      this.form.file = res
    },
    handleImgUploadSuccess(res) {
      this.form.img = res
    },
    download(url) {
      window.open(url)
    },
    exp() {
      window.open(`http://${serverIp}:9090/repair/export`)
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    }
  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}

</style>
