package com.liujiajun.service;

import com.liujiajun.domain.Collection;
import javafx.print.Collation;

import java.util.Date;
import java.util.List;

public interface ICollectionService {

    //根据用户id查找收藏 书籍
    List<Collection> findByUserId(Integer user_id,Integer page);

    //根据用户id 和 收藏书籍id  添加收藏
    void save(Integer user_id, Integer book_id, Date time);

    //根据用户id 和 收藏书籍id 去取消收藏
    void delete(Integer user_id,Integer book_id);

    //查询是否已经收藏
    Collection findByUserIdAndBookId(Integer user_id, Integer book_id);
}
