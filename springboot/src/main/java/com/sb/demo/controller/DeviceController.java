package com.sb.demo.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sb.demo.service.IUserService;
import com.sb.demo.utils.TokenUtils;
import com.sb.demo.entity.Device;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.sb.demo.common.Result;

import com.sb.demo.service.IDeviceService;

import org.springframework.web.bind.annotation.RestController;

/**
 * @author 穆淼森
 * @create 2024-01-11-19:13
 * @description TODO
 */
@RestController
@RequestMapping("/device")
public class DeviceController {
    
@Resource
private IDeviceService deviceService;
    @Resource
    private IUserService userService;

// 新增或者更新
@PostMapping
public Result save(@RequestBody Device device) {
    if (device.getId() == null) {
        // 新增
        Date currentDate =  DateUtil.date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        device.setBuydate(dateFormat.format(currentDate));
        device.setUser(TokenUtils.getCurrentUser().getUsername());
    }
    deviceService.saveOrUpdate(device);
    return Result.success();
}


@DeleteMapping("/{id}")
public Result delete(@PathVariable Integer id) {
    deviceService.removeById(id);
        return Result.success();
        }

@PostMapping("/del/batch")
public Result deleteBatch(@RequestBody List<Integer> ids) {
    deviceService.removeByIds(ids);
        return Result.success();
        }

@GetMapping
public Result findAll() {
        return Result.success(deviceService.list());
        }

@GetMapping("/{id}")
public Result findOne(@PathVariable Integer id) {
        return Result.success(deviceService.getById(id));
        }

@GetMapping("/page")
public Result findPage(
        @RequestParam( required = false ,defaultValue = "") String type,
        @RequestParam( required = false ) String devicename,
        @RequestParam String uniquecode,
        @RequestParam(defaultValue = "") String startTime,
        @RequestParam(defaultValue = "") String endTime,
//        @RequestParam String date,
        @RequestParam Integer pageNum,
        @RequestParam Integer pageSize) {

    QueryWrapper<Device> queryWrapper = new QueryWrapper<>();
    queryWrapper.orderByDesc("id");

//    if (type != -1) {
        queryWrapper.like("type", type);
//    }

        queryWrapper.like("devicename", devicename);
        queryWrapper.like("uniquecode", uniquecode);
    if (!startTime.isEmpty() && !endTime.isEmpty()) { // 判断开始时间和结束时间是否为空字符串
        queryWrapper.between("buydate", startTime, endTime);
    }
    Page<Device> page = deviceService.page(new Page<>(pageNum, pageSize), queryWrapper);/*gai*/
       return Result.success(page);
        }


    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Device> list = deviceService.list();
        // 通过工具类创建writer 写出到磁盘路径
//        ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        writer.addHeaderAlias("type", "类别");
        writer.addHeaderAlias("devicename", "设备名称");
        writer.addHeaderAlias("model", "型号");
        writer.addHeaderAlias("oneprice", "单价");
        writer.addHeaderAlias("quantity", "数量");
        writer.addHeaderAlias("buydate", "购买日期");
        writer.addHeaderAlias("uniquecode", "标准码");
        writer.addHeaderAlias("expirationdate", "保修期");
        writer.addHeaderAlias("user", "经办人");

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("设备信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();
    }
}