package com.liujiajun.service;

import com.liujiajun.domain.Opinion;

import java.util.List;

public interface IOpinionService {

    List<Opinion> findAll() throws Exception;

    List<Opinion> findAll(int page, int pageSize) throws Exception;


    //批量删除
    void delete(Integer[] selectIds);

    //保存
    void save(Opinion opinion);

    //根据id查找
    Opinion findByOpinionId(Integer opinion_id);

    //修改
    void update(Opinion opinion);

    //根据 发布人名称 或 公告标题 搜索
    List<Opinion> findOpinion(String findConditions, Integer page, Integer pageSize);
}
