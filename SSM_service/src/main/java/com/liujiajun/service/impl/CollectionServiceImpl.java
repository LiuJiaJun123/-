package com.liujiajun.service.impl;

import com.github.pagehelper.PageHelper;
import com.liujiajun.dao.ICollectionDao;
import com.liujiajun.domain.Collection;
import com.liujiajun.service.ICollectionService;
import javafx.print.Collation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service("collectionService")
public class CollectionServiceImpl implements ICollectionService {


    @Autowired
    private ICollectionDao collectionDao;

    //根据用户id查找收藏 书籍
    @Override
    public List<Collection> findByUserId(Integer user_id,Integer page) {
        PageHelper.startPage(page,3);
        return collectionDao.findByUserId(user_id);
    }

    //根据用户id 和 收藏书籍id  添加收藏
    @Override
    public void save(Integer user_id, Integer book_id, Date time) {
        collectionDao.save(user_id,book_id,time);
    }

    //根据用户id 和 收藏书籍id 去取消收藏
    @Override
    public void delete(Integer user_id, Integer book_id) {
        collectionDao.delete(user_id,book_id);
    }

    @Override
    public Collection findByUserIdAndBookId(Integer user_id, Integer book_id) {
        List<Collection> collectionList = collectionDao.findByUserIdAndBookId(user_id, book_id);
        if(collectionList.size()>0){
            return collectionList.get(0);
        }

        return null;
    }

    //查找所有
    @Override
    public List<Collection> findAll(Integer page, Integer pageSize) {
        PageHelper.startPage(page,pageSize);
        return collectionDao.findAll();
    }

    //根据Id查找
    @Override
    public Collection findByCollectionId(Integer collection_id) {
        return collectionDao.findByCollectionId(collection_id);
    }

    //根据id删除
    @Override
    public void deleteByCollectionId(Integer[] selectIds) {
        for (Integer collection_id : selectIds) {
            collectionDao.deleteByCollectionId(collection_id);
        }
    }

    //根据 书籍id或收藏人Id 搜索
    @Override
    public List<Collection> findCollection(String findConditions, Integer page, Integer pageSize) {
        findConditions="%"+findConditions+"%";
        PageHelper.startPage(page,pageSize);
        List<Collection> findBook = collectionDao.findCollection(findConditions);
        return findBook;
    }

}
