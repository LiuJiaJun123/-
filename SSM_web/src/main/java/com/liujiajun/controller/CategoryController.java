package com.liujiajun.controller;

import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.Category;
import com.liujiajun.domain.CheckUsername;
import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.ICategoryService;
import com.liujiajun.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private ICategoryService categoryService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();
        List<Category> categoryList = categoryService.findAll(page,pageSize);
        PageInfo categoryInfo=new PageInfo(categoryList);
        mv.addObject("categoryInfo",categoryInfo);
        mv.setViewName("category-list");
        return mv;
    }

    /**
     * 用户信息编辑
     * @return
     */
    @RequestMapping("/edit.do")
    public ModelAndView edit(String category_id) throws Exception {
        ModelAndView mv=new ModelAndView();
        //查找要编辑的种类信息
        Category category = categoryService.findById(category_id);
        mv.addObject("category",category);
        mv.setViewName("category-edit");
        return mv;
    }

    /**
     * 类别信息修改
     * @return
     */
    @RequestMapping("/update.do")
    public String update(Category category) throws Exception {

        ModelAndView mv=new ModelAndView();
        //用户信息修改
        categoryService.update(category);
        //角色信息修改
        return "redirect:findAll.do";

    }

    /**
     * 添加类别时，查看类别名是否已经已经存在
     * @param checkUsername
     * @return
     * @throws Exception
     */
    @RequestMapping("/findByName.do")
    @ResponseBody
    public CheckUsername findByName(@RequestBody CheckUsername checkUsername) throws Exception{

        Boolean flag = categoryService.findNameExist(checkUsername.getUsername());
        if(!flag){
            //用户已经存在
            checkUsername.setFlag(false);
            checkUsername.setErrorMsg("该类别名已经存在，请重新输入！");
        }else {
            //可以注册
            checkUsername.setFlag(true);
            checkUsername.setErrorMsg("");
        }
        return checkUsername;
    }

    //添加类别
    @RequestMapping("/save.do")
    public String save(Category category) throws Exception {

        ModelAndView mv=new ModelAndView();
        categoryService.save(category);
        //因为id是随机生成的，所以要根据姓名查找用户
//        userInfo= categoryService.findByName(userInfo.getUsername());
        return "redirect:findAll.do";

    }

    //删除类别
    @RequestMapping("delete.do")
    public String delete(String[] selectIds) throws Exception {

        categoryService.delete(selectIds);

        return "redirect:findAll.do";

    }

}
