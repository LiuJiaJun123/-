package com.liujiajun.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//收藏
public class Collection {

    private Book bookInfo;
    private UserInfo userInfo;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date time;          //收藏时间


    public Book getBookInfo() {
        return bookInfo;
    }

    public void setBookInfo(Book bookInfo) {
        this.bookInfo = bookInfo;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Collection{" +
                "bookInfo=" + bookInfo +
                ", userInfo=" + userInfo +
                ", time=" + time +
                '}';
    }
}
