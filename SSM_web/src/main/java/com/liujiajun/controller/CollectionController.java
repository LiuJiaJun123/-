package com.liujiajun.controller;

import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.Book;
import com.liujiajun.domain.Collection;
import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.ICollectionService;
import com.liujiajun.service.IUserService;
import org.apache.ibatis.annotations.Insert;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/collection")
public class CollectionController {


    @Autowired
    private ICollectionService collectionService;
    @Autowired
    private IUserService userService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();
        //查找所有未出售的书籍 (status为1)
        List<Collection> collectionList = collectionService.findAll(page,pageSize);
        PageInfo collectionInfo=new PageInfo(collectionList);
        mv.addObject("collectionInfo",collectionInfo);
        mv.setViewName("collection-list");
        return mv;
    }


    //添加收藏
    @RequestMapping("/save.do")
    public void save(Integer book_id) throws Exception {

        ModelAndView mv=new ModelAndView();


        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);

        collectionService.save(userInfo.getId(), book_id,new Date());
    }

    //普通用户取消收藏
    @RequestMapping("/delete.do")
    public void delete(Integer book_id) throws Exception {

        ModelAndView mv=new ModelAndView();

        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);

        collectionService.delete(userInfo.getId(), book_id);
    }

    //查询是否收藏
    @RequestMapping("/search.do")
    @ResponseBody
    public int search(Integer book_id) throws Exception {

        ModelAndView mv=new ModelAndView();

        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);

        //收藏表中有数据， 已经收藏
        Collection collection = collectionService.findByUserIdAndBookId(userInfo.getId(), book_id);

        int code=0;
        if (collection!=null){
            code = 1;
        }
        return code;
    }

    //查看收藏详情之前
    @RequestMapping("/beforeDetail.do")
    public ModelAndView beforeDetail(Integer collection_id) throws Exception {

        ModelAndView mv=new ModelAndView();

        Collection collection = collectionService.findByCollectionId(collection_id);
        mv.addObject("collection",collection);
        mv.setViewName("collection-show");
        return mv;
    }

    //管理员删除收藏
    @RequestMapping("/deleteCollection.do")
    public String deleteCollection(Integer[] selectIds) throws Exception {

        collectionService.deleteByCollectionId(selectIds);
        return "redirect:findAll.do";
    }


    //根据 书籍id或收藏人Id 搜索
    @RequestMapping("/findCollection.do")
    public ModelAndView findCollection(String findConditions,
                                 @RequestParam(value = "page",required = true,defaultValue = "1")Integer page,
                                 @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();

        List<Collection> findCollection = collectionService.findCollection(findConditions,page,pageSize);
        PageInfo pageInfo=new PageInfo(findCollection);

        mv.addObject("findConditions",findConditions);
        mv.addObject("collectionInfo",pageInfo);

        mv.setViewName("collection-find-list");

        return mv;
    }


}
