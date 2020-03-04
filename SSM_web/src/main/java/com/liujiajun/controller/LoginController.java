package com.liujiajun.controller;

import com.liujiajun.domain.Book;
import com.liujiajun.domain.CheckUsername;
import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.IBookService;
import com.liujiajun.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private IUserService userService;
    @Autowired
    private IBookService bookService;

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
            return "redirect:findNewBook.do";
        }

        return "login";
    }


    //注册表单处理
    @RequestMapping(value = "/register.do", method = {RequestMethod.POST})
    public ModelAndView register(UserInfo userInfo) throws Exception {
        System.out.println("注册11111111111");
        System.out.println(userInfo);

//        Boolean flag = userService.findNameExist(userInfo.getUsername());
//        if(flag==false){
//            System.out.println("用户名已存在，注册失败");
//            ModelAndView modelAndView=new ModelAndView();
//            modelAndView.setViewName("../login");
//            modelAndView.addObject("register_info","usernameHasExist");
//            return modelAndView;
//        }

        //注册
        userService.register(userInfo);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("../login");
        modelAndView.addObject("register_info","success");
        return modelAndView;
    }

    @RequestMapping("/findNewBook.do")
    public ModelAndView findNewBook() throws Exception {

        ModelAndView mv=new ModelAndView();
        //查找所有未出售的书籍 (status为1)
        List<Book> newBookList = bookService.findNewBook();
        mv.addObject("newBookList",newBookList);
        mv.setViewName("consumer/index");
        return mv;
    }



}
