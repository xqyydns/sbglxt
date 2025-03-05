<template>         <!-- 设备管理-->
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="devicename"></el-input>
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
<!--    <div style="margin-bottom: 20px">
      <el-input style="width: 240px" placeholder="请输入设备名称" v-model="params.name"></el-input>
      <el-input style="width: 240px; margin-left: 5px" placeholder="请输入设备标准码" v-model="params.bookNo"></el-input>
      <el-button style="margin-left: 5px" type="primary" @click="load"><i class="el-icon-search"></i> 搜索</el-button>
      <el-button style="margin-left: 5px" type="warning" @click="reset"><i class="el-icon-refresh"></i> 重置</el-button>
    </div>-->
    <div style="margin: 10px 0">
      <el-button type="primary" @click="handleAdd" v-if="user.role === 'ROLE_ADMIN'">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" v-if="user.role === 'ROLE_ADMIN'" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>

    </div>
    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"
              @selection-change="handleSelectionChange">
      <el-table-column v-if="user.role === 'ROLE_ADMIN'" type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="60" sortable></el-table-column>
      <el-table-column prop="type" label="类别"></el-table-column>
      <el-table-column prop="devicename" width="120" label="设备名称"></el-table-column>
      <el-table-column prop="model" label="型号"></el-table-column>

      <el-table-column prop="oneprice" label="单价" width="60"></el-table-column>
      <el-table-column prop="quantity" label="数量" width="60"></el-table-column>
      <el-table-column prop="buydate" label="购买日期" width="150"></el-table-column>
      <el-table-column prop="uniquecode" width="150" label="标准码"></el-table-column>
      <el-table-column prop="expirationdate" label="保修期"></el-table-column>
      <el-table-column prop="user" label="经办人"></el-table-column>
      <el-table-column v-if="user.role === 'ROLE_ADMIN'" label="操作" width="280" align="center">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)" >编辑 <i class="el-icon-edit"></i></el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference" v-if="user.role === 'ROLE_ADMIN'">删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <!-- 设置页面下方的列表项 -->
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

    <el-dialog title="设备信息" :visible.sync="dialogFormVisible" width="30%" >
      <el-form label-width="80px" size="small">

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
        <el-form-item label="标准码">
          <el-input v-model="form.uniquecode" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="保修期">
          <el-input v-model="form.expirationdate" autocomplete="off"></el-input>
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
  name: "Device",
  data() {
    return {
      total: 0,
      pageSize: 10,
      pageNum: 1,
      tableData: [],
      id: '',
      name: '',
      type: '',
      dateRange:[],
      devicename: '',
      model: '',
      size: '',
      oneprice: "",
      quantity: '',
      buydate: '',
      uniquecode: '',
      expirationdate: '',
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      // teachers: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.load()
  },
  methods: {

    load() {
      const [startTime, endTime] = this.dateRange; // 获取选择的开始日期和结束日期
      this.request.get("/device/page", {
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
    // 生成设备号
    generateDeviceNumber(type) {
      // 查询数据库中已有的设备号的最大值
      let maxDeviceNumber = this.tableData.reduce((max, item) => {
        return item.id %1000 > max ? item.id%1000 : max;
      }, 0) + type *1000  +1 ;
      console.log(maxDeviceNumber)
      return maxDeviceNumber;
    },

    save() {
      // 将生成的设备号赋值给保存的表项
      // this.form.id = this.generateDeviceNumber(this.form.type);
      this.request.post("/device", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.form.id = this.generateDeviceNumber(this.form.type);
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    changeEnable(row) {
      this.request.post("/device/update", row).then(res => {
        if (res.code === '200') {
          this.$message.success("操作成功")
        }
      })
    },
    handleAdd() {
      // 生成设备号并赋值给新增表项的设备号字段
      this.dialogFormVisible = true
      this.form = {}
      console.log(this.type)
      this.form.id = this.generateDeviceNumber(this.form.type);
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    del(id) {
      this.request.delete("/device/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/device/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },

    reset() {
      this.type = null
      this.devicename = ""
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
    download(url) {
      window.open(url)
    },
    exp() {
      window.open(`http://${serverIp}:9090/device/export`)
    }
  }
}
</script>

<style scoped>

</style>
