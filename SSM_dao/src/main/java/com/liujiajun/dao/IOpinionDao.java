package com.liujiajun.dao;

import com.liujiajun.domain.Opinion;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("opinionDao")
public interface IOpinionDao {

    /**
     * 查找所有
     * @return
     */
    @Select("select * from opinion")
    @Results(id = "resultMap",value = {
            @Result(id = true,column = "opinion_id",property = "opinion_id"),
            @Result(column = "user_id",property = "userInfo",one = @One( select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "title",property = "title"),
            @Result(column = "description",property = "description"),
            @Result(column = "time",property = "time")
    })
    List<Opinion> findAll();

    //删除
    @Delete("delete from opinion where opinion_id=#{opinion_id}")
    void delete(Integer opinion_id);

    @Insert("insert into opinion(user_id,title,description,time) " +
            "values(#{userInfo.id},#{title},#{description},#{time})")
    void save(Opinion opinion);

    //根据id查找
    @Select("select * from opinion where opinion_id=#{opinion_id}")
    @ResultMap("resultMap")
    Opinion findByOpinionId(Integer opinion_id);

    //修改
    @Update({"update opinion set title=#{title},description=#{description}" +
            ",status=#{status} where opinion_id=#{opinion_id}"})
    void update(Opinion opinion);



    //根据 发布人名称 或 意见标题 搜索公告
    @Select("select * from opinion where title like #{findConditions} " +
            "or user_id in (select id from users where username like #{findConditions}) " )
    @ResultMap("resultMap")
    List<Opinion> findOpinion(String findConditions);
}
