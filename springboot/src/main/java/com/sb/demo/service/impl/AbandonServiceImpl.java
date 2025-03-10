package com.sb.demo.service.impl;

import com.sb.demo.entity.Abandon;
import com.sb.demo.mapper.AbandonMapper;
import com.sb.demo.service.IAbandonService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 穆淼森
 * @create 2024-01-11-19:07
 * @description TODO
 */
@Service
public class AbandonServiceImpl extends ServiceImpl<AbandonMapper, Abandon> implements IAbandonService {
    @Resource
    AbandonMapper abandonMapper;

    @Override
    public void deleteByNum(Integer num, String uniquecode) {
        abandonMapper.deleteByDeviceNum(num,uniquecode);
    }
}
