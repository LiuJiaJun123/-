package com.liujiajun.domain;

//公告
public class Announcement {

    private Integer announcement_id;  //公告Id
    private UserInfo userInfo; //发布人id
    private String title; //公告标题
    private String description; //描述
    private String imgUrl;  // 图片路径
    private Integer status; //状态
    private String statusStr;

    public Integer getAnnouncement_id() {
        return announcement_id;
    }

    public void setAnnouncement_id(Integer announcement_id) {
        this.announcement_id = announcement_id;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
        return "Announcement{" +
                "announcement_Id=" + announcement_id +
                ", userInfo=" + userInfo +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", status=" + status +
                '}';
    }
}
