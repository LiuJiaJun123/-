package com.liujiajun.service.impl;

import com.github.pagehelper.PageHelper;
import com.liujiajun.dao.IAnnouncementDao;
import com.liujiajun.domain.Announcement;
import com.liujiajun.service.IAnnouncementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("announcementService")
public class AnnouncementServiceImpl implements IAnnouncementService {

    @Autowired
    private IAnnouncementDao announcementDao;

    //查找所有
    @Override
    public List<Announcement> findAll() throws Exception {
        return announcementDao.findAll();
    }

    //查找所有
    @Override
    public List<Announcement> findAll(int page, int pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        return announcementDao.findAll();
    }

    //批量删除
    @Override
    public void delete(Integer[] selectIds) {
        for (Integer announcement_id : selectIds) {
            announcementDao.delete(announcement_id);
        }
    }

    @Override
    public void save(Announcement announcement) {
        announcementDao.save(announcement);
    }

    //根据id查找
    @Override
    public Announcement findByAnnouncementId(Integer announcement_id) {
        return announcementDao.findByAnnouncementId(announcement_id);
    }

    //修改公告信息
    @Override
    public void update(Announcement announcement) {
        announcementDao.update(announcement);
    }

    //没有修改 公告图片时 调用的修改方法
    @Override
    public void updateWithoutImg(Announcement announcement) {
        announcementDao.updateWithoutImg(announcement);
    }

    //根据 发布人名称 或 公告标题 搜索公告
    @Override
    public List<Announcement> findAnnouncement(String findConditions, Integer page, Integer pageSize) {
        findConditions="%"+findConditions+"%";
        PageHelper.startPage(page,pageSize);
        List<Announcement> findAnnouncement = announcementDao.findAnnouncement(findConditions);
        return findAnnouncement;
    }
}
