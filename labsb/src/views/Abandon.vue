<template>    <!-- 设备总览 -->
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 150px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="equipname"></el-input>
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
      ></el-date-picker>      <!--      <el-input style="width: 200px" placeholder="请输入" suffix-icon="el-icon-message" class="ml-5" v-model="email"></el-input>-->
      <!--      <el-input style="width: 200px" placeholder="请输入" suffix-icon="el-icon-position" class="ml-5" v-model="address"></el-input>-->
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" style="margin-left: 10px" @click="handleAdd" >新增 <i class="el-icon-circle-plus-outline"></i></el-button>

      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'" v-if="user.role === 'ROLE_ADMIN'" @selection-change="handleSelectionChange"> <!--改报废 -->
      <el-table-column prop="id" label="ID" width="80" sortable></el-table-column> <!-- 可正序降序排序 -->
      <el-table-column prop="type" label="类型" width="100"></el-table-column>
      <el-table-column prop="oneprice" label="单价" width="80"></el-table-column>
      <el-table-column prop="equipname" label="设备名" width="130"></el-table-column>
      <el-table-column prop="model" label="型号" width="160"></el-table-column>
      <el-table-column prop="num" label="数量" width="80"></el-table-column>
      <el-table-column prop="uniquecode" label="标准码" width="160"></el-table-column>
      <el-table-column prop="abandondate" label="报废日期" width="162"></el-table-column>
      <el-table-column prop="state" width="95" label="申请状态"></el-table-column>
      <el-table-column  label="审核" v-if="user.role === 'ROLE_ADMIN'"  width="240">
        <template v-slot="scope">
          <el-button type="success" @click="addDate(scope.row,'审核通过')" :disabled="scope.row.state !== '待审核'">审核通过</el-button>
          <el-button type="danger" @click="changeState(scope.row, '审核不通过')" :disabled="scope.row.state !== '待审核'">审核不通过</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'" v-if="user.role === 'ROLE_STUDENT'" @selection-change="handleSelectionChange"> <!--改报废 -->
      <el-table-column prop="id" label="ID" width="100" sortable></el-table-column> <!-- 可正序降序排序 -->
      <el-table-column prop="type" label="类型" width="100"></el-table-column>
      <el-table-column prop="oneprice" label="单价" width="60"></el-table-column>
      <el-table-column prop="equipname" label="设备名" width="182"></el-table-column>
      <el-table-column prop="model" label="型号" width="180"></el-table-column>
      <el-table-column prop="num" label="数量" width="80"></el-table-column>
      <el-table-column prop="uniquecode" label="标准码" width="180"></el-table-column>
      <el-table-column prop="abandondate" label="报废日期" width="240"></el-table-column>
      <el-table-column prop="state" label="申请状态"></el-table-column>

      <el-table-column  label="审核" v-if="user.role === 'ROLE_ADMIN'"  width="240">
        <template v-slot="scope">
          <el-button type="success" @click="addDate(scope.row), changeState(scope.row, '审核通过')" :disabled="scope.row.state !== '待审核'">审核通过</el-button>
          <el-button type="danger" @click="changeState(scope.row, '审核不通过')" :disabled="scope.row.state !== '待审核'">审核不通过</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!--  分页   -->
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
 <!-- 新增表项 -->
    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="40%" :close-on-click-modal="true">
      <el-form label-width="140px" size="small" style="width: 85%;">

        <el-form-item label="标准码" prop="uniquecode">
          <el-select  v-model="form.uniquecode" clearable filterable  placeholder="请选择" @change="selDevice">
            <el-option
                v-for="item in devices"
                :key="item.id"
                :label="item.uniquecode"
                :value="item.uniquecode">
              {{ item.uniquecode }} <!-- 调试信息 -->
            </el-option>
          </el-select>

        </el-form-item>
        <el-form-item label="类型">
          <el-input v-model="form.type" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="单价">
          <el-input v-model="form.oneprice" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="设备名">
          <el-input v-model="form.equipname" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="型号">
          <el-input v-model="form.model" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="总数">
          <el-input v-model="form.quantity" autocomplete="off" disabled></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="form.num" autocomplete="off"></el-input>
        </el-form-item>


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
  name: "Message",
  data() {
    return {
      tableData: [],
      total: 0,
      devices: [],
      pageNum: 1,
      pageSize: 10,
      id:'',
      isButtonDisabled:false,
      dateRange:[],
      equipname:'',
      type:'',
      model:'',
      quantity:'',
      uniquecode:'',
      abandondate:'',
      form: {},
      rules: {
        bookNo: [
          { required: true, message: '请输入标准码', trigger: 'blur'}
        ]
      },
      dialogFormVisible: false,
      multipleSelection: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.load()
  },

  methods: {
    getCurrentDate() {
      const currentDate = new Date();
      const year = currentDate.getFullYear();
      const month = String(currentDate.getMonth() + 1).padStart(2, '0');
      const day = String(currentDate.getDate()).padStart(2, '0');
      const hours = String(currentDate.getHours()).padStart(2, '0');
      const minutes = String(currentDate.getMinutes()).padStart(2, '0');
      const formatDate = `${year}-${month}-${day} ${hours}:${minutes}`;
      return formatDate;
    },
    addDate(row ,state){
      this.form = JSON.parse(JSON.stringify(row))
      this.form.abandondate=this.getCurrentDate();
      this.form.state = state;
      const params = {
        num: this.form.num,
        uniquecode: this.form.uniquecode
      };
      this.request.post("/abandon/reduce", null,{params}).then(res => {

      })
      this.save();
    },
    changeState(row, state) {
      this.form = JSON.parse(JSON.stringify(row))
      this.form.state = state;
      this.save();
    },

    load() {
      const [startTime, endTime] = this.dateRange; // 获取选择的开始日期和结束日期
      this.request.get("/abandon/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          type: this.type,
          uniquecode: this.uniquecode,
          equipname: this.equipname,
          startTime: startTime,
          endTime: endTime,
        }
      }).then(res => {
        this.tableData = res.data.records
        this.total = res.data.total
      })

      this.request.get("/device").then(res => {
        /* TODO 实现获取到其他表的信息 2025/3/7  */
        this.devices = res.data
      })
    },
    save() {

      this.request.post("/abandon", this.form).then(res => {
        if (res.code === '200') {

          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })


/*
      this.request.
*/
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

    selDevice() {
      const device = this.devices.find(v => v.uniquecode === this.form.uniquecode)
      this.request.get("/device/" + device.id).then(res => {
/*        TODO      created（）里用this.request、这儿也是this.request，若是request、这儿也是request，若是""均"",若是''均''    */
        this.$set(this.form, 'equipname', res.data.devicename)
        this.$set(this.form, 'type', res.data.type)
        this.$set(this.form, 'model', res.data.model)
        this.$set(this.form, 'oneprice', res.data.oneprice)
        this.$set(this.form, 'quantity', res.data.quantity)
/*        this.$set(this.form, 'equipname', res.data.name)
        this.$set(this.form, 'equipname', res.data.name)*/

      })

/*      const book = this.books.find(v => v.bookNo === this.form.bookNo)
      this.request.get("/book/" + book.id).then(res => {
        this.$set(this.form, 'bookName', res.data.name)
        this.form.score = res.data.score
        this.form.nums = res.data.nums
      })*/
    },

    reset() {
      this.type = ""
      this.equipname = ""
      this.uniquecode = ""
      this.dateRange = []
      this.load()
    },

    /* 翻页处理 */
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },

    download(url) {
      window.open(url)
    },
    exp() {
      window.open(`http://${serverIp}:9090/abandon/export`)
    }


  }
}
</script>


<style>
.headerBg {
  background: #eee!important;
}
</style>
