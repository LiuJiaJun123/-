package com.liujiajun.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.*;
import com.liujiajun.service.*;
import com.sun.org.apache.xpath.internal.operations.Mod;
import javafx.print.Collation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
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
    @Autowired
    private IOpinionService opinionService;

    //    商品详情
    @RequestMapping("/xq.do")
    public ModelAndView xq(Book book){

        ModelAndView modelAndView=new ModelAndView();
        Book bookInfo = bookService.findByBookId(book.getBook_id());
        modelAndView.addObject("bookInfo",bookInfo);
        modelAndView.setViewName("consumer/xiangqing");
        return modelAndView;
    }

    //    求购详情
    @RequestMapping("/askbook-xq.do")
    public ModelAndView askbookXq(AskBook askBook){

        ModelAndView modelAndView=new ModelAndView();
        AskBook askBookInfo = askBookService.findByAskBookId(askBook.getAskbook_id());
        modelAndView.addObject("askBookInfo",askBookInfo);
        modelAndView.setViewName("consumer/askbook-details");
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

    //    求购图书
    @RequestMapping("/addaskbook.do")
    public ModelAndView addaskbook() throws Exception {

        ModelAndView modelAndView=new ModelAndView();
        //查找所有类别
        List<Category> categoryList = categoryService.findAll();

        modelAndView.addObject("categoryList",categoryList);
        modelAndView.setViewName("consumer/add-askbook");
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


    //  意见反馈
    @GetMapping("/opinion.do")
    public String opinion() throws Exception {

        return "/consumer/opinion";
    }

    //  意见反馈
    @PostMapping("/opinion.do")
    public ModelAndView addOpinion(Opinion opinion) throws Exception {

        ModelAndView modelAndView = new ModelAndView();
        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);

        opinion.setUserInfo(userInfo);
        opinion.setTime(new Date());

        opinionService.save(opinion);

        modelAndView.addObject("successMsg","发布意见成功，您的意见是我们不断改进的动力！");
        modelAndView.setViewName("/consumer/opinion");
        return modelAndView;
    }


    //  修改密码
    @GetMapping("/updatePwd.do")
    public String updatePwd() throws Exception {

        return "/consumer/updatePwd";
    }

    //  修改密码
    @PostMapping("/updatePwd.do")
    public ModelAndView updatePwd2(String oldPwd,String newPwd) throws Exception {

        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo user = userService.findByName(username);

        ModelAndView modelAndView= new ModelAndView();

        //就密码输入不正确
        if(!oldPwd.equals(user.getPassword())){
            modelAndView.addObject("errorMsg","原密码输入有误，请重新输入！");
            modelAndView.setViewName("/consumer/updatePwd");
        }else {
            user.setPassword(newPwd);
            userService.update(user);
            Subject subject = SecurityUtils.getSubject();
            subject.logout();
            modelAndView.setViewName("../login");
        }

        return modelAndView;
    }


    //    全部图书
    @RequestMapping("/allbook.do")
    public ModelAndView allbook() throws Exception {

        ModelAndView modelAndView=new ModelAndView();
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


    //    全部求购图书
    @RequestMapping("/allAskbook.do")
    public ModelAndView allaskbook() throws Exception {

        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("consumer/all-askbook");
        return modelAndView;
    }

    //    全部求购图书
    @RequestMapping("/searchAskbook.do")
    @ResponseBody
    public ModelAndView allaskbook(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                   @RequestBody FindBookCondition findBookCondition) throws Exception {

        ModelAndView modelAndView=new ModelAndView();

        List<AskBook> askBookList = askBookService.findAll(findBookCondition,page, 6);
        PageInfo askBookInfo = new PageInfo(askBookList);
        modelAndView.addObject("findBookCondition",findBookCondition);
        modelAndView.addObject("askBookInfo",askBookInfo);
        modelAndView.setViewName("consumer/all-askbook-list");
        return modelAndView;
    }



    //    求购信息修改
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


    //    出售书籍信息修改
    @RequestMapping("/sell-edit.do")
    @ResponseBody
    public Book sell_edit(Integer book_id) throws Exception {


        //根据选中的条件查找书籍
        Book bookInfo = bookService.findByBookId(book_id);

        return bookInfo;
    }

}
