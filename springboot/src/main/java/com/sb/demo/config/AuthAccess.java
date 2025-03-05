package com.sb.demo.config;

import java.lang.annotation.*;

@Target({ElementType.METHOD})  //可以运行在方法上
@Retention(RetentionPolicy.RUNTIME) //注解运行时保留，运行时可以用反射来获取
@Documented
public @interface AuthAccess {

}
