<template>   <!-- 设备报修 改为 申请增添 -->
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 150px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="devicename"></el-input>
      <el-input style="width: 150px; margin-left: 5px" placeholder="请输入类别" suffix-icon="el-icon-full-screen" v-model="type"></el-input>
      <el-input style="width: 150px; margin-left: 5px" placeholder="请输入标准码" suffix-icon="el-icon-key" v-model="uniquecode"></el-input>
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
<!--      <el-date-picker
          style="width: 150px; margin-left: 10px"
          placeholder="开始日期"
          v-model="startTime"
          type="date"
          value-format="yyyy-MM-dd"
      ></el-date-picker>
      <el-date-picker
          style="width: 150px; margin-left: 5px"
          placeholder="结束日期"
          v-model="endTime"
          type="date"
          value-format="yyyy-MM-dd"
      ></el-date-picker>-->
      <!--      <el-input style="width: 200px" placeholder="请输入" suffix-icon="el-icon-message" class="ml-5" v-model="email"></el-input>-->
      <!--      <el-input style="width: 200px" placeholder="请输入" suffix-icon="el-icon-position" class="ml-5" v-model="address"></el-input>-->
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>

    </div>

    <div style="margin: 10px 0">
      <el-button type="primary"  v-if="user.role === 'ROLE_TEACHER'||user.role === 'ROLE_STUDENT'" @click="handleAdd">创建申请表 <i class="el-icon-circle-plus-outline"></i></el-button>
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>

      <!-- <el-upload action="http://localhost:9090/goods/import" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">
        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>
      </el-upload>
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button> -->
    </div>
<!--  列表项  -->
    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column prop="id" label="ID" width="40" sortable></el-table-column>
      <el-table-column type="selection" width="45"></el-table-column>
      <el-table-column prop="type"  label="类型" width="100" ></el-table-column>
      <el-table-column prop="devicename" label="设备名"></el-table-column>
      <el-table-column prop="model" label="型号"></el-table-column>

      <el-table-column prop="oneprice" label="单价" width="60"></el-table-column>
      <el-table-column prop="quantity" label="数量" width="50"></el-table-column>

      <el-table-column prop="expirationdate" label="保修期"></el-table-column>
      <el-table-column prop="user" width="80" label="负责人"></el-table-column>
      <el-table-column label="图片" width="110px"><template slot-scope="scope"><el-image style="width: 100px; height: 100px" :src="scope.row.img" :preview-src-list="[scope.row.img]"></el-image></template></el-table-column>


      <el-table-column prop="time" label="申请时间"  width="150"
      ></el-table-column>
      <el-table-column prop="state" label="申请状态"></el-table-column>
      <el-table-column  label="审核" v-if="user.role === 'ROLE_ADMIN'"  width="240">
        <template v-slot="scope">
          <el-button type="success" @click="addDevice(scope.row, '审核通过')" :disabled="scope.row.state !== '待审核'">审核通过</el-button>
          <el-button type="danger" @click="changeState(scope.row, '审核不通过')" :disabled="scope.row.state !== '待审核'">审核不通过</el-button>
        </template>
      </el-table-column>

      <el-table-column label="操作" v-if="user.role === 'ROLE_STUDENT'" width="100" align="center">
        <template v-slot="scope">
<!--          <div>-->
<!--            <AnotherComponent ref="anotherComponentRef" />-->
<!--            <el-button type="primary" @click="callAnotherComponentMethod" :disabled="scope.row.state === '审核通过'">新增 <i class="el-icon-edit"></i></el-button>-->
<!--          </div>-->

          <el-button type="success" :disabled=" scope.row.state!=='待审核' || scope.row.user !== user.username" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
<!--          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>-->
        </template>
      </el-table-column>

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

        <el-form-item label="类型">
          <el-input v-model="form.type" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="设备名">
          <el-input v-model="form.devicename" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="型号">
          <el-input v-model="form.model" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="单价">
          <el-input v-model="form.oneprice" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="form.quantity" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="保修期">
          <el-input v-model="form.expirationdate" autocomplete="off"></el-input>
        </el-form-item>
        <!--        <el-form-item label="所属人">-->
        <!--          <el-input v-model="form.user" autocomplete="off"></el-input>-->
        <!--        </el-form-item>-->
        <el-form-item label="物品图片">   <!-- TODO -->
          <el-upload action="http://localhost:9090/file/upload" ref="img" :on-success="handleImgUploadSuccess">
            <el-button size="small" type="primary">点击上传</el-button>
          </el-upload>
        </el-form-item>
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
// import AnotherComponent from './Device';
export default {
  name: "Apply",
/*  components:{
    AnotherComponent
  },*/
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 10,
      type: "",
      devicename: "",
      model: "",
      time: '',
      age: "",
      dateRange:[],
      size: "",
      oneprice: "",
      quantity: "",
      expirationdate: "",
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
    getTimeColumnWidth() {
      if (user.role === 'ROLE_ADMIN') {
        return '100px';
      } else
      {
        return '150px';
      }
    },
    changeState(row, state) {
      this.form = JSON.parse(JSON.stringify(row))
      this.form.state = state;
      this.save();
    },
    addDevice(row, state) {
      this.form = JSON.parse(JSON.stringify(row))
      this.form.state = state;
      this.request.post("/apply/pass",this.form).then(
          res=>{

          }
      )
      this.save();
    },
    load() {
      const [startTime, endTime] = this.dateRange; // 获取选择的开始日期和结束日期
      this.request.get("/apply/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          devicename: this.devicename,
          type: this.type,
          startTime: startTime,
          endTime: endTime,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })
    },
    // callAnotherComponentMethod() {
    //   // 调用另一个组件的方法
    //   this.$refs.anotherComponentRef.load = () => {};
    //
    // },
    save() {
      this.request.post("/apply", this.form).then(res => {
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
      this.devicename = ""
      this.type = ""
      this.dateRange = []
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
      window.open(`http://${serverIp}:9090/apply/export`)
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
      this.load()
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    del(id) {
      this.request.delete("/apply/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    }


  }

}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
