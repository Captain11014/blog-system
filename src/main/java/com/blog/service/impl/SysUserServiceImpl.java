package com.blog.service.impl;

import com.blog.mapper.SysUserRoleMapper;
import com.blog.model.SysUser;
import com.blog.mapper.SysUserMapper;
import com.blog.model.SysUserRole;
import com.blog.service.SysUserRoleService;
import com.blog.service.SysUserService;
import com.blog.util.DateUtils;
import com.blog.util.MD5;
import com.blog.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author 姓陈的
 * @since 2023-05-23
 */
@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

    /**
     * 查询用户
     *
     * @param id 用户主键
     * @return 用户
     */
    @Override
    public SysUser selectSysUserById(Long id)
    {
        return sysUserMapper.selectSysUserById(id);
    }

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    @Override
    public SysUser selectSysUserByUsername(String username) {
        return sysUserMapper.selectSysUserByUsername(username);
    }

    /**
     * 查询用户列表
     *
     * @param sysUser 用户
     * @return 用户
     */
    @Override
    public List<SysUser> selectSysUserList(SysUser sysUser)
    {
        return sysUserMapper.selectSysUserList(sysUser);
    }

    /**
     * 新增用户
     *
     * @param sysUser 用户
     * @return 结果
     */
    @Override
    public int insertSysUser(SysUser sysUser)
    {
        //设置系统时间
        sysUser.setCreateTime(DateUtils.getNowDate());
        //md5加密密码
        if(StringUtil.isNotEmpty(sysUser.getPassword())){
            sysUser.setPassword(MD5.encrypt(sysUser.getPassword()));
        }
        return sysUserMapper.insertSysUser(sysUser);
    }

    /**
     * 修改用户
     *
     * @param sysUser 用户
     * @return 结果
     */
    @Override
    public int updateSysUser(SysUser sysUser)
    {
        sysUser.setUpdateTime(DateUtils.getNowDate());
        if(StringUtil.isNotEmpty(sysUser.getPassword())){
            sysUser.setPassword(MD5.encrypt(sysUser.getPassword()));
        }
        return sysUserMapper.updateSysUser(sysUser);
    }

    /**
     * 批量删除用户
     * @param ids 需要删除的用户主键
     * @return 结果
     */
    @Override
    public int deleteSysUserByIds(Long[] ids)
    {
        return sysUserMapper.deleteSysUserByIds(ids);
    }

    /**
     * 删除用户信息
     *
     * @param id 用户主键
     * @return 结果
     */
    @Override
    public int deleteSysUserById(Long id)
    {
        return sysUserMapper.deleteSysUserById(id);
    }

    /**
     * 用户分配角色
     * @param userId
     * @param roleIds
     * @return
     */
    @Override
    @Transactional
    public int insertAuthRole(Long userId, Long[] roleIds) {

        sysUserRoleMapper.deleteSysUserRoleByUserId(userId);
        List<SysUserRole> list = new ArrayList<>();
        if(StringUtil.isNotNull(roleIds)){
            for (Long roleId : roleIds){
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setUserId(userId);
                sysUserRole.setRoleId(roleId);
                list.add(sysUserRole);
            }
        }

        return sysUserRoleMapper.batchUserRole(list);
    }

}
