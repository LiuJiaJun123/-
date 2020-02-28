package com.liujiajun.service.impl;

import com.github.pagehelper.PageHelper;
import com.liujiajun.dao.IBookDao;
import com.liujiajun.domain.Book;
import com.liujiajun.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bookService")
public class BookServiceImpl implements IBookService {

    @Autowired
    private IBookDao bookDao;

    @Override
    public List<Book> findAll(int page, int pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        return bookDao.findAll();
    }

//    保存
    @Override
    public void save(Book book) {
        bookDao.save(book);
    }

    //根据书籍Id查找 书籍
    @Override
    public Book findByBookId(Integer book_id) {
        return bookDao.findByBookId(book_id);
    }

    //修改书籍信息
    @Override
    public void update(Book book) {
        bookDao.update(book);
    }

    //没有修改 书籍图片时 调用的修改方法
    @Override
    public void updateWithoutImg(Book book) {
        bookDao.updateWithoutImg(book);
    }

    //删除书籍
    @Override
    public void delete(String[] selectIds) {
        for (String book_id : selectIds) {
            bookDao.delete(book_id);
        }
    }


}
