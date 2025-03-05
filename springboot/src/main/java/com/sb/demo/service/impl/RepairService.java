package com.sb.demo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sb.demo.entity.Repair;
import com.sb.demo.mapper.RepairMapper;
import com.sb.demo.service.IRepairService;
import org.springframework.stereotype.Service;

/**
 * @author 穆淼森
 * @create 2024-01-11-19:20
 * @description TODO
 */
@Service
public class RepairService extends ServiceImpl<RepairMapper, Repair> implements IRepairService {
}
