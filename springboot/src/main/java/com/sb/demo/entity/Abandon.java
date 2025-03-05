package com.sb.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

/**
 * @author 穆淼森
 * @create 2024-01-11-15:03
 * @description TODO
 */
@Getter
@Setter
public class Abandon implements Serializable {

    private static final long serialVersionUID = 1L;

        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      private String type;

      private String equipname;

      private String model;


      private Integer quantity;


      private String uniquecode;

      private String abandondate;

      private String state;







}
