package com.blog.mapper;

import com.blog.model.SysUser;

import java.util.List;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface SysUserMapper {

    /**
     * 查询用户
     *
     * @param id 用户主键
     * @return 用户
     */
    public SysUser selectSysUserById(Long id);

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    public SysUser selectSysUserByUsername(String username);

    /**
     * 查询用户列表
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
     * 删除用户
     *
     * @param id 用户主键
     * @return 结果
     */
    public int deleteSysUserById(Long id);

    /**
     * 批量删除用户
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserByIds(Long[] ids);

}
