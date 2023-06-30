package com.blog.mapper;

import com.blog.model.SysRole;


import java.util.List;


/**
 * <p>
 * 角色 Mapper 接口
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
public interface SysRoleMapper {


    /**
     * 查询角色
     * @param id 角色主键
     * @return 角色
     */
    public SysRole selectSysRoleById(Long id);

    /**
     * 根据用户id查询用户所拥有的角色
     * @param userId
     * @return
     */
    public List<SysRole> selectRoleByUserId(Long userId);

    /**
     * 查询角色列表
     *
     * @param sysRole 角色
     * @return 角色集合
     */
    public List<SysRole> selectSysRoleList(SysRole sysRole);

    /**
     * 新增角色
     *
     * @param sysRole 角色
     * @return 结果
     */
    public int insertSysRole(SysRole sysRole);

    /**
     * 修改角色
     *
     * @param sysRole 角色
     * @return 结果
     */
    public int updateSysRole(SysRole sysRole);

    /**
     * 删除角色
     *
     * @param id 角色主键
     * @return 结果
     */
    public int deleteSysRoleById(Long id);

    /**
     * 批量删除角色
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRoleByIds(Long[] ids);



}
