package com.liujiajun.controller;

import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.Announcement;
import com.liujiajun.domain.Book;
import com.liujiajun.service.IAnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/announcement")
public class AnnouncementController {

    @Autowired
    private IAnnouncementService announcementService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();
        //查找所有
        List<Announcement> announcementList = announcementService.findAll(page,pageSize);
        PageInfo announcementInfo=new PageInfo(announcementList);
        mv.addObject("announcementInfo",announcementInfo);
        mv.setViewName("announcement-list");
        return mv;
    }



}
