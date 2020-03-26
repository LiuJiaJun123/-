package com.liujiajun.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.*;
import com.liujiajun.service.*;
import javafx.print.Collation;
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
    @Autowired
    private ICollectionService collectionService;

    //    商品详情
    @RequestMapping("/xq.do")
    public ModelAndView xq(Book book){

        ModelAndView modelAndView=new ModelAndView();
        Book bookInfo = bookService.findByBookId(book.getBook_id());
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

    //  我的收藏
    @RequestMapping("/myCollection.do")
    public ModelAndView myCollection(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page) throws Exception {

        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);

        ModelAndView modelAndView=new ModelAndView();
        //我的收藏
        List<AskBook> askBookList = askBookService.findAskBookByUserId(userInfo.getId(),page);

        List<Collection> collectionList = collectionService.findByUserId(userInfo.getId(), page);

        PageInfo collectionInfo=new PageInfo(collectionList);
        modelAndView.addObject("collectionInfo",collectionInfo);
        modelAndView.setViewName("consumer/my-collection");
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
    public ModelAndView searchbook(@RequestBody FindBookCondition findBookCondition,
                                   @RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                   @RequestParam(value = "pageSize",required = true,defaultValue = "8")Integer pageSize) throws Exception {

        ModelAndView modelAndView=new ModelAndView();

        //根据选中的条件查找书籍
        List<Book> bookList = bookService.findByConditions(findBookCondition,page,pageSize);
        PageInfo bookInfo=new PageInfo(bookList);


        modelAndView.addObject("findBookCondition",findBookCondition);

        modelAndView.addObject("bookInfo",bookInfo);
        modelAndView.setViewName("consumer/all-book-list");
        return modelAndView;
    }

    //    全部图书
    @RequestMapping("/ask-edit.do")
    @ResponseBody
    public AskBook ask_edit(Integer askbook_id) throws Exception {

//        ModelAndView modelAndView=new ModelAndView();

        //根据选中的条件查找书籍
        AskBook askBookInfo = askBookService.findByAskBookId(askbook_id);


//        modelAndView.addObject("bookEditInfo",askBookInfo);
//
//        modelAndView.setViewName("consumer/all-book-list");
        return askBookInfo;
    }

}
