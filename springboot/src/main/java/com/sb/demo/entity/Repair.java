package com.sb.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 穆淼森
 * @create 2024-01-11-15:20
 * @description TODO
 */
@Getter
@Setter
public class Repair implements Serializable {

    private static final long serialVersionUID = 1L;

//    "id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

//    ("修理日期")
    private String fixdate;

//    ("设备名")
    private String devicename;

//   ("修理工厂")
    private String uniquecode;

//    ("类别")
    private String type;

//    ("修理费用")
    private Double money;

//   ("责任人")
    private String responsib;
}