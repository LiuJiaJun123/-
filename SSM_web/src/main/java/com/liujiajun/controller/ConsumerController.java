package com.liujiajun.controller;

import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.*;
import com.liujiajun.service.IAskBookService;
import com.liujiajun.service.IBookService;
import com.liujiajun.service.ICategoryService;
import com.liujiajun.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/consumer")
public class ConsumerController {

    @Autowired
    private IBookService bookService;
    @Autowired
    private IAskBookService askBookService;
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

    //  我的求购
    @RequestMapping("/myAsk.do")
    public ModelAndView myAsk(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page) throws Exception {

        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);

        ModelAndView modelAndView=new ModelAndView();
        // 我发布的商品
        List<AskBook> askBookList = askBookService.findAskBookByUserId(userInfo.getId(),page);
        PageInfo askbookInfo=new PageInfo(askBookList);
        modelAndView.addObject("askbookInfo",askbookInfo);
        modelAndView.setViewName("consumer/my-ask");
        return modelAndView;
    }


    //    全部图书
    @RequestMapping("/allbook.do")
    public ModelAndView allbook() throws Exception {

        ModelAndView modelAndView=new ModelAndView();
//        //查找所有类别
//        List<Category> categoryList = categoryService.findAll();
//
//        modelAndView.addObject("categoryList",categoryList);

        modelAndView.setViewName("consumer/all-book");
        return modelAndView;
    }


    //    全部图书
    @RequestMapping("/searchbook.do")
    @ResponseBody
    public ModelAndView searchbook(@RequestBody FindBookCondition findBookCondition) throws Exception {

        ModelAndView modelAndView=new ModelAndView();

        System.out.println("111111111");

        String selectA = findBookCondition.getSelectA();
        String selectB = findBookCondition.getSelectB();
        String selectC = findBookCondition.getSelectC();

        if(selectA==null||selectA.length()==0){
            System.out.println("A全部");
        }
        if (selectA.length()>0){
            System.out.println(selectA);
        }

        if(selectB==null||selectB.length()==0){
            System.out.println("B全部");
        }
        if (selectB.length()>0){
            System.out.println(selectB);
        }

        if(selectC==null||selectC.length()==0){
            System.out.println("C全部");
        }
        if (selectC.length()>0){
            System.out.println(selectC);
        }

        List<Book> bookList = bookService.findAll();

        modelAndView.addObject("bookList",bookList);
        modelAndView.setViewName("consumer/all-book-list");
//        modelAndView.setViewName("consumer/add-book");
        return modelAndView;
    }


}
