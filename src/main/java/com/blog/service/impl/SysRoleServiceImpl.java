package com.blog.service.impl;

import com.blog.model.SysRole;
import com.blog.mapper.SysRoleMapper;
import com.blog.service.SysRoleService;
import com.blog.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 角色 服务实现类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@Service
public class SysRoleServiceImpl  implements SysRoleService {


    @Autowired
    private SysRoleMapper sysRoleMapper;

    /**
     * 查询角色
     *
     * @param id 角色主键
     * @return 角色
     */
    @Override
    public SysRole selectSysRoleById(Long id)
    {
        return sysRoleMapper.selectSysRoleById(id);
    }

    /**
     * 查询角色列表
     *
     * @param sysRole 角色
     * @return 角色
     */
    @Override
    public List<SysRole> selectSysRoleList(SysRole sysRole)
    {
        return sysRoleMapper.selectSysRoleList(sysRole);
    }

    /**
     * 新增角色
     *
     * @param sysRole 角色
     * @return 结果
     */
    @Override
    public int insertSysRole(SysRole sysRole)
    {
        sysRole.setCreateTime(DateUtils.getNowDate());
        return sysRoleMapper.insertSysRole(sysRole);
    }

    /**
     * 修改角色
     *
     * @param sysRole 角色
     * @return 结果
     */
    @Override
    public int updateSysRole(SysRole sysRole)
    {
        sysRole.setUpdateTime(DateUtils.getNowDate());
        return sysRoleMapper.updateSysRole(sysRole);
    }

    /**
     * 批量删除角色
     *
     * @param ids 需要删除的角色主键
     * @return 结果
     */
    @Override
    public int deleteSysRoleByIds(Long[] ids)
    {
        return sysRoleMapper.deleteSysRoleByIds(ids);
    }

    /**
     * 删除角色信息
     *
     * @param id 角色主键
     * @return 结果
     */
    @Override
    public int deleteSysRoleById(Long id)
    {
        return sysRoleMapper.deleteSysRoleById(id);
    }

}
