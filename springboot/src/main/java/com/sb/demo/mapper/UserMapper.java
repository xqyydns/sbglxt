package com.sb.demo.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sb.demo.controller.dto.UserPasswordDTO;
import com.sb.demo.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @author 穆淼森
 * @create 2024-01-11-16:34
 * @description TODO
 */
public interface UserMapper extends BaseMapper<User> {

    List<User> list();

    @Update("update sys_user set password = #{newPassword} where username = #{username} and password = #{password}")
    int updatePassword(UserPasswordDTO userPasswordDTO);
    Page<User> findPage(Page<User> page, @Param("username") String username, @Param("email") String email, @Param("address") String address);
}
