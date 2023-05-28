package com.blog.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;
import java.time.LocalDate;


/**
 * <p>
 * 用户表
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class SysUser extends BaseEntity{

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
     * 出生日期
     */
    private LocalDate birthday;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 手机
     */
    private String phone;

    /**
     * 头像地址
     */
    private String headUrl;

    /**
     * 微信openId
     */
    private String openId;

    /**
     * 描述
     */
    private String description;

    /**
     * 状态（0：正常 1：停用）
     */
    private Integer status;


    /**
     * 备注
     */
    private String remark;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;


}
