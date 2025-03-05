package com.sb.demo.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sb.demo.controller.dto.UserDTO;
import com.sb.demo.controller.dto.UserPasswordDTO;
import com.sb.demo.entity.User;

import javax.mail.MessagingException;

/**
 * @author 穆淼森
 * @create 2024-01-11-18:47
 * @description TODO
 */
public interface IUserService extends IService<User> {



    UserDTO login(UserDTO userDTO);

    User register(UserDTO userDTO);
    void updatePassword(UserPasswordDTO userPasswordDTO);
    Page<User> findPage(Page<User> objectPage, String username, String email, String address);

    UserDTO loginEmail(UserDTO userDTO);

    void sendEmailCode(String email,Integer type) throws MessagingException;
}
