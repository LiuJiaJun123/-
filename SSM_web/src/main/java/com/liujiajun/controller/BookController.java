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

import java.io.File;
import java.util.List;
import java.util.UUID;

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
    public String save(Book book,MultipartFile uploadImg) throws Exception {

        // 有上传图片
        if(uploadImg!=null&&uploadImg.getSize()>0){
            //随机数  保证每个图片名字不一样
            String picName= UUID.randomUUID().toString();
            //上传文件的原始名称
            String oriName=uploadImg.getOriginalFilename();
            //获取后缀  .jpg 等
            String extName=oriName.substring(oriName.lastIndexOf("."));
            //图片保存路径
            String path =  "C:/BYSJ_upfile/"+picName+extName;
            //保存到本地磁盘
            uploadImg.transferTo(new File(path));

            book.setImgUrl(path);
        }

        bookService.save(book);
        return "redirect:findAll.do";
    }



}
