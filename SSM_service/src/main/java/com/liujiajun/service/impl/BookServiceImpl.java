package com.liujiajun.service.impl;

import com.github.pagehelper.PageHelper;
import com.liujiajun.dao.IBookDao;
import com.liujiajun.domain.Book;
import com.liujiajun.domain.FindBookCondition;
import com.liujiajun.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.crypto.Data;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("bookService")
public class BookServiceImpl implements IBookService {

    @Autowired
    private IBookDao bookDao;

    @Override
    public List<Book> findAll() throws Exception {
        return bookDao.findAll();
    }

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
    public void delete(Integer book_id) {
        bookDao.delete(book_id);
    }

    //批量删除书籍
    @Override
    public void delete(Integer[] selectIds) {
        for (Integer book_id : selectIds) {
            bookDao.delete(book_id);
        }
    }

    //根据 书籍名称或卖家名称 搜索书籍
    @Override
    public List<Book> findBook(String findConditions, Integer page, Integer pageSize) {
        findConditions="%"+findConditions+"%";
        PageHelper.startPage(page,pageSize);
        List<Book> findBook = bookDao.findBook(findConditions);
        return findBook;
    }

//    //订单添加后，要 修改对应书籍的状态为0
//    @Override
//    public void updateStatus(Integer book_id) {
//        bookDao.updateStatus(book_id);
//    }

    //查找最新上架的图书
    @Override
    public List<Book> findNewBook() {
        return bookDao.findNewBook();
    }

    //查找价格最低的书籍
    @Override
    public List<Book> findCheapBook() {
        return bookDao.findCheapBook();
    }

    //查找精品推荐的书籍
    @Override
    public List<Book> findGoodBook() {
        return bookDao.findGoodBook();
    }

    //根据用户id查找书籍
    @Override
    public List<Book> findByUserId(int user_id) {
        return bookDao.findByUserId(user_id);
    }

    //根据用户id查找书籍 (我发布的商品 页面)
    @Override
    public List<Book> findByUserId(int user_id, int page) {
        PageHelper.startPage(page,3);
        return bookDao.findByUserId(user_id);
    }

    //出售书籍
    @Override
    public void sell(Integer book_id) {
        //出售时间
        Date sell_time=new Date();
        bookDao.sell(book_id,sell_time);
    }

    //根据选中的条件查找书籍
    @Override
    public List<Book> findByConditions(FindBookCondition findBookCondition,Integer page,Integer pageSize) {

        if(findBookCondition.getSelectCategory().length()==0){
            findBookCondition.setSelectCategory(null);
        }
        if(findBookCondition.getSelectAppearance().length()==0){
            findBookCondition.setSelectAppearance(null);
        }
        if(findBookCondition.getSelectPrice().length()==0){
            findBookCondition.setSelectPrice(null);
        }


//        String appearanceStr = null;
//        String selectAppearance = findBookCondition.getSelectAppearance();
//        if( selectAppearance !=null){
//            if(selectAppearance.equals("9成新")){
//                appearanceStr =  "('9')" ;
//            }
//            if(selectAppearance.equals("8成新")){
//                appearanceStr =  "('8成新')" ;
//            }
//            if(selectAppearance.equals("6~7成新")){
//                appearanceStr =  "('6成新','7成新')" ;
//            }
//            if(selectAppearance.equals("4~5成新")){
//                appearanceStr =  "('4成新','5成新')" ;
//            }
//            if(selectAppearance.equals("1~3成新")){
//                appearanceStr =  "('1成新','2成新','3成新')" ;
//            }
//        }


        int minPrice = 0;
        int maxPrice = 0;
        String selectPrice = findBookCondition.getSelectPrice();
        if(selectPrice!=null){
            if(selectPrice.equals("10元以内")){
                minPrice = 0;
                maxPrice=10;
            }
            if(selectPrice.equals("10~20元")){
                minPrice = 10;
                maxPrice=20;
            }
            if(selectPrice.equals("20~40元")){
                minPrice = 20;
                maxPrice= 40;
            }
            if(selectPrice.equals("40元以上")){
                minPrice = 40;
                maxPrice = 99999;
            }
        }

        PageHelper.startPage(page,pageSize);
        return bookDao.findByConditions(findBookCondition,minPrice,maxPrice);
    }


}
