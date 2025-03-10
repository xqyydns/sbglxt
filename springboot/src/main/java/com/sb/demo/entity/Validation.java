package com.sb.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

/**
 * @author 穆淼森
 * @create 2024-01-11-15:31
 * @description TODO
 */
@Getter
@Setter
//  @ApiModel(value = "Validation对象", description = "")
public class Validation implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

//      @ApiModelProperty("邮箱")
      private String email;

//      @ApiModelProperty("验证码")
      private String code;

//      @ApiModelProperty("验证类型")
      private Integer type;

//      @ApiModelProperty("过期时间")
      private Date time;


}
