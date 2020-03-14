package com.liujiajun.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

//用户意见
public class Opinion {

    private Integer opinion_id;  //用户意见Id
    private UserInfo userInfo; //发布人id
    private String title; //标题
    private String description; //意见内容
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date time; //发布时间
    private String timeStr;

    public Integer getOpinion_id() {
        return opinion_id;
    }

    public void setOpinion_id(Integer opinion_id) {
        this.opinion_id = opinion_id;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getTimeStr() {
        if(time!=null){
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            timeStr = sdf.format(time);
        }
        return timeStr;
    }

    public void setTimeStr(String visitTimeStr) {
        this.timeStr = timeStr;
    }

    @Override
    public String toString() {
        return "Opinion{" +
                "opinion_id=" + opinion_id +
                ", userInfo=" + userInfo +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", time=" + time +
                '}';
    }
}
