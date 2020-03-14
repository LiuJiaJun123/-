package com.liujiajun.service.impl;

import com.github.pagehelper.PageHelper;
import com.liujiajun.dao.IOpinionDao;
import com.liujiajun.domain.Opinion;
import com.liujiajun.service.IOpinionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("opinionService")
public class OpinionServiceImpl implements IOpinionService {

    @Autowired
    private IOpinionDao opinionDao;

    //查找所有
    @Override
    public List<Opinion> findAll() throws Exception {
        return opinionDao.findAll();
    }

    //查找所有
    @Override
    public List<Opinion> findAll(int page, int pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        return opinionDao.findAll();
    }

    //批量删除
    @Override
    public void delete(Integer[] selectIds) {
        for (Integer opinion_id : selectIds) {
            opinionDao.delete(opinion_id);
        }
    }

    @Override
    public void save(Opinion opinion) {
        opinionDao.save(opinion);
    }

    //根据id查找
    @Override
    public Opinion findByOpinionId(Integer opinion_id) {
        return opinionDao.findByOpinionId(opinion_id);
    }

    //修改
    @Override
    public void update(Opinion opinion) {
        opinionDao.update(opinion);
    }

    //根据 发布人名称 或 公告标题 搜索公告
    @Override
    public List<Opinion> findOpinion(String findConditions, Integer page, Integer pageSize) {
        findConditions="%"+findConditions+"%";
        PageHelper.startPage(page,pageSize);
        List<Opinion> findOpinion = opinionDao.findOpinion(findConditions);
        return findOpinion;
    }
}
