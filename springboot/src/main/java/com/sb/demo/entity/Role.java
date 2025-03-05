package com.sb.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

/**
 * @author 穆淼森
 * @create 2024-01-11-15:25
 * @description TODO
 */
@Getter
@Setter
@TableName("sys_role")
//@ApiModel(value = "Role对象", description = "")
public class Role implements Serializable {

    private static final long serialVersionUID = 1L;

//      @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

//      @ApiModelProperty("名称")
      private String name;

//      @ApiModelProperty("描述")
      private String description;

//      @ApiModelProperty("唯一标识")
      private String flag;


}
