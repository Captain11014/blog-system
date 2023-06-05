package com.blog.mapper;

import com.blog.model.SysRoleMenu;

import java.util.List;


/**
 * <p>
 * 角色菜单 Mapper 接口
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface SysRoleMenuMapper {

    /**
     * 根据角色Id删除
     * @param roleId
     * @return
     */
    int delRoleMenuByRoleId(Long roleId);

    int batchInsert(List<SysRoleMenu> list);

}
