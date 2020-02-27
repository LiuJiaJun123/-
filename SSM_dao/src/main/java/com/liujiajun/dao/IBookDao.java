package com.liujiajun.dao;

import com.liujiajun.domain.Book;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
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
}
