package com.blog.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.io.Serializable;


/**
 * <p>
 * 角色菜单
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class SysRoleMenu extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private Long id;

    private Long roleId;

    private Long menuId;


    /**
     * 删除标志（0代表存在 2代表删除）
     */
    private String delFlag;


}
