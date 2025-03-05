package com.sb.demo.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import sun.util.calendar.LocalGregorianCalendar;

/**
 * @author 穆淼森
 * @create 2024-01-11-15:08
 * @description TODO
 */
@Getter
@Setter
public class Device implements Serializable {

    private static final long serialVersionUID = 1L;

//      ("id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

//     ("类别")
      private String type;

//      ("设备名称")
      private String devicename;

//      ("型号")
      private String model;



//     ("单价")
      private Double oneprice;

//     ("数量")
      private Integer quantity;

//     ("购买日期")
      private String buydate;

//     ("生产厂家")
      private String uniquecode;

//  @ApiModelProperty("保修期")
      private String expirationdate;

//  @ApiModelProperty("经办人")
      private String user;

}
