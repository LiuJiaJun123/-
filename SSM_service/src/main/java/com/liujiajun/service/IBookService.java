package com.liujiajun.service;

import com.liujiajun.domain.Book;
import com.liujiajun.domain.UserInfo;

import java.util.List;

public interface IBookService {

    List<Book> findAll() throws Exception;

    public List<Book> findAll(int page, int pageSize) throws Exception;

    //保存
    void save(Book book);

    //根据书籍Id查找 书籍
    Book findByBookId(Integer book_id);

    //修改书籍信息
    void update(Book book);

    //没有修改 书籍图片时 调用的修改方法
    void updateWithoutImg(Book book);

    //删除书籍
    void delete(String[] selectIds);

    //根据 书籍名称或卖家名称 搜索书籍
    List<Book> findBook(String findConditions, Integer page, Integer pageSize);
}
