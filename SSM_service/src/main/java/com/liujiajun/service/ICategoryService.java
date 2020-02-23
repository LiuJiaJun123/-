package com.liujiajun.service;

import com.liujiajun.domain.Category;
import com.liujiajun.domain.UserInfo;
import org.springframework.stereotype.Service;

import java.util.List;

public interface ICategoryService {

    public List<Category> findAll(int page, int pageSize) throws Exception;

    //根据id查找类别
    public Category findById(String category_id) throws Exception;

    //类别信息修改
    void update(Category category);

//    添加类别时，查看类别名是否已经已经存在
    Boolean findNameExist(String category_name) throws Exception;

//    添加类别
    void save(Category category) throws Exception;
}
