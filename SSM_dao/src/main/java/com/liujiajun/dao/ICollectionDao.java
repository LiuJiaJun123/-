package com.liujiajun.dao;

import javafx.print.Collation;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository("collectionDao")
public interface ICollectionDao {


    //根据用户id查找收藏 书籍
    @Results(id = "resultMap",value = {
            @Result(column = "user_id",property = "userInfo",one=@One(select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "book_id",property = "bookInfo",one=@One(select = "com.liujiajun.dao.IBookDao.findByBookId")),
            @Result(column = "sellSatus",property = "sellStatus")
    })
    @Select("select * from collection where user_id = #{user_id}")
    List<Collation> findByUserId(Integer user_id);


    //根据用户id 和 收藏书籍id  添加收藏
    @Insert("insert into collection(user_id,book_id) " +
            "values(#{user_id},#{book_id})")
    void save(@Param("user_id") Integer user_id,@Param("book_id") Integer book_id);


    //根据用户id 和 收藏书籍id 去取消收藏
    @Delete("delete from collection where user_id = #{user_id} and book_id = #{book_id}")
    void delete(@Param("user_id") Integer user_id,@Param("book_id") Integer book_id);



}
