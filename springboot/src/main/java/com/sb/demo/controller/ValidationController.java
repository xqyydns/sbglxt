package com.sb.demo.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sb.demo.common.Result;

import com.sb.demo.service.IValidationService;
import com.sb.demo.entity.Validation;

import org.springframework.web.bind.annotation.RestController;

/**
 * @author 穆淼森
 * @create 2024-01-11-19:32
 * @description TODO
 */
@RestController
@RequestMapping("/validation")
        public class ValidationController {
    
@Resource
private IValidationService validationService;

// 新增或者更新
@PostMapping
public Result save(@RequestBody Validation validation) {
    validationService.saveOrUpdate(validation);
        return Result.success();
        }

@DeleteMapping("/{id}")
public Result delete(@PathVariable Integer id) {
    validationService.removeById(id);
        return Result.success();
        }

@PostMapping("/del/batch")
public Result deleteBatch(@RequestBody List<Integer> ids) {
    validationService.removeByIds(ids);
        return Result.success();
        }

@GetMapping
public Result findAll() {
        return Result.success(validationService.list());
        }

@GetMapping("/{id}")
public Result findOne(@PathVariable Integer id) {
        return Result.success(validationService.getById(id));
        }

@GetMapping("/page")
public Result findPage(@RequestParam Integer pageNum,
@RequestParam Integer pageSize) {
        QueryWrapper<Validation> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        return Result.success(validationService.page(new Page<>(pageNum, pageSize), queryWrapper));
        }

        }

