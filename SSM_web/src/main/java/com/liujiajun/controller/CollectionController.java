package com.liujiajun.controller;

import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.ICollectionService;
import com.liujiajun.service.IUserService;
import org.apache.ibatis.annotations.Insert;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/collection")
public class CollectionController {


    @Autowired
    private ICollectionService collectionService;
    @Autowired
    private IUserService userService;

    //添加收藏
    @RequestMapping("/save.do")
    public void save(Integer book_id) throws Exception {

        ModelAndView mv=new ModelAndView();

        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);

        collectionService.save(userInfo.getId(), book_id);
    }


    //取消收藏
    @RequestMapping("/delete.do")
    public void delete(Integer book_id) throws Exception {

        ModelAndView mv=new ModelAndView();

        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);

        collectionService.delete(userInfo.getId(), book_id);
    }

}
