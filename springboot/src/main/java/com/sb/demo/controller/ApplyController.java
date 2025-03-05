package com.sb.demo.controller;


import cn.hutool.core.date.DateUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sb.demo.common.RoleEnum;
import com.sb.demo.entity.User;
import com.sb.demo.utils.TokenUtils;
import com.sb.demo.entity.Apply;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sb.demo.common.Result;

import com.sb.demo.service.IApplyService;

import org.springframework.web.bind.annotation.RestController;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author 穆淼森
 * @create 2024-01-11-19:10
 * @description TODO
 */
@RestController
@RequestMapping("/apply")
        public class ApplyController {
    
@Resource
private IApplyService applyService;

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody Apply apply) {
        if (apply.getId() == null) {
            // 新增
            Date currentDate =  DateUtil.date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            apply.setTime(dateFormat.format(currentDate));
            apply.setUser(TokenUtils.getCurrentUser().getUsername());
        }
        applyService.saveOrUpdate(apply);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        applyService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {

        applyService.removeByIds(ids);
        return Result.success();
    }



@GetMapping
public Result findAll() {
        return Result.success(applyService.list());
        }

@GetMapping("/{id}")
public Result findOne(@PathVariable Integer id) {
        return Result.success(applyService.getById(id));
        }

    // 分页查询做一下筛选
    @GetMapping("/page")
    public Result findPage(@RequestParam(required = false) String devicename,
                           @RequestParam(required = false) String type,
                           @RequestParam(defaultValue = "") String startTime,
                           @RequestParam(defaultValue = "") String endTime,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<Apply> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");

            queryWrapper.like("devicename", devicename);
            queryWrapper.like("type", type);
        if (!startTime.isEmpty() && !endTime.isEmpty()) { // 判断开始时间和结束时间是否为空字符串
            queryWrapper.between("time", startTime, endTime);
        }


        User currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.ROLE_USER.toString().equals(currentUser.getRole())) {  // 角色是普通用户
            queryWrapper.eq("user", currentUser.getUsername());
        }
        return Result.success(applyService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }


    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<Apply> list = applyService.list();
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
        writer.addHeaderAlias("uniquecode", "标准码");
        writer.addHeaderAlias("expirationdate", "保修期");
        writer.addHeaderAlias("user", "经办人");
        writer.addHeaderAlias("img", "图片");
        writer.addHeaderAlias("time", "时间");
        writer.addHeaderAlias("state", "状态");

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("申请购买表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();
    }

}

