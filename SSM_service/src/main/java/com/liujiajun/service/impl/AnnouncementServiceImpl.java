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
}
