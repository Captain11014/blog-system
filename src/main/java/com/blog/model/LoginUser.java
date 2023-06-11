package com.blog.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * @author 姓陈的
 * 2023/6/5 21:43
 */
@Data
public class LoginUser extends BaseEntity {


    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    private Long id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 手机
     */
    private String email;

    /**
     * 头像地址
     */
    private String headUrl;


    /**
     * 状态（0：正常 1：停用）
     */
    private String status;

}
