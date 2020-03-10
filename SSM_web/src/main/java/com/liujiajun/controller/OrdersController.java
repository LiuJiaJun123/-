package com.liujiajun.controller;

import com.github.pagehelper.PageInfo;
import com.liujiajun.domain.*;
import com.liujiajun.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Autowired
    private IOrdersService ordersService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IMemberService memberService;

    @Autowired
    private IBookService bookService;
    @Autowired
    private IUserService userService;

    //查找所有
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value = "page",required = true,defaultValue = "1")Integer page,
                                @RequestParam(value = "pageSize",required = true,defaultValue = "4")Integer pageSize) throws Exception{

        ModelAndView mv=new ModelAndView();
        List<Orders> ordersList = ordersService.findAll(page,pageSize);

        PageInfo pageInfo = new PageInfo(ordersList);


        mv.addObject("pageInfo",pageInfo);

//        mv.addObject("ordersList",ordersList);
        mv.setViewName("orders-list");
        return mv;
    }

    //添加订单
    @RequestMapping(value = "/save.do",method = RequestMethod.GET)
    public ModelAndView saveUI() throws Exception {

        //查找所有书籍
        List<Book> bookList = bookService.findAll();
        //查找所有买家
        List<UserInfo> userList = userService.findUserExpectAdmin();

        ModelAndView mv=new ModelAndView();
        mv.addObject("bookList",bookList);
        mv.addObject("userList",userList);

        mv.setViewName("orders-add");
        return mv;

    }

    //添加订单
    @RequestMapping(value = "/save.do",method = RequestMethod.POST)
    public ModelAndView save(Orders orders) throws Exception {   //String orderNum

        //添加订单
        ordersService.save(orders);
        //订单添加后，书籍列表要 修改对应书籍的状态
        bookService.sell(orders.getBook().getBook_id());

        ModelAndView mv=new ModelAndView();
        mv.setViewName("redirect:findAll.do");
        return mv;
    }

    //修改订单
    @RequestMapping(value = "/update.do",method = RequestMethod.GET)
    public ModelAndView update(Integer orders_id)throws Exception{

        //订单
        Orders orders = ordersService.findById(orders_id);

//        //查找所有产品
//        List<Book> bookList = bookService.findAll();

        //查找所有买家
        List<UserInfo> userList = userService.findUserExpectAdmin();

        ModelAndView mv=new ModelAndView();
        mv.addObject("orders",orders);
//        mv.addObject("bookList",bookList);
        mv.addObject("userList",userList);


        mv.setViewName("orders-update");
        return mv;
    }

    //修改订单
    @RequestMapping(value = "/update.do",method = RequestMethod.POST)
    public ModelAndView update(Orders orders) throws Exception {

        //修改订单
        ordersService.update(orders);

        ModelAndView mv=new ModelAndView();
        mv.setViewName("redirect:findAll.do");
        return mv;
    }


    //删除订单
    @RequestMapping("/delete.do")
    public String delete(Integer[] selectIds){

        ordersService.delete(selectIds);
        return "redirect:findAll.do";

    }



    //查询订单详情
    @RequestMapping("/findById.do")
    public ModelAndView findById(Integer orders_id)throws Exception{
        ModelAndView mv=new ModelAndView();
        Orders orders = ordersService.findById(orders_id);
        mv.addObject("orders",orders);
        mv.setViewName("orders-show");
        return mv;
    }


    //搜索订单
    @RequestMapping("/findOrders.do")
    public ModelAndView findOrders(Orders orders) throws Exception {

        ModelAndView mv=new ModelAndView();

//        List<Orders> findOrders = ordersService.searchByOrderNum(orders.getOrderNum());
//
//        mv.addObject("findOrderNum",orders.getOrderNum());
//        mv.addObject("findOrders",findOrders);
        mv.setViewName("orders-find-list");

        return mv;

    }




}
