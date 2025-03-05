package com.sb.demo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * @author 穆淼森
 * @create 2024-01-11-15:16
 * @description TODO
 */
@Getter
@Setter
public class Notice implements Serializable {

    private static final long serialVersionUID = 1L;

    //("ID")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

//      ("标题")
      private String name;

//      ("内容")
      private String content;

//      ("发布时间")
      private String time;

//      ("发布人")
      private String user;

//      ("封面")
      private String img;

//      ("1-简单的公告，2富文本")
      private Integer type;


}
