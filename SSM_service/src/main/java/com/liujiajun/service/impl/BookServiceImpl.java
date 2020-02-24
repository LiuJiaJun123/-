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


}
