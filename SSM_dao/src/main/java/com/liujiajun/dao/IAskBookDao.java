package com.liujiajun.dao;

import com.liujiajun.domain.AskBook;
import com.liujiajun.domain.Book;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("askBookDao")
public interface IAskBookDao {

    /**
     * 查找所有
     * @return
     */
    @Select("select * from askbook where status = 1 ")
    @Results({
            @Result(id = true,column = "askbook_id",property = "askbook_id"),
            @Result(column = "user_id",property = "userInfo",one = @One( select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "askbook_name",property = "askbook_name"),
            @Result(column = "category",property = "categoryInfo",one = @One( select = "com.liujiajun.dao.ICategoryDao.findById")),
            @Result(column = "author",property = "author"),
            @Result(column = "appearance",property = "appearance"),
            @Result(column = "description",property = "description"),
            @Result(column = "imgUrl",property = "imgUrl"),
            @Result(column = "time",property = "time"),
            @Result(column = "status",property = "status")
    })
    List<AskBook> findAll();


    /**
     * 保存
     * @param book
     */
    @Insert("insert into askbook(user_id,askbook_name,category,author,appearance,description,imgUrl,time,status) " +
            "values(#{userInfo.id},#{askbook_name},#{categoryInfo.category_id},#{author},#{appearance},#{description},#{imgUrl},#{time},#{status})")
    void save(AskBook askBook);

    //根据书籍Id查找 书籍
    @Select("select * from askbook where askbook_id=#{askbook_id}")
    @Results({
            @Result(id = true,column = "askbook_id",property = "askbook_id"),
            @Result(column = "user_id",property = "userInfo",one = @One( select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "askbook_name",property = "askbook_name"),
            @Result(column = "category",property = "categoryInfo",one = @One( select = "com.liujiajun.dao.ICategoryDao.findById")),
            @Result(column = "author",property = "author"),
            @Result(column = "appearance",property = "appearance"),
            @Result(column = "description",property = "description"),
            @Result(column = "imgUrl",property = "imgUrl"),
            @Result(column = "time",property = "time"),
            @Result(column = "status",property = "status")
    })
    AskBook findByAskBookId(Integer askbook_id);

    //修改图片信息
    @Update({"update askbook set askbook_name=#{askbook_name},category=#{categoryInfo.category_id},author=#{author}," +
            "appearance=#{appearance},description=#{description},imgUrl=#{imgUrl}" +
            ",status=#{status} where askbook_id=#{askbook_id}"})
    void update(AskBook askBook);

    //没有修改 书籍图片时 调用的修改方法
    @Update({"update askbook set askbook_name=#{askbook_name},category=#{categoryInfo.category_id},author=#{author}," +
            "appearance=#{appearance},description=#{description}" +
            ",status=#{status} where askbook_id=#{askbook_id}"})
    void updateWithoutImg(AskBook askBook);

    //删除书籍
    @Delete("delete from askbook where askbook_id=#{askbook_id}")
    void delete(Integer askbook_id);

    //根据书籍名称或卖家名称 模糊搜索书籍
    @Select("select * from askbook where askbook_name like #{findConditions} " +
            "or user_id in (select id from users where username like #{findConditions}) " +
            "or category in (select category_id from category where category_name like #{findConditions})")
    @Results({
            @Result(id = true,column = "askbook_id",property = "askbook_id"),
            @Result(column = "user_id",property = "userInfo",one = @One( select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "askbook_name",property = "askbook_name"),
            @Result(column = "category",property = "categoryInfo",one = @One( select = "com.liujiajun.dao.ICategoryDao.findById")),
            @Result(column = "author",property = "author"),
            @Result(column = "appearance",property = "appearance"),
            @Result(column = "description",property = "description"),
            @Result(column = "imgUrl",property = "imgUrl"),
            @Result(column = "time",property = "time"),
            @Result(column = "status",property = "status")
    })
    List<AskBook> findAskBook(String findConditions);

    //根据类别ID 查找书籍，删除类别时调用
    @Select("select * from askbook where category=#{category_id}")
    List<AskBook> findByCategoryId(Integer category_id);

    //订单添加后，要 修改对应书籍的状态为0
    @Update("update askbook set status=0 where askbook_id=#{askbook_id}")
    void updateStatus(Integer askbook_id);
}
