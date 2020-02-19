package com.liujiajun.controller;

import com.liujiajun.domain.UserInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

    //登录跳转
//    @RequestMapping(value = "/login", method = {RequestMethod.GET})
//    public String loginUI() throws Exception {
//        return "../../login";
//    }

    //登录表单处理
    @RequestMapping(value = "/login.do", method = {RequestMethod.POST})
    public String login(UserInfo userInfo) throws Exception {
        //Shiro实现登录
        UsernamePasswordToken token = new UsernamePasswordToken(userInfo.getUsername(),
                userInfo.getPassword());

        // 获取Subject单例对象
        Subject subject = SecurityUtils.getSubject();

        //如果获取不到用户名就是登录失败，但登录失败的话，会直接抛出异常
        //调用login(token)方法时会调用LoginRealm中的doGetAuthenticationInfo方法
        subject.login(token);

        //当调用subject.hasRole()方法时，就会执行LoginRealm中的doGetAuthorizationInfo方法
        if (subject.hasRole("admin")) {
            System.out.println("管理员登录222222");
            return "main";
        } else if (subject.hasRole("user")) {
            System.out.println("普通用户登录2222222222");
            return "main";
        }

        return "login";
    }

}
