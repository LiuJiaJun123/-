package com.liujiajun.controller;

import com.liujiajun.domain.Book;
import com.liujiajun.service.IBookService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/consumer")
public class ConsumerController {

    @Autowired
    private IBookService bookService;

    //    详情
    @RequestMapping("/xq.do")
    public ModelAndView xq(){

        ModelAndView modelAndView=new ModelAndView();
        Book bookInfo = bookService.findByBookId(10001);
        modelAndView.addObject("bookInfo",bookInfo);
        modelAndView.setViewName("consumer/xiangqing");
        return modelAndView;
    }


}
