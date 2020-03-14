package com.liujiajun.controller;

import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.Announcement;
import com.liujiajun.domain.Book;
import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.IAnnouncementService;
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
@RequestMapping("/announcement")
public class AnnouncementController {

    @Autowired
    private IAnnouncementService announcementService;
    @Autowired
    private IUserService userService;

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

    //添加公告
    @RequestMapping("/save.do")
    public String save(Announcement announcement, MultipartFile uploadImg, HttpServletRequest request) throws Exception {

        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);
        announcement.setUserInfo(userInfo);

        //有上传图片
        if(!uploadImg.isEmpty()){

            // 文件保存路径
            String path = request.getSession().getServletContext().getRealPath("");
            File newFile = new File(path + "img/announcement_img/");  //为图片文件夹下的图片存放文件夹目录
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
            String filePath =  path+"img\\announcement_img\\"+picName+extName;
            //保存到本地磁盘
            uploadImg.transferTo(new File(filePath));

            announcement.setImgUrl("../img/announcement_img/"+picName+extName);
        }

        //没上传图片，设置默认图片
        if(uploadImg.isEmpty()){
            announcement.setImgUrl("../img/暂无图片.png");
        }

        announcementService.save(announcement);
        return "redirect:findAll.do";
    }

    //删除公告
    @RequestMapping("delete.do")
    public String delete(Integer[] selectIds) throws Exception {

        announcementService.delete(selectIds);
        return "redirect:findAll.do";

    }

    //公告编辑前，先查找 公告信息
    @RequestMapping("/edit.do")
    public ModelAndView edit(Integer announcement_id) throws Exception {
        ModelAndView mv=new ModelAndView();
        //公告信息
        Announcement announcementInfo = announcementService.findByAnnouncementId(announcement_id);
        mv.addObject("announcementInfo",announcementInfo);
        mv.setViewName("announcement-edit");
        return mv;
    }

    // 公告信息修改
    @RequestMapping("/update.do")
    public String update( Announcement announcement,MultipartFile uploadImg,HttpServletRequest request) throws Exception {
        //有上传图片
        if(!uploadImg.isEmpty()){

            // 文件保存路径
            String path = request.getSession().getServletContext().getRealPath("");
            File newFile = new File(path + "img/announcement_img/");  //为图片文件夹下的图片存放文件夹目录
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
            String filePath =  path+"img\\announcement_img\\"+picName+extName;
            //保存到本地磁盘
            uploadImg.transferTo(new File(filePath));

            announcement.setImgUrl("../img/announcement_img/"+picName+extName);
            announcementService.update(announcement);
        }

        //没上传图片
        if(uploadImg.isEmpty()){
            announcementService.updateWithoutImg(announcement);
        }

        return "redirect:findAll.do";
    }


    //查看公告详情之前，先根据公告id 查找公告信息
    @RequestMapping("/beforeDetail.do")
    public ModelAndView beforeDetail(Integer announcement_id) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        //查找公告信息
        Announcement announcement = announcementService.findByAnnouncementId(announcement_id);
        modelAndView.addObject("announcement",announcement);
        modelAndView.setViewName("announcement-show");
        return modelAndView;
    }

    //根据 发布人名称 或 公告标题 搜索公告
    @RequestMapping("/findAnnouncement.do")
    public ModelAndView findAnnouncement(String findConditions,
                                 @RequestParam(value = "page",required = true,defaultValue = "1")Integer page,
                                 @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();

        List<Announcement> findAnnouncement = announcementService.findAnnouncement(findConditions,page,pageSize);
        PageInfo pageInfo=new PageInfo(findAnnouncement);

        mv.addObject("findConditions",findConditions);
        mv.addObject("announcementInfo",pageInfo);

        mv.setViewName("announcement-find-list");

        return mv;
    }


}
