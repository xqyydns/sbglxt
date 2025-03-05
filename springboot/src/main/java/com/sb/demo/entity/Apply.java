package com.sb.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**
 * @author 穆淼森
 * @create 2024-01-11-15:05
 * @description TODO
 */
@Getter
@Setter
public class Apply implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Integer id;


/* private Date startTime;
 private Date endTime;*/
//  ("类型")
  private String type;
//  ("型号")
  private String model;

//  ("设备名")
  private String devicename;
//  ("单价")
  private String oneprice;
//  ("数量")
  private String quantity;

//  ("保修期")
  private String expirationdate;

//  ("负责人")
  private String user;

//  ("设备图片")
  private String img;

//  ("申请时间")
  private String time;

//  ("待审核，审核不通过，审核通过")
  private String state;

}
