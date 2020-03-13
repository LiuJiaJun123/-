package com.liujiajun.service;

import com.liujiajun.domain.Announcement;
import com.liujiajun.domain.Book;

import java.util.List;

public interface IAnnouncementService {

    List<Announcement> findAll() throws Exception;

    public List<Announcement> findAll(int page, int pageSize) throws Exception;


    //批量删除
    void delete(Integer[] selectIds);
}
