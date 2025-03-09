package com.sb.demo.mapper;

import com.sb.demo.entity.Abandon;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Delete;

/**
 * @author 穆淼森
 * @create 2024-01-11-16:10
 * @description TODO
 */
public interface AbandonMapper extends BaseMapper<Abandon> {

    @Delete("update device set quantity = quantity - #{num} where uniquecode = #{uniquecode}")
    void deleteByDeviceNum(Integer num, String uniquecode);

}
