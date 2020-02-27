package com.liujiajun.service;

import com.liujiajun.domain.Book;
import com.liujiajun.domain.UserInfo;

import java.util.List;

public interface IBookService {


    public List<Book> findAll(int page, int pageSize) throws Exception;

    //保存
    void save(Book book);
}
