package com.sb.demo.service;

import com.sb.demo.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @author 穆淼森
 * @create 2024-01-11-18:39
 * @description TODO
 */
public interface IMenuService extends IService<Menu> {

    List<Menu> findMenus(String name);
}
