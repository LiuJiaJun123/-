package com.liujiajun.controller;

import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.Book;
import com.liujiajun.domain.Category;
import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.IBookService;
import com.liujiajun.service.ICategoryService;
import com.liujiajun.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/consumer")
public class ConsumerController {

    @Autowired
    private IBookService bookService;
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IUserService userService;

    //    商品详情
    @RequestMapping("/xq.do")
    public ModelAndView xq(){

        ModelAndView modelAndView=new ModelAndView();
        Book bookInfo = bookService.findByBookId(10001);
        modelAndView.addObject("bookInfo",bookInfo);
        modelAndView.setViewName("consumer/xiangqing");
        return modelAndView;
    }

    //    添加图书
    @RequestMapping("/addbook.do")
    public ModelAndView addbook() throws Exception {

        ModelAndView modelAndView=new ModelAndView();
        //查找所有类别
        List<Category> categoryList = categoryService.findAll();

        modelAndView.addObject("categoryList",categoryList);
        modelAndView.setViewName("consumer/add-book");
        return modelAndView;
    }


    //   我出售的商品
    @RequestMapping("/mySell.do")
    public ModelAndView mySell(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page) throws Exception {

        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);

        ModelAndView modelAndView=new ModelAndView();
        // 我发布的商品
        List<Book> bookList = bookService.findByUserId(userInfo.getId(),page);
        PageInfo bookInfo=new PageInfo(bookList);
        modelAndView.addObject("bookInfo",bookInfo);
        modelAndView.setViewName("consumer/my-sell");
        return modelAndView;
    }


}
