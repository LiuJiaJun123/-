package com.liujiajun.dao;

import com.liujiajun.domain.Book;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("bookDao")
public interface IBookDao {

    /**
     * 查找所有
     * @return
     */
    @Select("select * from book")
    List<Book> findAll();


}
