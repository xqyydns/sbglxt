package com.sb.demo.service;

import com.sb.demo.entity.Abandon;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author 穆淼森
 * @create 2024-01-11-18:35
 * @description TODO
 */
public interface IAbandonService extends IService<Abandon> {

    /**
     * 删除num个对应的device的数量
     * @param num
     * @param uniquecode
     */
    void deleteByNum(Integer num, String uniquecode);
}
