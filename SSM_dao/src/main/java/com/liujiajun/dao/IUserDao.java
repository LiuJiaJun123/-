package com.liujiajun.dao;

import com.liujiajun.domain.Role;
import com.liujiajun.domain.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public interface IUserDao {

    /**
     * 查找所有用户
     * @param page
     * @param pageSize
     * @return
     * @throws Exception
     */
    @Select("select * from users")
    public List<UserInfo> findAll() throws Exception;


    /**
     * 保存用户信息
     * @param userInfo
     * @throws Exception
     */
    @Insert("insert into users(username,password,phone,qq,email,address,description,role,status) " +
            "values(#{username},#{password},#{phone},#{qq},#{email},#{address},#{description},#{role},#{status})")
    public void save(UserInfo userInfo) throws Exception;


    /**
     * 添加用户时，查看用户名是否存在
     * @param username
     * @return
     * @throws Exception
     */
    @Select("select * from users where username=#{username}")
    public UserInfo findNameExist(String username) throws Exception;


    /**
     * 查看用户详情
     * @param id
     * @return
     * @throws Exception
     */
    @Select("select * from users where id=#{id}")
    @Results({
            @Result(id = true,column = "id",property = "id"),
            @Result(column = "username",property = "username"),
            @Result(column = "password",property = "password"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "qq",property = "qq"),
            @Result(column = "email",property = "email"),
            @Result(column = "address",property = "address"),
            @Result(column = "description",property = "description"),
            @Result(column = "role",property = "role"),
            @Result(column = "status",property = "status"),
    })
    public UserInfo findById(Integer id) throws Exception;


    /**
     * 查找该用户可以添加的角色，从角色表查找 该用户没有的角色
     * @param
     * @return
     */
    @Select("select * from role where id not in(select roleId from users_role where userId=#{id})")
    public List<Role> findRoleCanAdd(String id);


    //用户添加角色
    @Insert("insert into users_role(userId,roleId) values(#{userId},#{roleId})")
    public void addRole(@Param("userId") String userId, @Param("roleId") String roleId);


    //删除用户
    @Delete("delete from users where id=#{id}")
    void delete(String id);

    //根据姓名查找用户(登录时使用的)
    @Select("select * from users where username=#{username}")
    UserInfo findByName(String username);

    //根据姓名模糊查找用户（管理员进行用户管理时的模糊查找）
    @Select("select * from users where username like #{username}")
    List<UserInfo> findByUsername(String username);

    //用户信息修改
    @Update("update users set username=#{username},password=#{password},phone=#{phone},qq=#{qq},email=#{email}," +
            "address=#{address},description=#{description},role=#{role},status=#{status} where id=#{id}")
    void update(UserInfo userInfo);

    //用户删除角色
    @Delete("delete from users_role where userId=#{id}")
    void deleteRole(String id);

    //查找所有除了管理员的 普通用户
    @Select("select * from users where role = 2")
    List<UserInfo> findUserExpectAdmin();

    //修改个人信息
    @Update("update users set username=#{username},phone=#{phone},qq=#{qq},email=#{email}," +
            "address=#{address},description=#{description} where id=#{id}")
    void updatePersonalData(UserInfo userInfo);
}
