package com.sb.demo.service.impl;

import cn.hutool.core.date.DateTime;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.sb.demo.entity.Validation;
import com.sb.demo.mapper.ValidationMapper;
import com.sb.demo.service.IValidationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author 穆淼森
 * @create 2024-01-11-19:15
 * @description TODO
 */
@Service
public class ValidationServiceImpl extends ServiceImpl<ValidationMapper, Validation> implements IValidationService {

    @Transactional
    @Override
    public void saveCode(String email, String code, Integer type, DateTime expireDate) {

        Validation validation = new Validation();
        validation.setEmail(email);
        validation.setCode(code);
        validation.setType(type);
        validation.setTime(expireDate);

        // 删除同类型的验证
        UpdateWrapper<Validation> validationUpdateWrapper = new UpdateWrapper<>();
        validationUpdateWrapper.eq("email",email);
        validationUpdateWrapper.eq("type", type);
        remove(validationUpdateWrapper);

        // 再插入新的code
        save(validation);

    }
}
