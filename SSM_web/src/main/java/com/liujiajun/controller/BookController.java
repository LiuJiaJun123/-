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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private IBookService bookService;
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IUserService userService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();
        List<Book> bookList = bookService.findAll(page,pageSize);
        PageInfo bookInfo=new PageInfo(bookList);
        mv.addObject("bookInfo",bookInfo);
        mv.setViewName("book-list");
        return mv;
    }

//    添加书籍前，先查找所有书籍类别，查找所有卖家
    @RequestMapping("/findAllCategory.do")
    public ModelAndView findAllCategory() throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Category> categoryList = categoryService.findAll(1, 30);
        mv.addObject("categoryList",categoryList);

        //查找所有除了 管理员 的用户
        List<UserInfo> userList = userService.findUserExpectAdmin();
        mv.addObject("userList",userList);
        mv.setViewName("book-add");
        return mv;
    }

    //添加书籍
    @RequestMapping("/save.do")
    public String save(Book book) throws Exception {

//        ,MultipartFile uploadImg
//        System.out.println("上传文件的原始名称：" + uploadImg.getOriginalFilename());
//        System.out.println("上传文件的类型：" + uploadImg.getContentType());
//        //单位是字节
//        System.out.println("获取上传文件大小：" + uploadImg.getSize()+ "字节");

        bookService.save(book);
        return "redirect:findAll.do";
    }



}
