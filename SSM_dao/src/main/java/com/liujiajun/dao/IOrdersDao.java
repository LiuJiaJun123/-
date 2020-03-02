package com.liujiajun.dao;

import com.liujiajun.domain.Orders;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ordersDao")
public interface IOrdersDao {

    @Select("select * from orders order by orders_id")
    @Results({
            @Result(id = true,column = "orders_id",property = "orders_id"),
            @Result(column = "book_id",property = "book",one = @One( select = "com.liujiajun.dao.IBookDao.findByBookId")),
            @Result(column = "buyer_id",property = "buyer",one = @One( select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "order_time",property = "order_time"),
            @Result(column = "description",property = "description")
    })
    public List<Orders> findAll() throws Exception;


    @Select("select * from orders where orders_id=#{orders_id}")
    @Results({
            @Result(id = true,column = "orders_id",property = "orders_id"),
            @Result(column = "book_id",property = "book",one = @One( select = "com.liujiajun.dao.IBookDao.findByBookId")),
            @Result(column = "buyer_id",property = "buyer",one = @One( select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "order_time",property = "order_time"),
            @Result(column = "description",property = "description")
    })
    public Orders findById(Integer orders_id) throws Exception;

    //批量删除
    @Delete("delete from orders where orders_id=#{orders_id}")
    void delete(Integer orders_id);


    //添加订单
    @Insert("insert into orders(book_id,buyer_id,description,order_time) " +
            "values(#{book.book_id},#{buyer.id},#{description},#{order_time} )")
    void save(Orders orders);


    //根据订单编号查询订单
    @Select("select * from orders where orderNum=#{orderNum}")
    Orders findByOrderNum(String orderNum);


    //根据订单编号查询订单  （搜索的时候按照订单编号搜索）
    @Select("select * from orders where orderNum like #{orderNum}")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "orderNum",property = "orderNum"),
            @Result(column = "orderTime",property = "orderTime"),
            @Result(column = "orderStatus",property = "orderStatus"),
            @Result(column = "peopleCount",property = "peopleCount"),
            @Result(column = "payType",property = "payType"),
            @Result(column = "orderDesc",property = "orderDesc"),
            @Result(column = "productId",property = "product",one = @One( select = "com.liujiajun.dao.IProductDao.findById"))
    })
    List<Orders> searchByOrderNum(String orderNum);


    //修改订单
    @Update("update orders set buyer_id=#{buyer.id},description=#{description} where orders_id=#{orders_id}")
    void update(Orders orders);


}
