package com.liujiajun.service;

import com.liujiajun.domain.Book;
import com.liujiajun.domain.Role;
import com.liujiajun.domain.UserInfo;
import org.apache.ibatis.annotations.Select;
//import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.util.List;

//public interface IUserService extends UserDetailsService {
public interface IUserService  {


    List<UserInfo> findAll() throws Exception;

    public List<UserInfo> findAll(int page,int pageSize) throws Exception;

    public void register(UserInfo userInfo) throws Exception;

    //添加用户
    public void save(UserInfo userInfo) throws Exception;

    //添加用户时，查看用户是否已经存在
    public Boolean findNameExist(String username) throws Exception;

    //根据id查找用户
    public UserInfo findById(Integer id) throws Exception;

    //根据姓名查找用户(登录时使用的)
    UserInfo findByName(String username) throws Exception;

    //根据姓名模糊查抄用户（管理员进行用户管理时的模糊查找）
    List<UserInfo> findByUsername(String username,Integer page,Integer pageSize) throws Exception;


    //删除用户
    void delete(String[] selectIds);

    //查找可以添加的角色
    public List<Role> findRoleCanAdd(String id) throws Exception;

    //用户添加角色
    public void addRole(String userId, String[] roleIds);

    //用户信息修改
    void update(UserInfo userInfo) throws Exception;

    //用户的角色修改
    void updateRole(String id, String[] roleIds);

    //查找所有除了管理员的 普通用户
    List<UserInfo> findUserExpectAdmin();


    //修改个人信息
    void updatePersonalData(UserInfo userInfo);
}
