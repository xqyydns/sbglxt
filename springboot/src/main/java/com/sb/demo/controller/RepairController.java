package com.sb.demo.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sb.demo.common.Result;
import com.sb.demo.common.RoleEnum;
import com.sb.demo.entity.Repair;
import com.sb.demo.entity.User;
import com.sb.demo.service.IRepairService;
import com.sb.demo.utils.TokenUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;

/**
 * @author 穆淼森
 * @create 2024-01-11-19:23
 * @description TODO
 */
@RestController
@RequestMapping("/repair")
        public class RepairController {
    
@Resource
private IRepairService repairService;

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Repair repair) {
        if (repair.getId() == null) {
            // 新增
            repair.setFixdate(DateUtil.today());    //TODO  添加不了日期
            System.out.println(DateUtil.date(Calendar.getInstance()));
        }
        repairService.saveOrUpdate(repair);
        return Result.success();
    }

@GetMapping
public Result findAll() {
        return Result.success(repairService.list());
        }

@GetMapping("/{id}")
public Result findOne(@PathVariable Integer id) {
        return Result.success(repairService.getById(id));
        }

    // 分页查询做一下筛选
    @GetMapping("/page")
    public Result findPage(@RequestParam String type,
                           @RequestParam String devicename,
                           @RequestParam(defaultValue = "") String startTime,
                           @RequestParam(defaultValue = "") String endTime,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Repair> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");

            queryWrapper.like("type", type);
            queryWrapper.like("devicename", devicename);
        if (!startTime.isEmpty() && !endTime.isEmpty()) { // 判断开始时间和结束时间是否为空字符串
            queryWrapper.between("fixdate", startTime, endTime);
        }

        User currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.ROLE_USER.toString().equals(currentUser.getRole())) {  // 角色是普通用户
            queryWrapper.eq("user", currentUser.getUsername());
        }
        return Result.success(repairService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Repair> list = repairService.list();
        // 通过工具类创建writer 写出到磁盘路径
//        ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        writer.addHeaderAlias("fixdate", "修理日期");
        writer.addHeaderAlias("devicename", "设备名");
        writer.addHeaderAlias("id", "编号");
        writer.addHeaderAlias("type", "类型");
        writer.addHeaderAlias("uniquecode", "标准码");
        writer.addHeaderAlias("money", "修理费用");
        writer.addHeaderAlias("responsib", "责任人");


        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("设备修理表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();
    }

}

