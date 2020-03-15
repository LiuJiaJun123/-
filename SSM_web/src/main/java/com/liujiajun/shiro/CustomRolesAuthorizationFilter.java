package com.liujiajun.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

//AuthorizationFilter抽象类事项了javax.servlet.Filter接口，它是个过滤器。
public class CustomRolesAuthorizationFilter extends AuthorizationFilter {

    @Override
    protected boolean isAccessAllowed(ServletRequest req, ServletResponse resp, Object mappedValue) throws Exception {
        Subject subject = getSubject(req, resp);
        String[] rolesArray = (String[]) mappedValue;
        System.out.println("rolesArray"+rolesArray.toString());
        for (String s : rolesArray) {
            System.out.println(s+"8888");
        }
        if (rolesArray == null || rolesArray.length == 0) { // 没有角色限制，有权限访问
            return true;
        }
        for (int i = 0; i < rolesArray.length; i++) {
            System.out.println("$$$$$$$$$$$$$");
            System.out.println(subject.hasRole("admin"));
            boolean admin = subject.hasRole("admin");
            boolean user = subject.hasRole("user");
            if(admin){
                System.out.println("admin111111111111");
            }
            if(user){
                System.out.println("user1111111111111");
            }


            if (subject.hasRole(rolesArray[i])) { // 若当前用户是rolesArray中的任何一个，则有权限访问
                return true;
            }
        }

        return false;
    }
}


