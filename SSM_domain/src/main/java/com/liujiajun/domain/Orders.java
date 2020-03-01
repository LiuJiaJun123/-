package com.liujiajun.domain;

import com.liujiajun.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Orders {

    private Integer orders_id;
    //private Integer book_id;
    //private Integer seller_id;
    //private Integer buyer_id;
    private Book book;
    private UserInfo seller;
    private UserInfo buyer;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date order_time;
    private String order_time_str;
    private String description;

    public Integer getOrders_id() {
        return orders_id;
    }

    public void setOrders_id(Integer orders_id) {
        this.orders_id = orders_id;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public UserInfo getSeller() {
        return seller;
    }

    public void setSeller(UserInfo seller) {
        this.seller = seller;
    }

    public UserInfo getBuyer() {
        return buyer;
    }

    public void setBuyer(UserInfo buyer) {
        this.buyer = buyer;
    }

    public Date getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Date order_time) {
        this.order_time = order_time;
    }

    public String getOrder_time_str() {
        if(order_time!=null){
            order_time_str= DateUtils.Date2String(order_time,"yyyy-MM-dd HH:mm");
        }
        return order_time_str;
    }

    public void setOrder_time_str(String order_time_str) {
        this.order_time_str = order_time_str;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orders_id=" + orders_id +
                ", book=" + book +
                ", seller=" + seller +
                ", buyer=" + buyer +
                ", order_time=" + order_time +
                ", description='" + description + '\'' +
                '}';
    }
}

