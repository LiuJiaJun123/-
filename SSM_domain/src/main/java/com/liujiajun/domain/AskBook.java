package com.liujiajun.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//求购书籍
public class AskBook {
    private Integer askbook_id;    //书籍Id
    private UserInfo userInfo;  //求购用户信息
    private String askbook_name;   //书名
    private Category categoryInfo;   //书籍类别信息
    private String author;      //作者
    private String appearance;  //书籍外观（几成新）
    private String description; //描述
    private String imgUrl;      //图片路径
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date time;          //求购时间
    private Integer status;     //状态，是否在售
    private String statusStr;

    public Integer getAskbook_id() {
        return askbook_id;
    }

    public void setAskbook_id(Integer askbook_id) {
        this.askbook_id = askbook_id;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public String getAskbook_name() {
        return askbook_name;
    }

    public void setAskbook_name(String askbook_name) {
        this.askbook_name = askbook_name;
    }

    public Category getCategoryInfo() {
        return categoryInfo;
    }

    public void setCategoryInfo(Category categoryInfo) {
        this.categoryInfo = categoryInfo;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
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
        return "AskBook{" +
                "askbook_id=" + askbook_id +
                ", userInfo=" + userInfo +
                ", askbook_name='" + askbook_name + '\'' +
                ", categoryInfo=" + categoryInfo +
                ", author='" + author + '\'' +
                ", appearance='" + appearance + '\'' +
                ", description='" + description + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", time=" + time +
                ", status=" + status +
                ", statusStr='" + statusStr + '\'' +
                '}';
    }
}
