package com.liujiajun.service;

import com.liujiajun.domain.AskBook;

import java.util.List;

public interface IAskBookService {

    List<AskBook> findAll() throws Exception;

    public List<AskBook> findAll(int page, int pageSize) throws Exception;

    //保存
    void save(AskBook askbook);

    //根据书籍Id查找 书籍
    AskBook findByAskBookId(Integer askbook_id);

    //修改书籍信息
    void update(AskBook askbook);

    //没有修改 书籍图片时 调用的修改方法
    void updateWithoutImg(AskBook askbook);

    //删除书籍
    void delete(Integer askbook_id);

    //批量删除书籍
    void delete(Integer[] selectIds);

    //根据 书籍名称或卖家名称 搜索书籍
    List<AskBook> findAskBook(String findConditions, Integer page, Integer pageSize);

    //订单添加后，要 修改对应书籍的状态为0
    void updateStatus(Integer askbook_id);

    //根据用户id查找 求购书籍 （我的求购书籍 页面）
    List<AskBook> findAskBookByUserId(Integer id, Integer page);

    //用户取消求购书籍
    void cancel(Integer askbook_id);
}
