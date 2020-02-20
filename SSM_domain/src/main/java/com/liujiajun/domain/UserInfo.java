package com.liujiajun.domain;

import java.util.List;

/**
 * 对应数据库中users表
 */
public class UserInfo {
    private Integer id;
    private String username;
    private String password;
    private String phone;
    private String qq;
    private String email;
    private String address;
    private String description;
    private Integer role;
    private String roleStr;
    private Integer status;
    private String statusStr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public String getRoleStr() {
        if(role==1){
            roleStr="admin";
        }
        if(role==2){
            roleStr="user";
        }
        return roleStr;
    }

    public void setRoleStr(String roleStr) {
        this.roleStr = roleStr;
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
        return "UserInfo{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", qq='" + qq + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", description='" + description + '\'' +
                ", role=" + role +
                ", roleStr='" + roleStr + '\'' +
                ", status=" + status +
                ", statusStr='" + statusStr + '\'' +
                '}';
    }
}
