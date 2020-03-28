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
    @Select("select * from askbook where status = 1 order by time desc ")
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
     * @param askBook
     */
    @Insert("insert into askbook(user_id,askbook_name,category,author,appearance,description,imgUrl,time,status) " +
            "values(#{userInfo.id},#{askbook_name},#{categoryInfo.category_id},#{author},#{appearance},#{description},#{imgUrl},#{time},#{status})")
    void save(AskBook askBook);

    //根据书籍Id查找 书籍
    @Select("select * from askbook where askbook_id=#{askbook_id}")
    @Results(id = "resultMap",value = {
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
    @ResultMap("resultMap")
    List<AskBook> findAskBook(String findConditions);

    //根据类别ID 查找书籍，删除类别时调用
    @Select("select * from askbook where category=#{category_id}")
    List<AskBook> findByCategoryId(Integer category_id);

    //订单添加后，要 修改对应书籍的状态为0
    @Update("update askbook set status=0 where askbook_id=#{askbook_id}")
    void updateStatus(Integer askbook_id);


    //根据用户id查找求购书籍 (我的求购书籍 页面)
    @Select("select * from askbook where user_id=#{user_id} and status = 1 order by askbook_id desc")
    @ResultMap("resultMap")
    List<AskBook> findByUserId(Integer user_id);


}
