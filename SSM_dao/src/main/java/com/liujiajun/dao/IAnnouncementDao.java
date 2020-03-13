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
            @Result(column = "status",property = "status")
    })
    List<Announcement> findAll();

    //删除
    @Delete("delete from announcement where announcement_id=#{announcement_id}")
    void delete(Integer announcement_id);
}
