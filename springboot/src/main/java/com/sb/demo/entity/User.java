package com.sb.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 穆淼森
 * @create 2024-01-11-15:28
 * @description TODO
 */
@Getter
@Setter
  @TableName("sys_user")
@ToString
public class User implements Serializable {


    private static final long serialVersionUID = 1L;

        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      private String username;

      private String password;

      private String nickname;

      private String email;

      private String phone;

      private String address;

      private Date createTime;

      private String avatarUrl;

      private String role;

  /*    @TableField(exist = false)
      private List<Device> devices;

      @TableField(exist = false)
      private List<Device> stuCourses;*/
      

}
