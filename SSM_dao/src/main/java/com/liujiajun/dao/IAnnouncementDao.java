package com.liujiajun.dao;

import com.liujiajun.domain.Announcement;
import com.liujiajun.domain.Book;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("announcementDao")
public interface IAnnouncementDao {

    /**
     * 查找所有
     * @return
     */
    @Select("select * from announcement")
    @Results(id = "resultMap",value = {
            @Result(id = true,column = "announcement_id",property = "announcement_id"),
            @Result(column = "user_id",property = "userInfo",one = @One( select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "title",property = "title"),
            @Result(column = "description",property = "description"),
            @Result(column = "imgUrl",property = "imgUrl"),
            @Result(column = "time",property = "time"),
            @Result(column = "status",property = "status")
    })
    List<Announcement> findAll();

    //删除
    @Delete("delete from announcement where announcement_id=#{announcement_id}")
    void delete(Integer announcement_id);

    @Insert("insert into announcement(user_id,title,description,imgUrl,time,status) " +
            "values(#{userInfo.id},#{title},#{description},#{imgUrl},#{time},#{status})")
    void save(Announcement announcement);

    //根据id查找
    @Select("select * from announcement where announcement_id=#{announcement_id}")
    @ResultMap("resultMap")
    Announcement findByAnnouncementId(Integer announcement_id);

    //没有修改 公告图片时 调用的修改方法
    @Update({"update announcement set title=#{title},description=#{description}" +
            ",status=#{status} where announcement_id=#{announcement_id}"})
    void updateWithoutImg(Announcement announcement);

    //有修改图片信息时，调用的修改方法
    @Update({"update announcement set title=#{title},description=#{description},imgUrl=#{imgUrl}" +
            ",status=#{status} where announcement_id=#{announcement_id}"})
    void update(Announcement announcement);


}
