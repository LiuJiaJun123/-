package com.liujiajun.controller;

import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.Opinion;
import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.IOpinionService;
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
@RequestMapping("/opinion")
public class OpinionController {

    @Autowired
    private IOpinionService opinionService;
    @Autowired
    private IUserService userService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                                @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();
        //查找所有
        List<Opinion> opinionList = opinionService.findAll(page,pageSize);
        PageInfo opinionInfo=new PageInfo(opinionList);
        mv.addObject("opinionInfo",opinionInfo);
        mv.setViewName("opinion-list");
        return mv;
    }

    //添加用户意见
    @RequestMapping("/save.do")
    public String save(Opinion opinion) throws Exception {

        //获取当前用户
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        UserInfo userInfo = userService.findByName(username);
        opinion.setUserInfo(userInfo);

        opinionService.save(opinion);
        return "redirect:findAll.do";
    }

    //删除用户意见
    @RequestMapping("delete.do")
    public String delete(Integer[] selectIds) throws Exception {

        opinionService.delete(selectIds);
        return "redirect:findAll.do";

    }

    //用户意见编辑前，先查找 用户意见信息
    @RequestMapping("/edit.do")
    public ModelAndView edit(Integer opinion_id) throws Exception {
        ModelAndView mv=new ModelAndView();
        //用户意见信息
        Opinion opinionInfo = opinionService.findByOpinionId(opinion_id);
        mv.addObject("opinionInfo",opinionInfo);
        mv.setViewName("opinion-edit");
        return mv;
    }

    // 用户意见信息修改
    @RequestMapping("/update.do")
    public String update( Opinion opinion) throws Exception {

        opinionService.update(opinion);
        return "redirect:findAll.do";
    }


    //查看用户意见详情之前，先根据用户意见id 查找用户意见信息
    @RequestMapping("/beforeDetail.do")
    public ModelAndView beforeDetail(Integer opinion_id) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        //查找用户意见信息
        Opinion opinion = opinionService.findByOpinionId(opinion_id);
        modelAndView.addObject("opinion",opinion);
        modelAndView.setViewName("opinion-show");
        return modelAndView;
    }

    //根据 发布人名称 或 用户意见标题 搜索用户意见
    @RequestMapping("/findOpinion.do")
    public ModelAndView findOpinion(String findConditions,
                                 @RequestParam(value = "page",required = true,defaultValue = "1")Integer page,
                                 @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception {

        ModelAndView mv=new ModelAndView();

        List<Opinion> findOpinion = opinionService.findOpinion(findConditions,page,pageSize);
        PageInfo pageInfo=new PageInfo(findOpinion);

        mv.addObject("findConditions",findConditions);
        mv.addObject("opinionInfo",pageInfo);

        mv.setViewName("opinion-find-list");

        return mv;
    }


}
