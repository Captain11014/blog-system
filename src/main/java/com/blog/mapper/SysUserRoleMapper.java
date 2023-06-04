package com.blog.mapper;

import com.blog.model.SysUserRole;

import java.util.List;

/**
 * <p>
 * 用户角色 Mapper 接口
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface SysUserRoleMapper{


    /**
     * 更具用户id删除角色
     * @param userId
     * @return
     */
    int deleteSysUserRoleByUserId(Long userId);

    /**
     * 批量插入用户角色
     * @param list
     * @return
     */
    int batchUserRole(List<SysUserRole> list);

}
