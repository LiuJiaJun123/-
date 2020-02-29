package com.liujiajun.dao;

import com.liujiajun.domain.Book;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("bookDao")
public interface IBookDao {

    /**
     * 查找所有
     * @return
     */
    @Select("select * from book")
    @Results({
            @Result(id = true,column = "book_id",property = "book_id"),
            @Result(column = "user_id",property = "userInfo",one = @One( select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "orderTime",property = "orderTime"),
            @Result(column = "orderStatus",property = "orderStatus"),
            @Result(column = "peopleCount",property = "peopleCount"),
            @Result(column = "payType",property = "payType"),
            @Result(column = "orderDesc",property = "orderDesc"),
            @Result(column = "productId",property = "product")
    })
    List<Book> findAll();


    /**
     * 保存
     * @param book
     */
    @Insert("insert into book(user_id,book_name,category,author,price,appearance,description,imgUrl,time,status) " +
            "values(#{userInfo.id},#{book_name},#{category},#{author},#{price},#{appearance},#{description},#{imgUrl},#{time},#{status})")
    void save(Book book);

    //根据书籍Id查找 书籍
    @Select("select * from book where book_id=#{book_id}")
    @Results({
            @Result(id = true,column = "book_id",property = "book_id"),
            @Result(column = "user_id",property = "userInfo",one = @One( select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "orderTime",property = "orderTime"),
            @Result(column = "orderStatus",property = "orderStatus"),
            @Result(column = "peopleCount",property = "peopleCount"),
            @Result(column = "payType",property = "payType"),
            @Result(column = "orderDesc",property = "orderDesc"),
            @Result(column = "productId",property = "product")
    })
    Book findByBookId(Integer book_id);

    //修改图片信息
    @Update({"update book set book_name=#{book_name},category=#{category},author=#{author}," +
            "price=#{price},appearance=#{appearance},description=#{description},imgUrl=#{imgUrl}" +
            ",status=#{status} where book_id=#{book_id}"})
    void update(Book book);

    //没有修改 书籍图片时 调用的修改方法
    @Update({"update book set book_name=#{book_name},category=#{category},author=#{author}," +
            "price=#{price},appearance=#{appearance},description=#{description}" +
            ",status=#{status} where book_id=#{book_id}"})
    void updateWithoutImg(Book book);

    //删除书籍
    @Delete("delete from book where book_id=#{book_id}")
    void delete(String book_id);

    //根据书籍名称或卖家名称 模糊搜索书籍
    @Select("select * from book where book_name like #{findConditions} or user_id in (select id from users where username like #{findConditions})")
    List<Book> findBook(String findConditions);
}
