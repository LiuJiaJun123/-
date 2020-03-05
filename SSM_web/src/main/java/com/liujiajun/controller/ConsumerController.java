package com.liujiajun.controller;

import com.liujiajun.domain.Book;
import com.liujiajun.service.IBookService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/consumer")
public class ConsumerController {

    @Autowired
    private IBookService bookService;

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
    public ModelAndView addbook(){

        ModelAndView modelAndView=new ModelAndView();

        modelAndView.setViewName("consumer/add-book");
        return modelAndView;
    }


    //    个人中心
    @RequestMapping("/center.do")
    public ModelAndView center(){

        ModelAndView modelAndView=new ModelAndView();
        // 我发布的商品
        List<Book> bookInfo = bookService.findByUserId(1069);
        modelAndView.addObject("bookInfo",bookInfo);
        modelAndView.setViewName("consumer/个人中心");
        return modelAndView;
    }


}
