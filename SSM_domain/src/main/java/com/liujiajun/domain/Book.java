package com.liujiajun.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//书籍
public class Book {
    private Integer book_id;    //书籍Id
    private Integer user_id;    //用户Id
    private String book_name;   //书名
    private Integer category;   //书籍类别
    private String author;      //作者
    private Double price;       //价格
    private String appearance;  //书籍外观（几成新）
    private String description; //描述
    private String imgUrl;      //图片路径
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date time;          //上市时间
    private Integer status;     //状态，是否在售
    private String statusStr;

    public Integer getBook_id() {
        return book_id;
    }

    public void setBook_id(Integer book_id) {
        this.book_id = book_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public Integer getCategory() {
        return category;
    }

    public void setCategory(Integer category) {
        this.category = category;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getAppearance() {
        return appearance;
    }

    public void setAppearance(String appearance) {
        this.appearance = appearance;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStatusStr() {
        if(status==0){
            statusStr="未开启";
        }
        if(status==1){
            statusStr="开启";
        }
        return statusStr;
    }

    public void setStatusStr(String statusStr) {
        this.statusStr = statusStr;
    }


    @Override
    public String toString() {
        return "Book{" +
                "book_id=" + book_id +
                ", user_id=" + user_id +
                ", book_name='" + book_name + '\'' +
                ", category=" + category +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", appearance='" + appearance + '\'' +
                ", description='" + description + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", time=" + time +
                ", status=" + status +
                ", statusStr='" + statusStr + '\'' +
                '}';
    }
}
