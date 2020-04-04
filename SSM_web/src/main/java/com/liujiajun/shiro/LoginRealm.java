package com.liujiajun.shiro;

import com.liujiajun.domain.UserInfo;
import com.liujiajun.service.IUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

@Component
public class LoginRealm extends AuthorizingRealm {


    @Autowired
    private IUserService userService;


    /**
     * 获取身份信息，我们可以在这个方法中，从数据库获取该用户的权限和角色信息
     *     当调用权限验证时，就会调用此方法
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        String username = (String) getAvailablePrincipal(principalCollection);

        UserInfo userInfo = null;
        try {
            userInfo = userService.findByName(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String roleName = userInfo.getRoleStr();
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        Set<String> r = new HashSet<String>();
        r.add(roleName);
        info.setRoles(r);

        return info;
    }

    /**
     * 在这个方法中，进行身份验证
     *         login时调用
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //用户名
        String username = (String) token.getPrincipal();
        //密码
        String password = new String((char[])token.getCredentials());


        UserInfo userInfo = null;
        try {
            userInfo = userService.findByName(username);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (userInfo == null) {
            //没有该用户名
            System.out.println("没有该用户名1111111");
//            throw new RuntimeException("没有该用户名1111111");
            throw new UnknownAccountException();
        } else if (!password.equals(userInfo .getPassword())) {
            //密码错误
            System.out.println("密码错误11111111");
//            throw new RuntimeException("密码错误11111111");
            throw new IncorrectCredentialsException();
        }
        if(userInfo.getStatus()==1){
            AuthenticationInfo aInfo = new SimpleAuthenticationInfo(username, password, getName());
            return aInfo;
        }

        return null;
    }


}
