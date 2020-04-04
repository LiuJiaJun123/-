package com.liujiajun.service;

import com.liujiajun.domain.Book;
import com.liujiajun.domain.Orders;

import java.util.List;

public interface IOrdersService {


    public List<Orders> findAll(int page,int pageSize) throws Exception;


    //查询订单详情
    public Orders findById(Integer orders_id) throws Exception;


    //删除订单
    void delete(Integer[] selectIds);

    //添加订单
    void save(Orders orders);

    //修改订单
    void update(Orders orders);

    //查找订单
    List<Orders> findOrders(String findConditions, Integer page, Integer pageSize);
}
