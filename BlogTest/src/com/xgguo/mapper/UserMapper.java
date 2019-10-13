package com.xgguo.mapper;

import com.xgguo.bean.User;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface UserMapper {
    @Select("select * from tb_user")
    @Results({
            @Result(id = true, column = "user_id", property = "userId")
    })
    List<User> findUser();

    /**
     * 根据用户名和密码查找用户
     *
     * @param userNick
     * @param userPwd
     * @return
     */
    @Select("select * from tb_user where user_nick = #{userNick} and user_pwd = #{userPwd}")
    User findUserByNickAndPwd(@Param("userNick") String userNick, @Param("userPwd") String userPwd);

    /**
     * 插入邮箱，用户名，密码实现注册
     *
     * @param userEmail
     * @param userNick
     * @param userPwd
     * @param now
     * @return
     */
    @Insert("insert into tb_user(user_email,user_nick,user_pwd,user_login_date,user_ip) values(#{userEmail},#{userNick},#{userPwd},#{now},#{userIp})")
    Integer addUserBaseInfo(@Param("userEmail") String userEmail, @Param("userNick") String userNick, @Param("userPwd") String userPwd, @Param("now") String now, @Param("userIp") String ipAddress);

    @Select("select * from tb_user where user_id = #{user_id}")
    User selectUserByUid(@Param("user_id") int user_id);
}
