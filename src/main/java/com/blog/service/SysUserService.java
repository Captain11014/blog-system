package com.blog.service;

import com.blog.model.SysUser;

import java.util.List;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface SysUserService {

    /**
     * 查询用户
     *
     * @param id 用户主键
     * @return 用户
     */
    public SysUser selectSysUserById(Long id);

    /**
     * 查询用户列表
     *
     * @param sysUser 用户
     * @return 用户集合
     */
    public List<SysUser> selectSysUserList(SysUser sysUser);

    /**
     * 新增用户
     *
     * @param sysUser 用户
     * @return 结果
     */
    public int insertSysUser(SysUser sysUser);

    /**
     * 修改用户
     *
     * @param sysUser 用户
     * @return 结果
     */
    public int updateSysUser(SysUser sysUser);

    /**
     * 批量删除用户
     *
     * @param ids 需要删除的用户主键集合
     * @return 结果
     */
    public int deleteSysUserByIds(Long[] ids);

    /**
     * 删除用户信息
     *
     * @param id 用户主键
     * @return 结果
     */
    public int deleteSysUserById(Long id);

    /**
     * 用户分配角色
     * @param userId
     * @param roleIds
     * @return
     */
    public int insertAuthRole(Long userId,Long[] roleIds);

}
