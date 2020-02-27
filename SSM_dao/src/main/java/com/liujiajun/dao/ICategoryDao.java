package com.liujiajun.dao;

import com.liujiajun.domain.Category;
import com.liujiajun.domain.UserInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("categoryDao")
public interface ICategoryDao {
    /**
     * 查找所有类别
     * @param page
     * @param pageSize
     * @return
     * @throws Exception
     */
    @Select("select * from category")
    public List<Category> findAll(int page, int pageSize) throws Exception;

    /**
     * 根据id查找
     * @param category_id
     * @return
     */
    @Select("select * from category where category_id = #{category_id}")
    Category findById(Integer category_id);


    /**
     * 类别信息修改
     * @param category
     */
    @Update("update category set category_name=#{category_name} where category_id = #{category_id}")
    void update(Category category);

    /**
     * 添加类别时，查看类别名是否存在
     * @param category_name
     * @return
     * @throws Exception
     */
    @Select("select * from category where category_name=#{category_name}")
    Category findNameExist(String category_name);

    /**
     * 添加类别
     * @param category
     */
    @Insert("insert into category(category_name) values(#{category_name})")
    void save(Category category);

    /**
     * 删除类别
     * @param category_id
     */
    @Delete("delete from category where category_id=#{category_id}")
    void delete(String category_id);

    /**
     * 查找类别
     * @param category_name
     * @return
     */
    @Select("select * from category where category_name like #{category_name}")
    List<Category> findByCategoryName(String category_name);
}
