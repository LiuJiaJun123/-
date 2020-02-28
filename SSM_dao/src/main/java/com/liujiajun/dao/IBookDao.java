package com.liujiajun.dao;

import com.liujiajun.domain.Book;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("bookDao")
public interface IBookDao {

    /**
     * 查找所有
     * @return
     */
    @Select("select * from book")
    List<Book> findAll();


    /**
     * 保存
     * @param book
     */
    @Insert("insert into book(user_id,book_name,category,author,price,appearance,description,imgUrl,time,status) " +
            "values(#{user_id},#{book_name},#{category},#{author},#{price},#{appearance},#{description},#{imgUrl},#{time},#{status})")
    void save(Book book);

    //根据书籍Id查找 书籍
    @Select("select * from book where book_id=#{book_id}")
    Book findByBookId(Integer book_id);

    //修改图片信息
    @Update({"update book set book_name=#{book_name},category=#{category},author=#{author}," +
            "price=#{price},appearance=#{appearance},description=#{description},imgUrl=#{imgUrl}" +
            ",status=#{status} where book_id=#{book_id}"})
    void update(Book book);

    //没有修改 书籍图片时 调用的修改方法
    @Update({"update book set book_name=#{book_name},category=#{category},author=#{author}," +
            "price=#{price},appearance=#{appearance},description=#{description}" +
            ",status=#{status} where book_id=#{book_id}"})
    void updateWithoutImg(Book book);
}
