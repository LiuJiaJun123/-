package com.liujiajun.controller;

import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.AskBook;
import com.liujiajun.domain.Category;
import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.IAskBookService;
import com.liujiajun.service.ICategoryService;
import com.liujiajun.service.IUserService;
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
@RequestMapping("/askbook")
public class AskBookController {

    @Autowired
    private IAskBookService askBookService;
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IUserService userService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();
        //查找所有未出售的求购书籍 (status为1)
        List<AskBook> askbookList = askBookService.findAll(page,pageSize);
        PageInfo askbookInfo=new PageInfo(askbookList);
        mv.addObject("askbookInfo",askbookInfo);
        mv.setViewName("askbook-list");
        return mv;
    }

//    添加求购书籍前，先查找所有求购书籍类别，查找所有卖家
    @RequestMapping("/findAllCategory.do")
    public ModelAndView findAllCategory() throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Category> categoryList = categoryService.findAll();
        mv.addObject("categoryList",categoryList);

        //查找所有除了 管理员 的用户
        List<UserInfo> userList = userService.findUserExpectAdmin();
        mv.addObject("userList",userList);
        mv.setViewName("askbook-add");
        return mv;
    }

    //添加求购书籍
    @RequestMapping("/save.do")
    public String save(AskBook askbook, MultipartFile uploadImg, HttpServletRequest request) throws Exception {

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

            askbook.setImgUrl("../img/uploadImg/"+picName+extName);
        }

        //没上传图片，设置默认图片
        if(uploadImg.isEmpty()){
            askbook.setImgUrl("../img/暂无图片.png");
        }

        askBookService.save(askbook);
        return "redirect:findAll.do";
    }

    //查看求购书籍详情之前，先根据求购书籍id 查找求购书籍信息
    @RequestMapping("/beforeDetail.do")
    public ModelAndView beforeDetail(Integer askbook_id) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        //查找求购书籍信息
        AskBook askbook = askBookService.findByAskBookId(askbook_id);
        //求购书籍类别
//        Category category = categoryService.findById(askbook.getCategory());
        //图片路径
//        String imgUrl = askbook.getImgUrl();

        //查找卖家信息
//        UserInfo userInfo = userService.findById(askbook.getUser_id());
        modelAndView.addObject("askbook",askbook);
//        modelAndView.addObject("category",category);
//        modelAndView.addObject("userInfo",userInfo);
        modelAndView.setViewName("askbook-show");
        return modelAndView;
    }

    //求购书籍 编辑前，先查找 求购书籍信息以及类别信息
    @RequestMapping("/edit.do")
    public ModelAndView edit(Integer askbook_id) throws Exception {
        ModelAndView mv=new ModelAndView();
        //求购书籍信息
        AskBook askbookInfo = askBookService.findByAskBookId(askbook_id);
        //类别信息  查找当前类别
//        Category categoryCurrent = categoryService.findById(askbookInfo.getCategory());
        // 查找当前类别之外的类别
        List<Category> categoryNotSet =  categoryService.findCategoryNotSet(askbookInfo.getCategoryInfo().getCategory_id());
        mv.addObject("askbookInfo",askbookInfo);
//        mv.addObject("categoryCurrent",categoryCurrent);
        mv.addObject("categoryNotSet",categoryNotSet);
        mv.setViewName("askbook-edit");
        return mv;
    }

    // 求购书籍信息修改
    @RequestMapping("/update.do")
    public String update( AskBook askbook,MultipartFile uploadImg,HttpServletRequest request) throws Exception {
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

            askbook.setImgUrl("../img/uploadImg/"+picName+extName);
            askBookService.update(askbook);
        }

        //没上传图片，设置默认图片
        if(uploadImg.isEmpty()){
//            askbook.setImgUrl("../img/暂无图片.png");
            askBookService.updateWithoutImg(askbook);
        }


        return "redirect:findAll.do";
    }

    //删除求购书籍
    @RequestMapping("delete.do")
    public String delete(Integer[] selectIds) throws Exception {

        askBookService.delete(selectIds);

        return "redirect:findAll.do";

    }

    //根据 求购书籍名称或卖家名称 搜索求购书籍
    @RequestMapping("/findAskBook.do")
    public ModelAndView findAskBook(String findConditions,
                                 @RequestParam(value = "page",required = true,defaultValue = "1")Integer page,
                                 @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();

        List<AskBook> findAskBook = askBookService.findAskBook(findConditions,page,pageSize);
        PageInfo pageInfo=new PageInfo(findAskBook);

        mv.addObject("findConditions",findConditions);
        mv.addObject("askbookInfo",pageInfo);

        mv.setViewName("askbook-find-list");

        return mv;
    }


}
