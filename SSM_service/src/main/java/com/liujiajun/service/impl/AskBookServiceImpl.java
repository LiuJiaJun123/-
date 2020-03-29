package com.liujiajun.service.impl;

import com.github.pagehelper.PageHelper;
import com.liujiajun.dao.IAskBookDao;
import com.liujiajun.domain.AskBook;
import com.liujiajun.domain.FindBookCondition;
import com.liujiajun.service.IAskBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("askBookService")
public class AskBookServiceImpl implements IAskBookService {

    @Autowired
    private IAskBookDao askBookDao;

    @Override
    public List<AskBook> findAll() throws Exception {
        return askBookDao.findAll();
    }

    @Override
    public List<AskBook> findAll(int page, int pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        return askBookDao.findAll();
    }

    @Override
    public List<AskBook> findAll(FindBookCondition findBookCondition, int page, int pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        if(findBookCondition.getSearchContent().length()==0){
            findBookCondition.setSearchContent(null);
        }else {
            findBookCondition.setSearchContent("%"+findBookCondition.getSearchContent()+"%");
        }
        return askBookDao.findByCondition(findBookCondition);
    }

//    保存
    @Override
    public void save(AskBook askbook) {
        askBookDao.save(askbook);
    }

    //根据书籍Id查找 书籍
    @Override
    public AskBook findByAskBookId(Integer askbook_id) {
        return askBookDao.findByAskBookId(askbook_id);
    }

    //修改书籍信息
    @Override
    public void update(AskBook askbook) {
        askBookDao.update(askbook);
    }

    //没有修改 书籍图片时 调用的修改方法
    @Override
    public void updateWithoutImg(AskBook askbook) {
        askBookDao.updateWithoutImg(askbook);
    }

    //删除书籍
    @Override
    public void delete(Integer askbook_id) {
        askBookDao.delete(askbook_id);
    }

    //批量删除书籍
    @Override
    public void delete(Integer[] selectIds) {
        for (Integer askbook_id : selectIds) {
            askBookDao.delete(askbook_id);
        }
    }

    //根据 书籍名称或卖家名称 搜索书籍
    @Override
    public List<AskBook> findAskBook(String findConditions, Integer page, Integer pageSize) {
        findConditions="%"+findConditions+"%";
        PageHelper.startPage(page,pageSize);
        List<AskBook> findAskBook = askBookDao.findAskBook(findConditions);
        return findAskBook;
    }

    //订单添加后，要 修改对应书籍的状态为0
    @Override
    public void updateStatus(Integer askbook_id) {
        askBookDao.updateStatus(askbook_id);
    }

    //根据用户id查找 求购书籍 （我的求购书籍 页面）
    @Override
    public List<AskBook> findAskBookByUserId(Integer user_id, Integer page) {
        PageHelper.startPage(page,3);
        return askBookDao.findByUserId(user_id);
    }

    //用户取消求购书籍
    @Override
    public void cancel(Integer askbook_id) {
        askBookDao.updateStatus(askbook_id);
    }


}
