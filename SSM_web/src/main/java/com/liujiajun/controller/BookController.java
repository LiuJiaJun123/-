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

import javax.servlet.http.HttpServletRequest;
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
    public String save(Book book, MultipartFile uploadImg, HttpServletRequest request) throws Exception {

        //有上传图片
        if(!uploadImg.isEmpty()){

            // 文件保存路径
            String path = request.getSession().getServletContext().getRealPath("");
            File newFile = new File(path + "img/uploadImg/");  //为图片文件夹下的图片存放文件夹目录
            if (!newFile.exists()){
                newFile.mkdirs();
            }

            //随机数  保证每个图片名字不一样
            String picName= UUID.randomUUID().toString();
            //上传文件的原始名称
            String oriName=uploadImg.getOriginalFilename();
            //获取后缀  .jpg 等
            String extName=oriName.substring(oriName.lastIndexOf("."));
            //图片保存路径
            String filePath =  path+"img\\uploadImg\\"+picName+extName;
            //保存到本地磁盘
            uploadImg.transferTo(new File(filePath));

            book.setImgUrl("../img/uploadImg/"+picName+extName);
        }

        //没上传图片，设置默认图片
        if(uploadImg.isEmpty()){
            book.setImgUrl("../img/暂无图片.png");
        }

        bookService.save(book);
        return "redirect:findAll.do";
    }

    //查看书籍详情之前，先根据书籍id 查找书籍信息
    @RequestMapping("/beforeDetail.do")
    public ModelAndView beforeDetail(Integer book_id) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        //查找书籍信息
        Book book = bookService.findByBookId(book_id);
        //书籍类别
//        Category category = categoryService.findById(book.getCategory());
        //图片路径
//        String imgUrl = book.getImgUrl();

        //查找卖家信息
//        UserInfo userInfo = userService.findById(book.getUser_id());
        modelAndView.addObject("book",book);
//        modelAndView.addObject("category",category);
//        modelAndView.addObject("userInfo",userInfo);
        modelAndView.setViewName("book-show");
        return modelAndView;
    }

    //书籍 编辑前，先查找 书籍信息以及类别信息
    @RequestMapping("/edit.do")
    public ModelAndView edit(Integer book_id) throws Exception {
        ModelAndView mv=new ModelAndView();
        //书籍信息
        Book bookInfo = bookService.findByBookId(book_id);
        //类别信息  查找当前类别
//        Category categoryCurrent = categoryService.findById(bookInfo.getCategory());
        // 查找当前类别之外的类别
        List<Category> categoryNotSet =  categoryService.findCategoryNotSet(bookInfo.getCategoryInfo().getCategory_id());
        mv.addObject("bookInfo",bookInfo);
//        mv.addObject("categoryCurrent",categoryCurrent);
        mv.addObject("categoryNotSet",categoryNotSet);
        mv.setViewName("book-edit");
        return mv;
    }

    // 书籍信息修改
    @RequestMapping("/update.do")
    public String update( Book book,MultipartFile uploadImg,HttpServletRequest request) throws Exception {
        //有上传图片
        if(!uploadImg.isEmpty()){

            // 文件保存路径
            String path = request.getSession().getServletContext().getRealPath("");
            File newFile = new File(path + "img/uploadImg/");  //为图片文件夹下的图片存放文件夹目录
            if (!newFile.exists()){
                newFile.mkdirs();
            }

            //随机数  保证每个图片名字不一样
            String picName= UUID.randomUUID().toString();
            //上传文件的原始名称
            String oriName=uploadImg.getOriginalFilename();
            //获取后缀  .jpg 等
            String extName=oriName.substring(oriName.lastIndexOf("."));
            //图片保存路径
            String filePath =  path+"img\\uploadImg\\"+picName+extName;
            //保存到本地磁盘
            uploadImg.transferTo(new File(filePath));

            book.setImgUrl("../img/uploadImg/"+picName+extName);
            bookService.update(book);
        }

        //没上传图片，设置默认图片
        if(uploadImg.isEmpty()){
//            book.setImgUrl("../img/暂无图片.png");
            bookService.updateWithoutImg(book);
        }


        return "redirect:findAll.do";
    }

    //删除书籍
    @RequestMapping("delete.do")
    public String delete(String[] selectIds) throws Exception {

        bookService.delete(selectIds);

        return "redirect:findAll.do";

    }

    //根据 书籍名称或卖家名称 搜索书籍
    @RequestMapping("/findBook.do")
    public ModelAndView findBook(String findConditions,
                                 @RequestParam(value = "page",required = true,defaultValue = "1")Integer page,
                                 @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();

        List<Book> findBook = bookService.findBook(findConditions,page,pageSize);
        PageInfo pageInfo=new PageInfo(findBook);

        mv.addObject("findConditions",findConditions);
        mv.addObject("bookInfo",pageInfo);

        mv.setViewName("book-find-list");

        return mv;
    }


}
