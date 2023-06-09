package com.blog.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;


/**
 * <p>
 * 角色
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class SysRole extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 角色id
     *
     */
    private Long id;

    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 角色编码
     */
    private String roleCode;

    /**
     *角色状态（0正常 1停用）
     */
    private String status;

    /**
     * 描述
     */
    private String description;

    /**
     *用户是否存在此角色标识 默认不存在
     */
    private boolean flag = false;

    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;

    /** 菜单组 */
    private Long[] menuIds;


    public boolean isAdmin()
    {
        return isAdmin(this.id);
    }

    public static boolean isAdmin(Long roleId)
    {
        return roleId != null && 1L == roleId;
    }


}
