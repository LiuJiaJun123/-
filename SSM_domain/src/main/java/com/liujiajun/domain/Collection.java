package com.liujiajun.domain;

//收藏
public class Collection {

    private Book bookInfo;
    private UserInfo userInfo;
    private Integer sellStatus;     //状态，收藏的书籍是否已经被卖出。0 为没被卖出，1为被卖出 , 默认是0
    private String sellStatusStr;

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

    public Integer getSellStatus() {
        return sellStatus;
    }

    public void setSellStatus(Integer sellStatus) {
        this.sellStatus = sellStatus;
    }

    public String getSellStatusStr() {
        this.sellStatusStr = sellStatusStr;

        if(sellStatus==0){
            sellStatusStr="未开启";
        }
        if(sellStatus==1){
            sellStatusStr="开启";
        }
        return sellStatusStr;
    }

    public void setSellStatusStr(String sellStatusStr) {
        this.sellStatusStr=sellStatusStr;
    }



    @Override
    public String toString() {
        return "Collection{" +
                "bookInfo=" + bookInfo +
                ", userInfo=" + userInfo +
                ", sellStatus=" + sellStatus +
                ", sellStatusStr='" + sellStatusStr + '\'' +
                '}';
    }
}
