package com.sb.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.List;


import lombok.Getter;
import lombok.Setter;

/**
 * @author 穆淼森
 * @create 2024-01-11-15:12
 * @description TODO
 */
@Getter
@Setter
  @TableName("sys_menu")
public class Menu implements Serializable {

    private static final long serialVersionUID = 1L;

//     ("id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

//      ("名称")
      private String name;

//     ("路径")
      private String path;

//      ("图标")
      private String icon;

//      ("描述")
      private String description;

//     ("父级id")
      private Integer pid;

//      ("页面路径")
      private String pagePath;

//  ("排序")
      private String sortNum;


      @TableField(exist = false)
      private List<Menu> children;



}
