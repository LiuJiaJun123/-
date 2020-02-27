package com.liujiajun.service.impl;

import com.github.pagehelper.PageHelper;
import com.liujiajun.BCryptPasswordEncoderUtils;
import com.liujiajun.dao.IPermissionDao;
import com.liujiajun.dao.IRole_PermissionDao;
import com.liujiajun.dao.IUserDao;
import com.liujiajun.dao.IUsers_RoleDao;
import com.liujiajun.domain.Permission;
import com.liujiajun.domain.Role;
import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.IUserService;
import com.sun.org.apache.bcel.internal.generic.IUSHR;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Autowired
    private IUsers_RoleDao users_roleDao;

    @Autowired
    private IPermissionDao permissionDao;


    @Override
    public List<UserInfo> findAll(int page,int pageSize) throws Exception {
        PageHelper.startPage(page,pageSize);
        return userDao.findAll(page,pageSize);
    }


    @Override
    public void save(UserInfo userInfo) throws Exception {
        userDao.save(userInfo);
    }

//     注册
    @Override
    public void register(UserInfo userInfo) throws Exception {
        userInfo.setRole(2);  //普通用户
        userInfo.setStatus(1);
        userDao.save(userInfo);
    }

    //添加用户时，查看用户是否已经存在
    @Override
    public Boolean findNameExist(String username) throws Exception {
        UserInfo user = userDao.findNameExist(username);
        if(user!=null){
            //用户名已经存在，不可注册
            return false;
        }
        //用户名不存在，可以注册
        return true;
    }



    @Override
    public UserInfo findById(String id) throws Exception {
        return userDao.findById(id);
    }

    //根据姓名查找用户 (登录时使用的)
    @Override
    public UserInfo findByName(String username) throws Exception {
        return userDao.findByName(username);
    }

    //根据姓名模糊查抄用户（管理员进行用户管理时的模糊查找）
    @Override
    public List<UserInfo> findByUsername(String username,Integer page,Integer pageSize) throws Exception {
        username="%"+username+"%";
        PageHelper.startPage(page,pageSize);
        List<UserInfo> findUser = userDao.findByUsername(username);
        return findUser;
    }

    //删除用户
    @Override
    public void delete(String[] selectIds) {
        for (String id : selectIds) {
            //先从users_role删除记录
//            users_roleDao.deleteByUserId(id);
            //再从users表删除记录
            userDao.delete(id);
        }
    }


    //查找可以添加的角色
    @Override
    public List<Role> findRoleCanAdd(String id) throws Exception {

        return userDao.findRoleCanAdd(id);
    }

    //用户添加角色
    @Override
    public void addRole(String userId, String[] roleIds) {

        for (String roleId : roleIds) {
            userDao.addRole(userId,roleId);
        }

    }

//    用户信息修改
    @Override
    public void update(UserInfo userInfo) throws Exception {
//        //如果密码被更改，就进行密码加密
//        UserInfo user = userDao.findById(userInfo.getId());
//        if( ! user.getPassword().equals(userInfo.getPassword())){
//            //密码加密
//            userInfo.setPassword(bCryptPasswordEncoder.encode(userInfo.getPassword()));
//        }
//        userDao.update(userInfo);
        userDao.update(userInfo);
    }

    //用户的角色修改
    @Override
    public void updateRole(String id, String[] roleIds) {
        //先从users_role表删除原来的
        userDao.deleteRole(id);
        //接着再插入新的
        for (String roleId : roleIds) {
            userDao.addRole(id,roleId);
        }
    }

    //查找所有除了管理员的 普通用户
    @Override
    public List<UserInfo> findUserExpectAdmin() {
        return userDao.findUserExpectAdmin();
    }


}
