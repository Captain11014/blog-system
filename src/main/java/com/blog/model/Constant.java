package com.blog.model;

/**
 * @author 姓陈的
 * 2023/6/5 21:53
 */
public class Constant {

    /**
     * 1代表管理员
     */
    public static final Long USER_ADMIN = 1L;

    /**
     * 用户状态（0：正常 ）
     */
    public static final String USER_STATUS_TRUE = "0";

    /**
     * 用户状态（1：停用）
     */
    public static final String USER_STATUS_FALSE = "1";

    /**
     * 角色状态（0正常）
     */
    public static final String ROLE_STATUS_TRUE = "0";

    /**
     * 角色状态（1停用）
     */
    public static final String ROLE_STATUS_FALSE = "1";

    /**
     * 删除标志（0代表存在 ）
     */
    public static final String DEL_FLAG_TRUE = "0";

    /**
     * 删除标志（2代表删除）
     */
    public static final String DEL_FLAG_FALSE = "2";

    /**
     * 菜单状态(0:禁止)
     */
    public static final String MENU_STATUS_FALSE = "0";

    /**
     * 菜单状态(1:正常)
     */
    public static final String MENU_STATUS_TRUE = "1";

    /**
     * 资源映射路径 前缀
     */
    public static final String RESOURCE_PREFIX = "/profile";

    /**
     * 操作类型SELECT
     */
    public static final String OPERATE_SELECT = "SELECT";
    /**
     * 操作类型INDERT
     */
    public static final String OPERATE_INSERTE = "INSERTE";
    /**
     * 操作类型UPDATE
     */
    public static final String OPERATE_UPDATE = "UPDATE";
    /**
     * 操作类型DELETE
     */
    public static final String OPERATE_DELETE = "DELETE";

    /**
     * 权限的key
     */
    public static final String PERMS_NAME = "permsList_";



}
