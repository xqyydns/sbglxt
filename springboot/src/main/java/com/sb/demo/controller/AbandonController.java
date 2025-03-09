package com.sb.demo.controller;


import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sb.demo.entity.Abandon;
import com.sb.demo.service.IDeviceService;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sb.demo.common.Result;

import com.sb.demo.service.IAbandonService;

import org.springframework.web.bind.annotation.RestController;

import java.net.URLEncoder;
import java.util.List;

/**
 * @author 穆淼森
 * @create 2024-01-11-19:02
 * @description TODO
 */
@RestController
@RequestMapping("/abandon")
        public class AbandonController {
    
@Resource
private IAbandonService abandonService;


// 新增或者更新
@PostMapping
public Result save(@RequestBody Abandon abandon) {
    abandonService.saveOrUpdate(abandon);
        return Result.success();
        }




@GetMapping
public Result findAll() {
        return Result.success(abandonService.list());
        }

@GetMapping("/{id}")
public Result findOne(@PathVariable Integer id) {
        return Result.success(abandonService.getById(id));
        }

        @PostMapping("/reduce")
        public Result deleteByNum(@RequestParam Integer num,@RequestParam String uniquecode){
            abandonService.deleteByNum(num,uniquecode);
            return  Result.success();
        }


@GetMapping("/page")
public Result findPage(@RequestParam String equipname, @RequestParam String type,
                       @RequestParam String uniquecode,
        @RequestParam Integer pageNum,
        @RequestParam(defaultValue = "") String startTime,
        @RequestParam(defaultValue = "") String endTime,
@RequestParam Integer pageSize) {
        QueryWrapper<Abandon> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        queryWrapper.like("equipname",equipname);
        queryWrapper.like("uniquecode",uniquecode);
        queryWrapper.like("type",type);

    if (!startTime.isEmpty() && !endTime.isEmpty()) { // 判断开始时间和结束时间是否为空字符串
        queryWrapper.between("abandondate", startTime, endTime);
    }

    return Result.success(abandonService.page(new Page<>(pageNum, pageSize), queryWrapper));
        }

    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Abandon> list = abandonService.list();
        // 通过工具类创建writer 写出到磁盘路径
//        ExcelWriter writer = ExcelUtil.getWriter(filesUploadPath + "/用户信息.xlsx");
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);
        //自定义标题别名
        writer.addHeaderAlias("type", "类别");
        writer.addHeaderAlias("equipname", "设备名");
        writer.addHeaderAlias("model", "型号");

        writer.addHeaderAlias("oneprice", "单价");
        writer.addHeaderAlias("num", "数量");
        writer.addHeaderAlias("uniquecode", "标准码");
        writer.addHeaderAlias("abandondate", "报废日期");


        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("设备报废表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();
    }

}

