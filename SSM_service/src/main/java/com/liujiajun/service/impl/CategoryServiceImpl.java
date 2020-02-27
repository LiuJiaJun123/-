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
    public Category findById(Integer category_id) throws Exception {
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

//    添加类别
    @Override
    public void save(Category category) throws Exception {
        categoryDao.save(category);
    }

    //删除类别
    @Override
    public void delete(String[] selectIds) {
        //先判断该类别下是否有书籍，如果有，给出错误提示


        //如果没有，则进行删除
        for (String category_id : selectIds) {
            categoryDao.delete(category_id);
        }

    }

    //查找类别
    @Override
    public List<Category> findByCategoryName(String category_name, Integer page, Integer pageSize) {
        category_name="%"+category_name+"%";
        PageHelper.startPage(page,pageSize);
        List<Category> findCategory = categoryDao.findByCategoryName(category_name);
        return findCategory;
    }
}
