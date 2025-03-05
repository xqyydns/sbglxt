package com.sb.demo.service;

import cn.hutool.core.date.DateTime;
import com.sb.demo.entity.Validation;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author 穆淼森
 * @create 2024-01-11-18:50
 * @description TODO
 */
public interface IValidationService extends IService<Validation> {

    void saveCode(String email, String code, Integer type, DateTime expireDate);
}
