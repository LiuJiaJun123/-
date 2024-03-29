package com.liujiajun.service;

import com.liujiajun.domain.Announcement;
import com.liujiajun.domain.Book;

import java.util.List;

public interface IAnnouncementService {

    List<Announcement> findAll() throws Exception;

    //查找所有
    public List<Announcement> findAll(int page, int pageSize) throws Exception;

    //查找所有status为1
    public List<Announcement> findAllOpen(int page, int pageSize) throws Exception;

    //批量删除
    void delete(Integer[] selectIds);

    //保存
    void save(Announcement announcement);

    //根据id查找
    Announcement findByAnnouncementId(Integer announcement_id);

    //修改公告信息
    void update(Announcement announcement);

    //没有修改 公告图片时 调用的修改方法
    void updateWithoutImg(Announcement announcement);

    //根据 发布人名称 或 公告标题 搜索公告
    List<Announcement> findAnnouncement(String findConditions, Integer page, Integer pageSize);
}
