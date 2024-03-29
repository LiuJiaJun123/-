package com.liujiajun.service;

import com.liujiajun.domain.Category;
import com.liujiajun.domain.UserInfo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ICategoryService {

    public List<Category> findAll() throws Exception;

    public List<Category> findAll(int page, int pageSize) throws Exception;

    //根据id查找类别
    public Category findById(Integer category_id) throws Exception;

    //类别信息修改
    void update(Category category);

//    添加类别时，查看类别名是否已经已经存在
    Boolean findNameExist(String category_name) throws Exception;

//    添加类别
    void save(Category category) throws Exception;

    //批量删除类别
    void delete(Integer[] selectIds) throws Exception;

    //查找类别
    List<Category> findByCategoryName(String category_name, Integer page, Integer pageSize);

    //书籍编辑时，查找当前类别之外的类别
    List<Category> findCategoryNotSet(Integer category_id);
}
