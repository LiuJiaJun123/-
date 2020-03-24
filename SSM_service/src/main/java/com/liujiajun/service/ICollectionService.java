package com.liujiajun.service;

import javafx.print.Collation;

import java.util.List;

public interface ICollectionService {

    //根据用户id查找收藏 书籍
    List<Collation> findByUserId(Integer user_id);

    //根据用户id 和 收藏书籍id  添加收藏
    void save(Integer user_id,Integer book_id);

    //根据用户id 和 收藏书籍id 去取消收藏
    void delete(Integer user_id,Integer book_id);

}
