package com.liujiajun.service.impl;

import com.github.pagehelper.PageHelper;
import com.liujiajun.dao.ICategoryDao;
import com.liujiajun.domain.Category;
import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    private ICategoryDao categoryDao;

    @Override
    public List<Category> findAll(int page, int pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        return categoryDao.findAll(page,pageSize);
    }

    //根据id查找类别
    @Override
    public Category findById(String category_id) throws Exception {
        return categoryDao.findById(category_id);
    }

    //类别信息修改
    @Override
    public void update(Category category) {
        categoryDao.update(category);
    }

//    添加类别时，查看类别名是否已经已经存在
    @Override
    public Boolean findNameExist(String category_name) throws Exception {
        Category category = categoryDao.findNameExist(category_name);
        if(category!=null){
            //用户名已经存在，不可注册
            return false;
        }
        //用户名不存在，可以注册
        return true;
    }
}
