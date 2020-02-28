package com.liujiajun.service;

import com.liujiajun.domain.Book;
import com.liujiajun.domain.UserInfo;

import java.util.List;

public interface IBookService {


    public List<Book> findAll(int page, int pageSize) throws Exception;

    //保存
    void save(Book book);

    //根据书籍Id查找 书籍
    Book findByBookId(Integer book_id);

    //修改书籍信息
    void update(Book book);
}
