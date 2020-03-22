package com.liujiajun.dao;

import com.liujiajun.domain.Book;
import com.liujiajun.domain.FindBookCondition;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository("bookDao")
public interface IBookDao {


    /**
     * 查找所有
     * @return
     */
    @Select("select * from book where status = 1 ")
    @Results(id = "resultMap",value = {
            @Result(id = true,column = "book_id",property = "book_id"),
            @Result(column = "user_id",property = "userInfo",one = @One( select = "com.liujiajun.dao.IUserDao.findById")),
            @Result(column = "book_name",property = "book_name"),
            @Result(column = "category",property = "categoryInfo",one = @One( select = "com.liujiajun.dao.ICategoryDao.findById")),
            @Result(column = "author",property = "author"),
            @Result(column = "price",property = "price"),
            @Result(column = "appearance",property = "appearance"),
            @Result(column = "description",property = "description"),
            @Result(column = "imgUrl",property = "imgUrl"),
            @Result(column = "time",property = "time"),
            @Result(column = "sell_time",property = "sell_time"),
            @Result(column = "status",property = "status")
    })
    List<Book> findAll();


    /**
     * 保存
     * @param book
     */
    @Insert("insert into book(user_id,book_name,category,author,price,appearance,description,imgUrl,time,status) " +
            "values(#{userInfo.id},#{book_name},#{categoryInfo.category_id},#{author},#{price},#{appearance},#{description},#{imgUrl},#{time},#{status})")
    void save(Book book);

    //根据书籍Id查找 书籍
    @Select("select * from book where book_id=#{book_id}")
    @ResultMap("resultMap")
    Book findByBookId(Integer book_id);

    //有修改图片信息时，调用的修改方法
    @Update({"update book set book_name=#{book_name},category=#{categoryInfo.category_id},author=#{author}," +
            "price=#{price},appearance=#{appearance},description=#{description},imgUrl=#{imgUrl}" +
            ",status=#{status} where book_id=#{book_id}"})
    void update(Book book);

    //没有修改 书籍图片时 调用的修改方法
    @Update({"update book set book_name=#{book_name},category=#{categoryInfo.category_id},author=#{author}," +
            "price=#{price},appearance=#{appearance},description=#{description}" +
            ",status=#{status} where book_id=#{book_id}"})
    void updateWithoutImg(Book book);

    //删除书籍
    @Delete("delete from book where book_id=#{book_id}")
    void delete(Integer book_id);

    //根据书籍名称或卖家名称 模糊搜索书籍
    @Select("select * from book where book_name like #{findConditions} " +
            "or user_id in (select id from users where username like #{findConditions}) " +
            "or category in (select category_id from category where category_name like #{findConditions})")
    @ResultMap("resultMap")
    List<Book> findBook(String findConditions);

    //根据类别ID 查找书籍，删除类别时调用
    @Select("select * from book where category=#{category_id}")
    List<Book> findByCategoryId(Integer category_id);

//    //订单添加后，要 修改对应书籍的状态为0
//    @Update("update book set status=0 where book_id=#{book_id}")
//    void updateStatus(Integer book_id);

    //查找最新上架的图书
    @Select("select * from book order by time desc limit 0,5")
    @ResultMap("resultMap")
    List<Book> findNewBook();

    //查找价格最低的书籍
    @Select("select * from book order by price limit 0,5")
    @ResultMap("resultMap")
    List<Book> findCheapBook();

    //查找精品推荐的书籍
    @Select("select * from book limit 0,5")
    @ResultMap("resultMap")
    List<Book> findGoodBook();

    //根据用户id查找书籍 (我发布的商品 页面)
    @Select("select * from book where user_id=#{user_id} and status = 1 order by book_id desc")
    @ResultMap("resultMap")
    List<Book> findByUserId(int user_id);

    //出售书籍
    @Update("update book set status=0,sell_time=#{sell_time} where book_id=#{book_id}")
    void sell(@Param("book_id")Integer book_id, @Param("sell_time")Date sell_time);


    //根据选中的条件查找书籍
    @Select("<script> SELECT * from book" +
            "<where>"+
            "<if test='findBookCondition.selectCategory != null'>and category in (select category_id from category where category_name = #{findBookConditionselectCategory}) </if> "+
            "<if test='findBookCondition.selectAppearance != null'>and appearance = #{findBookCondition.selectAppearance} </if> "+
            "<if test='findBookCondition.selectPrice != null'>and price &gt;= #{minPrice} and price &lt;= #{maxPrice} </if> "+
            "</where>"+
            "</script>")
    List<Book> findByConditions(@Param("findBookCondition") FindBookCondition findBookCondition,
                                @Param("minPrice")Integer minPrice,@Param("maxPrice")Integer maxPrice);



}
