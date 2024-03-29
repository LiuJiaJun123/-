package com.liujiajun.dao;

import com.liujiajun.domain.Collection;
import javafx.print.Collation;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.util.Date;
import java.util.List;

@Repository("collectionDao")
public interface ICollectionDao {


    //根据用户id查找收藏 书籍
    @Results(id = "resultMap",value = {
            @Result(column = "collection_id",property = "collection_id"),
            @Result(column = "user_id",property = "userInfo",one=@One(select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "book_id",property = "bookInfo",one=@One(select = "com.liujiajun.dao.IBookDao.findByBookId")),
            @Result(column = "time",property = "time"),
    })
    @Select("select * from collection where user_id = #{user_id}")
    List<Collection> findByUserId(Integer user_id);


    //根据用户id 和 收藏书籍id  添加收藏
    @Insert("insert into collection(user_id,book_id,time) " +
            "values(#{user_id},#{book_id},#{time})")
    void save(@Param("user_id") Integer user_id, @Param("book_id") Integer book_id, @Param("time")Date time);


    //根据用户id 和 收藏书籍id 去取消收藏
    @Delete("delete from collection where user_id = #{user_id} and book_id = #{book_id}")
    void delete(@Param("user_id") Integer user_id,@Param("book_id") Integer book_id);


    @Select("select * from collection where user_id = #{user_id} and book_id = #{book_id}")
    List<Collection> findByUserIdAndBookId(@Param("user_id") Integer user_id, @Param("book_id") Integer book_id);

    @Select("select * from collection")
    @ResultMap("resultMap")
    List<Collection> findAll();

    //根据id查找
    @Select("select * from collection where collection_id = #{collection_id}")
    @ResultMap(("resultMap"))
    Collection findByCollectionId(Integer collection_id);


    //根据id删除
    @Delete("delete from collection where collection_id=#{collection_id}")
    void deleteByCollectionId(Integer collection_id);

    //根据 书籍id或收藏人Id 搜索
    @Select("select * from collection where book_id like #{findConditions} or user_id like #{findConditions}")
    @ResultMap("resultMap")
    List<Collection> findCollection(String findConditions);
}
